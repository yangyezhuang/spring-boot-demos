package com.example.minio.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.minio.mapper.MediaFilesMapper;
import com.example.minio.pojo.*;
import com.example.minio.service.MediaFileService;
import com.j256.simplemagic.ContentInfo;
import com.j256.simplemagic.ContentInfoUtil;
import io.minio.*;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.io.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;


@Slf4j
@Service
public class MediaFileServiceImpl implements MediaFileService {
    @Autowired
    MediaFileService currentProxy;

    @Autowired
    MediaFilesMapper mediaFilesMapper;

    @Autowired
    MinioClient minioClient;

    @Value("${minio.bucket.files}")
    private String bucket_mediafiles;

    @Value("${minio.bucket.videofiles}")
    private String bucket_videofiles;


    @Override
    public PageResult<MediaFiles> queryMediaFiles(PageParams pageParams, QueryMediaParamsDto queryMediaParamsDto) {
        //构建查询条件对象
        LambdaQueryWrapper<MediaFiles> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(!StringUtils.isEmpty(queryMediaParamsDto.getFilename()), MediaFiles::getFilename, queryMediaParamsDto.getFilename());
        queryWrapper.eq(!StringUtils.isEmpty(queryMediaParamsDto.getFileType()), MediaFiles::getFileType, queryMediaParamsDto.getFileType());
        //分页对象
        Page<MediaFiles> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        // 查询数据内容获得结果
        Page<MediaFiles> pageResult = mediaFilesMapper.selectPage(page, queryWrapper);
        // 获取数据列表
        List<MediaFiles> list = pageResult.getRecords();
        // 获取数据总数
        long total = pageResult.getTotal();
        // 构建结果集
        PageResult<MediaFiles> mediaListResult = new PageResult<>(list, total, pageParams.getPageNo(), pageParams.getPageSize());
        return mediaListResult;
    }

    //====================================================================================

    /**
     * 上传文件
     *
     * @param uploadFileParamsDto 文件信息
     * @param localFilePath
     * @return
     */
    @Override
    public UploadFileResultDto uploadFile(UploadFileParamsDto uploadFileParamsDto, String localFilePath) {
        // 获取文件名
        String filename = uploadFileParamsDto.getFilename();
        // 获取扩展名
        String extension = filename.substring(filename.lastIndexOf("."));
        // 获取mimeType
        String mimeType = getMimeType(extension);
        // 获取子目录
        String defaultFolderPath = getDefaultFolderPath();
        // 获取文件md5（文件名）
        String fileMd5 = getFileMd5(new File(localFilePath));
        String objectName = defaultFolderPath + fileMd5 + extension;
        // 上传到minio
        boolean result = addMediaFilesToMinIO(localFilePath, mimeType, bucket_mediafiles, objectName);
        if (!result) {
            OrangeException.cast("上传文件失败");
        }

        // 将文件信息保存到数据库
        MediaFiles mediaFiles = currentProxy.addMediaFilesToBd(fileMd5, uploadFileParamsDto, bucket_mediafiles, objectName);
        if (mediaFiles == null) {
            OrangeException.cast("文件上传后保存信息失败");
        }
        // 准备返回对象
        UploadFileResultDto uploadFileResultDto = new UploadFileResultDto();
        BeanUtils.copyProperties(mediaFiles, uploadFileResultDto);
        return uploadFileResultDto;
    }


    /**
     * 将文件上传到minio
     *
     * @param localFilePath
     * @param mimeTyep
     * @param bucket
     * @param objectName
     * @return
     */
    public boolean addMediaFilesToMinIO(String localFilePath, String mimeTyep, String bucket, String objectName) {
        try {
            minioClient.uploadObject(UploadObjectArgs.builder()
                    .bucket(bucket)
                    .filename(localFilePath)
                    .object(objectName)
                    .contentType(mimeTyep)
                    .build());
            log.debug("上传文件成功，bucket:{},objectName:{}", bucket, objectName);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            log.error("上传文件出错，bucket:{},objectName:{}", bucket, objectName, e.getMessage());
        }
        return false;
    }


