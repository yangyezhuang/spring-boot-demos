package com.yyz.minio.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.j256.simplemagic.ContentInfo;
import com.j256.simplemagic.ContentInfoUtil;
import com.yyz.minio.mapper.FileMapper;
import com.yyz.minio.pojo.*;
import com.yyz.minio.service.FileService;
import io.minio.*;
import io.minio.messages.DeleteError;
import io.minio.messages.DeleteObject;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

@Service
public class FileServiceImpl implements FileService {

    private static final Logger log = LoggerFactory.getLogger(FileServiceImpl.class);


    @Autowired
    FileService currentProxy;

    @Autowired
    FileMapper fileMapper;

    @Autowired
    MinioClient minioClient;

    @Value("${minio.bucket.files}")
    private String bucket_mediafiles;

    @Value("${minio.bucket.videofiles}")
    private String bucket_videofiles;

    /**
     * 查询媒资
     *
     * @param pageParams          分页参数
     * @param queryMediaParamsDto 查询条件
     * @return MediaFiles
     */
    @Override
    public PageResult<MediaFiles> queryMediaFiles(PageParams pageParams, QueryMediaParamsDto queryMediaParamsDto) {
        //构建查询条件对象
        LambdaQueryWrapper<MediaFiles> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.like(!StringUtils.isEmpty(queryMediaParamsDto.getFilename()), MediaFiles::getFilename, queryMediaParamsDto.getFilename());
        queryWrapper.eq(!StringUtils.isEmpty(queryMediaParamsDto.getFileType()), MediaFiles::getFileType, queryMediaParamsDto.getFileType());
        //分页对象
        Page<MediaFiles> page = new Page<>(pageParams.getPageNo(), pageParams.getPageSize());
        // 查询数据内容获得结果
        Page<MediaFiles> pageResult = fileMapper.selectPage(page, queryWrapper);
        // 获取数据列表
        List<MediaFiles> list = pageResult.getRecords();
        // 获取数据总数
        long total = pageResult.getTotal();
        // 构建结果集
        PageResult<MediaFiles> mediaListResult = new PageResult<>(list, total, pageParams.getPageNo(), pageParams.getPageSize());
        return mediaListResult;
    }


    /**
     * 上传文件
     *
     * @param uploadFileParamsDto 文件信息
     * @param localFilePath       文件路径
     * @return uploadFileResultDto
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
            MinioException.cast("上传文件失败");
        }

        // 将文件信息保存到数据库
        uploadFileParamsDto.setFileType(mimeType);
        MediaFiles mediaFiles = currentProxy.addMediaFilesToDB(fileMd5, uploadFileParamsDto, bucket_mediafiles, objectName);
        if (mediaFiles == null) {
            MinioException.cast("上传后保存数据库失败");
        }
        // 准备返回对象
        UploadFileResultDto uploadFileResultDto = new UploadFileResultDto();
        BeanUtils.copyProperties(mediaFiles, uploadFileResultDto);
        return uploadFileResultDto;
    }


    /**
     * 将文件上传到minio
     *
     * @param bucket        桶
     * @param localFilePath 文件路径
     * @param objectName    文件名
     * @param mimeTyep      文件类型
     * @return boolean
     */
    public boolean addMediaFilesToMinIO(String localFilePath, String mimeTyep, String bucket, String objectName) {
        try {
            minioClient.uploadObject(UploadObjectArgs.builder()
                    .bucket(bucket)
                    .filename(localFilePath)
                    .object(objectName)
                    .contentType(mimeTyep)
                    .build());
            log.debug("上传文件成功, bucket:{}, objectName:{}", bucket, objectName);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            log.error("上传文件出错, bucket:{}, objectName:{}", bucket, objectName, e.getMessage());
        }
        return false;
    }


