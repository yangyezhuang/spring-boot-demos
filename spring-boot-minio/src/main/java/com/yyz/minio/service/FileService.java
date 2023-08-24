package com.yyz.minio.service;

import com.yyz.minio.pojo.*;

import java.io.IOException;

public interface FileService {

    /**
     * @param pageParams          分页参数
     * @param queryMediaParamsDto 查询条件
     * @return PageResult<MediaFiles>
     */
    PageResult<MediaFiles> queryMediaFiles(PageParams pageParams, QueryMediaParamsDto queryMediaParamsDto);


    /**
     * @param uploadFileParamsDto 文件信息
     * @param localFilePath       文件路径
     * @return UploadFileResultDto
     */
    UploadFileResultDto uploadFile(UploadFileParamsDto uploadFileParamsDto, String localFilePath);

    /**
     * 检查文件是否存在
     *
     * @param fileMd5 文件MD5
     * @return boolean
     */
    RestResponse<Boolean> checkFile(String fileMd5);

    /**
     * 检查分块是否存在
     *
     * @param fileMd5    文件的MD5
     * @param chunkIndex 分块序号
     * @return boolean
     */
    RestResponse<Boolean> checkChunk(String fileMd5, int chunkIndex);

    /**
     * 上传分块
     *
     * @param fileMd5 文件MD5
     * @param chunk   分块序号
     * @return RestResponse
     */
    RestResponse uploadChunk(String fileMd5, int chunk, String localChunkFilePath);

    /**
     * 合并分块
     *
     * @param fileMd5             文件MD5
     * @param chunkTotal          分块数量
     * @param uploadFileParamsDto 文件信息
     * @return RestResponse
     */
    RestResponse mergeChunks(String fileMd5, int chunkTotal, UploadFileParamsDto uploadFileParamsDto) throws IOException;


    /**
     * 根据媒资id获取媒资
     *
     * @param mediaId 媒资id
     * @return MediaFiles
     */
    MediaFiles getFileById(String mediaId);

    /**
     * 从minio下载文件
     *
     * @param file       下载后的文件
     * @param bucket     minio中的桶
     * @param objectName minio中的对象名称
     * @return file
     */
//    File downloadFileFromMinio(File file, String bucket, String objectName);

    /**
     * 将本地文件上传到MinIO
     *
     * @param localFilePath 本地文件路径
     * @param bucket        上传到的桶
     * @param objectName    上传到的objectName
     */
    boolean addMediaFilesToMinIO(String localFilePath, String mimeTyep, String bucket, String objectName);

    /**
     * 将文件信息添加到文件表
     *
     * @param uploadFileParamsDto 上传文件的信息
     * @param objectName          对象名称
     * @param fileMd5             文件md5
     * @param bucket              桶
     */
    MediaFiles addMediaFilesToDB(String fileMd5, UploadFileParamsDto uploadFileParamsDto, String bucket, String objectName);


    /**
     * 删除文件
     *
     * @param fileId
     * @return
     */
    boolean deleteObject(String fileId);

    /**
     * 根据文件md5，生成在minio中的文件路径
     *
     * @param fileMd5   文件md5
     * @param extension 文件后缀名
     * @return path
     */
//    String getFilePathByMd5(String fileMd5, String extension);
}