    /**
     * 向数据库保存文件信息
     *
     * @param fileMd5
     * @param uploadFileParamsDto
     * @param bucket
     * @param objectName
     * @return
     */
    @Transactional
    public MediaFiles addMediaFilesToBd(String fileMd5, UploadFileParamsDto uploadFileParamsDto, String bucket, String objectName) {
        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMd5);
        if (mediaFiles == null) {
            mediaFiles = new MediaFiles();
            BeanUtils.copyProperties(uploadFileParamsDto, mediaFiles);
            // 文件id
            mediaFiles.setId(fileMd5);
            // 桶
            mediaFiles.setBucket(bucket);
            // file_path
            mediaFiles.setFilePath(objectName);
            // url
            mediaFiles.setUrl("/" + bucket + "/" + objectName);
            //上传时间
            mediaFiles.setCreateDate(LocalDateTime.now());
            // 插入数据库
            int insert = mediaFilesMapper.insert(mediaFiles);
            if (insert <= 0) {
                log.debug("向数据库保存文件信息失败，bucket:{}，objectName:{}", bucket, objectName);
                return null;
            }
            return mediaFiles;
        }
        return mediaFiles;
    }


    /**
     * 根据文件拓展名获取对应文件类型
     *
     * @param extension
     * @return
     */
    private String getMimeType(String extension) {
        if (extension == null) {
            extension = "";
        }
        // 根据拓展名取mimeType
        ContentInfo extensionMatch = ContentInfoUtil.findExtensionMatch(extension);
        String mimeType = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        if (extensionMatch != null) {
            mimeType = extensionMatch.getMimeType();
        }
        return mimeType;
    }


    /**
     * 获取文件路径
     *
     * @return
     */
    private String getDefaultFolderPath() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String folder = df.format(new Date()).replace("-", "/") + '/';
        return folder;
    }


    /**
     * 获取文件md5
     *
     * @param file
     * @return
     */
    private String getFileMd5(File file) {
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            String fileMd5 = DigestUtils.md5Hex(fileInputStream);
            return fileMd5;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    /**
     * 检查文件是否存在
     *
     * @param fileMd5 文件的md5
     * @return
     */
    @Override
    public RestResponse<Boolean> checkFile(String fileMd5) {
        // 先查询数据库
        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMd5);
        if (mediaFiles != null) {
            String bucketName = mediaFiles.getBucket();
            String filePath = mediaFiles.getFilePath();
            // 数据库存在查询minio
            GetObjectArgs getObjectArgs = GetObjectArgs.builder()
                    .bucket(bucketName)
                    .object(filePath)
                    .build();
            try {
//                FileInputStream inputStream = minioClient.getObject(getObjectArgs);
                GetObjectResponse inputStream = minioClient.getObject(getObjectArgs);
                if (inputStream != null) {
                    return RestResponse.success(true);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        // 文件不存在
        return RestResponse.success(false);
    }

    /**
     * 检查分块是否存在
     *
     * @param fileMd5    文件的MD5
     * @param chunkIndex 分块序号
     * @return
     */
    @Override
    public RestResponse<Boolean> checkChunk(String fileMd5, int chunkIndex) {
        // 分块存储路径：md5前两位为两个子目录，chunk存储分块文件
        // 根据md5得到分块文件路径
        String chunkFileFolderPath = getChunkFileFolderPath(fileMd5);

        // 数据库存在查询minio
        GetObjectArgs getObjectArgs = GetObjectArgs.builder()
                .bucket(bucket_videofiles)
                .object(chunkFileFolderPath + chunkIndex)
                .build();
        try {
            GetObjectResponse inputStream = minioClient.getObject(getObjectArgs);
            if (inputStream != null) {
                // 文件已存在
                return RestResponse.success(true);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 文件不存在
        return RestResponse.success(false);
    }


    /**
     * 根据md5获取分块路径
     *
     * @param fileMd5
     * @return
     */
    private String getChunkFileFolderPath(String fileMd5) {
        return fileMd5.substring(0, 1) + "/" + fileMd5.substring(1, 2) + "/" + fileMd5 + "/chunk/";
    }


    /**
     * 将分块文件上传到minio
     *
     * @param fileMd5            文件MD5
     * @param chunk              分块序号
     * @param localChunkFilePath
     * @return
     */
    @Override
    public RestResponse uploadChunk(String fileMd5, int chunk, String localChunkFilePath) {
        // 分块文件路径
        String chunkFileFolderPath = getChunkFileFolderPath(fileMd5) + chunk;
        // 设置文件类型
        String mimeType = getMimeType(null);
        // 将分块文件上传到minio
        boolean b = addMediaFilesToMinIO(localChunkFilePath, mimeType, bucket_videofiles, chunkFileFolderPath);
        if (!b) {
            return RestResponse.validfail(false, "上传分块文件失败");
        }
        return RestResponse.success(true);
    }

    /**
     * 根据md5获取合并后的路径
     *
     * @param fileMd5
     * @param fileExt 文件拓展名
     * @return
     */
    private String getFilePathByMd5(String fileMd5, String fileExt) {
        return fileMd5.substring(0, 1) + "/" + fileMd5.substring(1, 2) + "/" + fileMd5 + "/" + fileMd5 + fileExt;
    }

    /**
     * 合并分块
     *
     * @param fileMd5             文件MD5
     * @param chunkTotal          分块数量
     * @param uploadFileParamsDto 文件信息
     * @return
     * @throws IOException
     */
    @Override
    public RestResponse mergeChunks(String fileMd5, int chunkTotal, UploadFileParamsDto uploadFileParamsDto) throws IOException {
        // 分块文件所在目录
        String chunkFileFolderPath = getChunkFileFolderPath(fileMd5);
        // 找到所有的分块文件
        List<ComposeSource> sources = Stream.iterate(0, i -> ++i).limit(chunkTotal)
                .map(i -> ComposeSource.builder().bucket(bucket_videofiles).object(chunkFileFolderPath + i).build()).collect(Collectors.toList());
        // 获取源文件名称
        String filename = uploadFileParamsDto.getFilename();
        // 扩展名
        String extension = filename.substring(filename.lastIndexOf("."));
        // 获取合并后的文件存储路径
        String objectName = getFilePathByMd5(fileMd5, extension);
        // =========================合并=================================
        try {
            minioClient.composeObject(ComposeObjectArgs.builder()
                    .bucket(bucket_videofiles)
                    .object(objectName)
                    .sources(sources) // 源文件
                    .build());
        } catch (Exception e) {
            e.printStackTrace();
            log.error("文件合并出错，bucket:{}，objectName:{}，错误信息:{}", bucket_videofiles, objectName, e.getMessage());
            return RestResponse.validfail(false, "文件合并出错");
        }
        // =================校验合并后的文件和源文件是否一致=======================
        // 先下载合并后的文件
        File file = downloadFileFromMinio(bucket_videofiles, objectName);
        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            // 计算合并后的md5
            String mergeFileMd5 = DigestUtils.md5Hex(fileInputStream);
            // 比较原始文件md5和合并后的文件md5
            if (!fileMd5.equals(mergeFileMd5)) {
                log.error("校验合并文件md5值不一致,原始文件:{},合并文件:{}", fileMd5, mergeFileMd5);
                return RestResponse.validfail(false, "文件合并出错");
            }
            // 文件大小
            uploadFileParamsDto.setFileSize(file.length());
        } catch (Exception e) {
            e.printStackTrace();
            return RestResponse.validfail(false, "文件合并出错");
        }

        // ===================将文件信息入库==========================
        // 通过代理对象调用入库方法，以便执行事务
        MediaFiles mediaFiles = currentProxy.addMediaFilesToBd(fileMd5, uploadFileParamsDto, bucket_videofiles, objectName);
        if (mediaFiles == null) {
            return RestResponse.validfail(false, "文件信息入库失败");
        }
        // =====================清理分块文件=========================
        clearChunkFiles(chunkFileFolderPath, chunkTotal);

        return RestResponse.success(true);
    }


    /**
     * 从Minio中下载文件
     *
     * @param bucket     桶
     * @param objectName 桶内文件路径
     * @return
     */
    public File downloadFileFromMinio(String bucket, String objectName) {
        File minioFile = null;
        FileOutputStream outputStream = null;
        try {
            InputStream stream = minioClient.getObject(GetObjectArgs.builder()
                    .bucket(bucket)
                    .object(objectName)
                    .build());
            // 创建临时文件
            minioFile = File.createTempFile("minio", ".merge");
            outputStream = new FileOutputStream(minioFile);
            IOUtils.copy(stream, outputStream);
            return minioFile;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return null;
    }


    /**
     * 清理分块文件
     *
     * @param chunkFileFolderPath
     * @param chunkTotal
     */
    private void clearChunkFiles(String chunkFileFolderPath, int chunkTotal) {
        Iterable<DeleteObject> objects = Stream.iterate(0, i -> ++i).limit(chunkTotal).map(i -> new DeleteObject(chunkFileFolderPath + i)).collect(Collectors.toList());

        Iterable<Result<DeleteError>> results = minioClient.removeObjects(RemoveObjectsArgs.builder()
                .bucket(bucket_videofiles)
                .objects(objects)
                .build());
        // 真正的删除
        results.forEach(f -> {
            try {
                DeleteError deleteError = f.get();
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }

    /**
     * 根据媒资id获取媒资
     *
     * @param mediaId
     * @return
     */
    @Override
    public MediaFiles getFileById(String mediaId) {
        MediaFiles mediaFiles = mediaFilesMapper.selectById(mediaId);
        return mediaFiles;
    }


//    /**
//     * @param companyId           机构id
//     * @param uploadFileParamsDto 文件信息
//     * @param bytes               文件字节数组
//     * @param folder              桶下边的子目录
//     * @param objectName          对象名称
//     */
//    @Override
//    public UploadFileResultDto uploadFile(Long companyId, UploadFileParamsDto uploadFileParamsDto, byte[] bytes, String folder, String objectName) {
//        String fileMD5 = DigestUtils.md5DigestAsHex(bytes);
//        if (StringUtils.isEmpty(folder)) {
//            // 如果目录不存在，则自动生成一个目录
//            folder = getFileFolder(true, true, true);
//        } else if (!folder.endsWith("/")) {
//            // 如果目录末尾没有 / ，替他加一个
//            folder = folder + "/";
//        }
//        if (StringUtils.isEmpty(objectName)) {
//            // 如果文件名为空，则设置其默认文件名为文件的md5码 + 文件后缀名
//            String filename = uploadFileParamsDto.getFilename();
//            objectName = fileMD5 + filename.substring(filename.lastIndexOf("."));
//        }
//        objectName = folder + objectName;
//        try {
//            addMediaFilesToMinIO(bytes, bucket_files, objectName);
//            MediaFiles mediaFiles = currentProxy.addMediaFilesToDB(companyId, uploadFileParamsDto, objectName, fileMD5, bucket_files);
//            UploadFileResultDto uploadFileResultDto = new UploadFileResultDto();
//            BeanUtils.copyProperties(mediaFiles, uploadFileResultDto);
//            return uploadFileResultDto;
//        } catch (Exception e) {
//            log.debug("上传过程中出错：{}", e.getMessage());
//            OrangeException.cast("上传过程中出错" + e.getMessage());
//        }
//        return null;
//    }

    /**
     * 将文件信息添加到文件表
     *
     * @param uploadFileParamsDto 上传文件的信息
     * @param objectName          对象名称
     * @param fileMD5             文件的md5码
     * @param bucket              桶
     */
    @Transactional
    public MediaFiles addMediaFilesToDB(UploadFileParamsDto uploadFileParamsDto, String objectName, String fileMD5, String bucket) {
        // 根据文件名获取Content-Type
        String contentType = getContentType(objectName);
        // 保存到数据库
        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMD5);
        if (mediaFiles == null) {
            mediaFiles = new MediaFiles();
            BeanUtils.copyProperties(uploadFileParamsDto, mediaFiles);
            mediaFiles.setId(fileMD5);
            mediaFiles.setBucket(bucket);
            mediaFiles.setCreateDate(LocalDateTime.now());
            mediaFiles.setFilePath(objectName);
            if (contentType.contains("image") || contentType.contains("mp4")) {
                mediaFiles.setUrl("/" + bucket + "/" + objectName);
            }
        }
        int insert = mediaFilesMapper.insert(mediaFiles);
        if (insert <= 0) {
            OrangeException.cast("保存文件信息失败");
        }

        return mediaFiles;
    }

//    /**
//     * 判断文件是否存在
//     *
//     * @param fileMd5 文件的md5
//     * @return
//     */
//    @Override
//    public RestResponse<Boolean> checkFile(String fileMd5) {
//        MediaFiles mediaFiles = mediaFilesMapper.selectById(fileMd5);
//        // 数据库中不存在，则直接返回false 表示不存在
//        if (mediaFiles == null) {
//            return RestResponse.success(false);
//        }
//        // 若数据库中存在，根据数据库中的文件信息，则继续判断bucket中是否存在
//        try {
//            InputStream inputStream = minioClient.getObject(GetObjectArgs
//                    .builder()
//                    .bucket(mediaFiles.getBucket())
//                    .object(mediaFiles.getFilePath())
//                    .build());
//            if (inputStream == null) {
//                return RestResponse.success(false);
//            }
//        } catch (Exception e) {
//            return RestResponse.success(false);
//        }
//        return RestResponse.success(true);
//    }

//    @Override
//    public RestResponse<Boolean> checkChunk(String fileMd5, int chunkIndex) {
//        // 获取分块目录
//        String chunkFileFolderPath = getChunkFileFolderPath(fileMd5);
//        String chunkFilePath = chunkFileFolderPath + chunkIndex;
//        try {
//            // 判断分块是否存在
//            InputStream inputStream = minioClient.getObject(GetObjectArgs
//                    .builder()
//                    .bucket(bucket_videofiles)
//                    .object(chunkFilePath)
//                    .build());
//            // 不存在返回false
//            if (inputStream == null) {
//                return RestResponse.success(false);
//            }
//        } catch (Exception e) {
//            // 出异常也返回false
//            return RestResponse.success(false);
//        }
//        // 否则返回true
//        return RestResponse.success();
//    }

//    /**
//     * 上传分块
//     *
//     * @param fileMd5 文件MD5
//     * @param chunk   分块序号
//     * @param bytes   文件字节
//     * @return
//     */
//    @Override
//    public RestResponse uploadChunk(String fileMd5, int chunk, byte[] bytes) {
//        // 分块文件路径
//        String chunkFilePath = getChunkFileFolderPath(fileMd5) + chunk;
//        try {
//            addMediaFilesToMinIO(bytes, bucket_mediafiles, chunkFilePath);
//            return RestResponse.success(true);
//        } catch (Exception e) {
//            log.debug("上传分块文件：{}失败：{}", chunkFilePath, e.getMessage());
//        }
//        return RestResponse.validfail("上传文件失败", false);
//    }
//
//    @Override
//    public RestResponse mergeChunks(Long companyId, String fileMd5, int chunkTotal, UploadFileParamsDto uploadFileParamsDto) {
//        // 下载分块文件
//        File[] chunkFiles = checkChunkStatus(fileMd5, chunkTotal);
//        // 获取源文件名
//        String fileName = uploadFileParamsDto.getFilename();
//        // 获取源文件扩展名
//        String extension = fileName.substring(fileName.lastIndexOf("."));
//        // 创建出临时文件，准备合并
//        File mergeFile = null;
//        try {
//            mergeFile = File.createTempFile(fileName, extension);
//        } catch (IOException e) {
//            OrangeException.cast("创建合并临时文件出错");
//        }
//        try {
//            // 缓冲区
//            byte[] buffer = new byte[1024];
//            // 写入流，向临时文件写入
//            try (RandomAccessFile raf_write = new RandomAccessFile(mergeFile, "rw")) {
//                // 遍历分块文件数组
//                for (File chunkFile : chunkFiles) {
//                    // 读取流，读分块文件
//                    try (RandomAccessFile raf_read = new RandomAccessFile(chunkFile, "r")) {
//                        int len;
//                        while ((len = raf_read.read(buffer)) != -1) {
//                            raf_write.write(buffer, 0, len);
//                        }
//                    }
//                }
//            } catch (Exception e) {
//                OrangeException.cast("合并文件过程中出错");
//            }
//            uploadFileParamsDto.setFileSize(mergeFile.length());
//            // 对文件进行校验，通过MD5值比较
//            try (FileInputStream mergeInputStream = new FileInputStream(mergeFile)) {
//                String mergeMd5 = org.apache.commons.codec.digest.DigestUtils.md5Hex(mergeInputStream);
//                if (!fileMd5.equals(mergeMd5)) {
//                    OrangeException.cast("合并文件校验失败");
//                }
//                log.debug("合并文件校验通过：{}", mergeFile.getAbsolutePath());
//            } catch (Exception e) {
//                OrangeException.cast("合并文件校验异常");
//            }
//            String mergeFilePath = getFilePathByMd5(fileMd5, extension);
//            // 将本地合并好的文件，上传到minio中，这里重载了一个方法
//            addMediaFilesToMinIO(mergeFile.getAbsolutePath(), bucket_videofiles, mergeFilePath);
//            log.debug("合并文件上传至MinIO完成{}", mergeFile.getAbsolutePath());
//            // 将文件信息写入数据库
//            MediaFiles mediaFiles = addMediaFilesToDB(companyId, uploadFileParamsDto, mergeFilePath, fileMd5, bucket_videofiles);
//            if (mediaFiles == null) {
//                OrangeException.cast("媒资文件入库出错");
//            }
//            log.debug("媒资文件入库完成");
//            return RestResponse.success();
//        } finally {
//            for (File chunkFile : chunkFiles) {
//                try {
//                    chunkFile.delete();
//                } catch (Exception e) {
//                    log.debug("临时分块文件删除错误：{}", e.getMessage());
//                }
//            }
//            try {
//                mergeFile.delete();
//            } catch (Exception e) {
//                log.debug("临时合并文件删除错误：{}", e.getMessage());
//            }
//        }
//    }

//    @Override
//    public MediaFiles getFileById(String id) {
//        MediaFiles mediaFiles = mediaFilesMapper.selectById(id);
//        if (mediaFiles == null || StringUtils.isEmpty(mediaFiles.getUrl())) {
//            OrangeException.cast("视频还没有转码处理");
//        }
//        return mediaFiles;
//    }

//    /**
//     * 根据MD5和文件扩展名，生成文件路径，例 /2/f/2f6451sdg/2f6451sdg.mp4
//     *
//     * @param fileMd5   文件MD5
//     * @param extension 文件扩展名
//     * @return
//     */
//    public String getFilePathByMd5(String fileMd5, String extension) {
//        return fileMd5.substring(0, 1) + "/" + fileMd5.substring(1, 2) + "/" + fileMd5 + "/" + fileMd5 + extension;
//    }

//    /**
//     * 将本地文件上传到minio
//     *
//     * @param filePath   本地文件路径
//     * @param bucket     桶
//     * @param objectName 对象名称
//     */
//    public void addMediaFilesToMinIO(String filePath, String bucket, String objectName) {
//        String contentType = getContentType(objectName);
//        try {
//            minioClient.uploadObject(UploadObjectArgs
//                    .builder()
//                    .bucket(bucket)
//                    .object(objectName)
//                    .filename(filePath)
//                    .contentType(contentType)
//                    .build());
//        } catch (Exception e) {
//            OrangeException.cast("上传到文件系统出错:" + e.getMessage());
//        }
//    }

//    /**
//     * 下载分块文件
//     *
//     * @param fileMd5    文件的MD5
//     * @param chunkTotal 总块数
//     * @return 分块文件数组
//     */
//    private File[] checkChunkStatus(String fileMd5, int chunkTotal) {
//        // 作为结果返回
//        File[] files = new File[chunkTotal];
//        // 获取分块文件目录
//        String chunkFileFolder = getChunkFileFolderPath(fileMd5);
//        for (int i = 0; i < chunkTotal; i++) {
//            // 获取分块文件路径
//            String chunkFilePath = chunkFileFolder + i;
//            File chunkFile = null;
//            try {
//                // 创建临时的分块文件
//                chunkFile = File.createTempFile("chunk" + i, null);
//            } catch (Exception e) {
//                OrangeException.cast("创建临时分块文件出错：" + e.getMessage());
//            }
//
//            chunkFile = downloadFileFromMinio(chunkFile, bucket_videofiles, chunkFilePath);
//            files[i] = chunkFile;
//        }
//        return files;
//    }


//    /**
//     * 获取分块文件的目录，例如文件的md5码为  1f2465f， 那么该文件的分块放在 /1/f/1f2465f下，即前两级目录为md5的前两位
//     *
//     * @param fileMd5
//     * @return
//     */
//    private String getChunkFileFolderPath(String fileMd5) {
//        return fileMd5.substring(0, 1) + "/" + fileMd5.substring(1, 2) + "/" + fileMd5 + "/" + "chunk" + "/";
//    }

//    /**
//     * @param bytes      文件字节数组
//     * @param bucket     桶
//     * @param objectName 对象名称 23/02/15/porn.mp4
//     */
//    public void addMediaFilesToMinIO(byte[] bytes, String bucket, String objectName) {
//        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
//        String contentType = getContentType(objectName);
//        try {
//            minioClient.putObject(PutObjectArgs.builder()
//                    .bucket(bucket)
//                    .object(objectName)
//                    .stream(byteArrayInputStream, byteArrayInputStream.available(), -1)
//                    .contentType(contentType)
//                    .build());
//        } catch (Exception e) {
//            log.debug("上传到文件系统出错:{}", e.getMessage());
//            throw new OrangeException("上传到文件系统出错");
//        }
//    }

    /**
     * 根据objectName获取对应的MimeType
     *
     * @param objectName 对象名称
     * @return
     */
    private static String getContentType(String objectName) {
        String contentType = MediaType.APPLICATION_OCTET_STREAM_VALUE; // 默认content-type为未知二进制流
        if (objectName.contains(".")) { // 判断对象名是否包含 .
            // 有 .  则划分出扩展名
            String extension = objectName.substring(objectName.lastIndexOf("."));
            // 根据扩展名得到content-type，如果为未知扩展名，例如 .abc之类的东西，则会返回null
            ContentInfo extensionMatch = ContentInfoUtil.findExtensionMatch(extension);
            // 如果得到了正常的content-type，则重新赋值，覆盖默认类型
            if (extensionMatch != null) {
                contentType = extensionMatch.getMimeType();
            }
        }
        return contentType;
    }

//    /**
//     * 自动生成目录
//     *
//     * @param year  是否包含年
//     * @param month 是否包含月
//     * @param day   是否包含日
//     */
//    private String getFileFolder(boolean year, boolean month, boolean day) {
//        StringBuffer stringBuffer = new StringBuffer();
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//        String dateString = dateFormat.format(new Date());
//        String[] split = dateString.split("-");
//        if (year) {
//            stringBuffer.append(split[0]).append("/");
//        }
//        if (month) {
//            stringBuffer.append(split[1]).append("/");
//        }
//        if (day) {
//            stringBuffer.append(split[2]).append("/");
//        }
//        return stringBuffer.toString();
//    }


}