    /**
     * 向数据库保存文件信息
     *
     * @param fileMd5             文件MD5
     * @param uploadFileParamsDto 文件参数
     * @param bucket              桶
     * @param objectName          文件名
     * @return MediaFiles
     */
    @Transactional
    public MediaFiles addMediaFilesToDB(String fileMd5, UploadFileParamsDto uploadFileParamsDto, String bucket, String objectName) {
        MediaFiles mediaFiles = fileMapper.selectById(fileMd5);
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
            int insert = fileMapper.insert(mediaFiles);
            if (insert <= 0) {
                log.debug("向数据库保存文件信息失败, bucket:{}, objectName:{}", bucket, objectName);
                return null;
            }
            return mediaFiles;
        }
        return mediaFiles;
    }

    /**
     * 删除文件
     *
     * @param fileId 文件id
     * @return
     */
    @Override
    public boolean deleteObject(String fileId) {
        // 查询数据库
        MediaFiles mediaFiles = fileMapper.selectById(fileId);
        // 获取文件信息
        String bucket = mediaFiles.getBucket();
        String objName = mediaFiles.getFilePath();
        // 删除数据库的文件信息
        fileMapper.deleteById(fileId);
        // 删除minio上的文件
        try {
            minioClient.removeObject(RemoveObjectArgs.builder().bucket(bucket).object(objName).build());
            log.info("minio文件删除成功");
            return true;
        } catch (Exception e) {
            log.error("minio文件删除失败");
        }
        return false;
    }

    /**
     * 根据文件拓展名获取对应文件类型
     *
     * @param extension 文件拓展名
     * @return mimeType
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
     * 获取文件路径，以日期作为格式
     *
     * @return folder
     */
    private String getDefaultFolderPath() {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        String folder = df.format(new Date()).replace("-", "/") + '/';
        return folder;
    }


    /**
     * 获取文件md5
     *
     * @param file 文件
     * @return fileMd5
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
     * @param fileMd5 文件md5
     * @return boolean
     */
    @Override
    public RestResponse<Boolean> checkFile(String fileMd5) {
        // 先查询数据库
        MediaFiles mediaFiles = fileMapper.selectById(fileMd5);
        if (mediaFiles != null) {
            String bucketName = mediaFiles.getBucket();
            String filePath = mediaFiles.getFilePath();
            // 数据库存在查询minio
            GetObjectArgs getObjectArgs = GetObjectArgs.builder()
                    .bucket(bucketName)
                    .object(filePath)
                    .build();
            try {
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
     * @param fileMd5    文件MD5
     * @param chunkIndex 分块序号
     * @return boolean
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
     * @param fileMd5 文件MD5
     * @return chunkFileFolderPath
     */
    private String getChunkFileFolderPath(String fileMd5) {
        return fileMd5.substring(0, 1) + "/" + fileMd5.substring(1, 2) + "/" + fileMd5 + "/chunk/";
    }


    /**
     * 将分块文件上传到minio
     *
     * @param fileMd5            文件MD5
     * @param chunk              分块序号
     * @param localChunkFilePath 本地分块文件路径
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
     * @param fileMd5 文件MD5
     * @param fileExt 文件拓展名
     * @return filePath
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
                log.error("校验合并文件md5值不一致, 原始文件:{},合并文件:{}", fileMd5, mergeFileMd5);
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
        MediaFiles mediaFiles = currentProxy.addMediaFilesToDB(fileMd5, uploadFileParamsDto, bucket_videofiles, objectName);
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
     * @return minioFile
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
     * @param chunkFileFolderPath 分块文件路径
     * @param chunkTotal          分块数量
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
     * 根据id获取媒资
     *
     * @param mediaId id
     * @return mediaFiles
     */
    @Override
    public MediaFiles getFileById(String mediaId) {
        MediaFiles mediaFiles = fileMapper.selectById(mediaId);
        return mediaFiles;
    }


    /**
     * 根据objectName获取对应的MimeType
     *
     * @param objectName 对象名称
     * @return contentType
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

}
