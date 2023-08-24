package com.example.minio.service;

//import com.orange.base.model.PageParams;
//import com.orange.base.model.PageResult;
//import com.orange.base.model.RestResponse;
//import com.orange.media.model.dto.QueryMediaParamsDto;
//import com.orange.media.model.dto.UploadFileParamsDto;
//import com.orange.media.model.dto.UploadFileResultDto;

import com.example.minio.pojo.*;

import java.io.File;
import java.io.IOException;

public interface MediaFileService {

    /**
     * @param pageParams          分页参数
     * @param queryMediaParamsDto 查询条件
     * @return com.xuecheng.base.model.PageResult<com.xuecheng.media.model.po.MediaFiles>
     */
    PageResult<MediaFiles> queryMediaFiles(PageParams pageParams, QueryMediaParamsDto queryMediaParamsDto);


    //    /**
//     * @param companyId           机构id
//     * @param uploadFileParamsDto 文件信息
//     * @param bytes               文件字节数组
//     * @param folder              桶下边的子目录
//     * @param objectName          对象名称
//     * @return com.xuecheng.media.model.dto.UploadFileResultDto
//     */
//    UploadFileResultDto uploadFile(Long companyId, UploadFileParamsDto uploadFileParamsDto, byte[] bytes, String folder, String objectName);
    UploadFileResultDto uploadFile(UploadFileParamsDto uploadFileParamsDto, String localFilePath);

    /**
     * 将文件信息添加到文件表
     *
     * @param companyId           机构id
     * @param uploadFileParamsDto 上传文件的信息
     * @param objectName          对象名称
     * @param fileMD5             文件md5码
     * @param bucket              桶
     */
//    MediaFiles addMediaFilesToDB(Long companyId, UploadFileParamsDto uploadFileParamsDto, String objectName, String fileMD5, String bucket);

    /**
     * 检查文件是否存在
     *
     * @param fileMd5 文件的md5
     * @return
     */
    RestResponse<Boolean> checkFile(String fileMd5);

    /**
     * 检查分块是否存在
     *
     * @param fileMd5    文件的MD5
     * @param chunkIndex 分块序号
     * @return
     */
    RestResponse<Boolean> checkChunk(String fileMd5, int chunkIndex);

    /**
     * 上传分块
     *
     * @param fileMd5 文件MD5
     * @param chunk   分块序号
     *                //     * @param bytes   文件字节
     * @return
     */
    RestResponse uploadChunk(String fileMd5, int chunk, String localChunkFilePath);
//    RestResponse uploadChunk(String fileMd5, int chunk, byte[] bytes);

    /**
     * 合并分块
     *
     * @param fileMd5             文件MD5
     * @param chunkTotal          分块数量
     * @param uploadFileParamsDto 文件信息
     * @return
     */
    RestResponse mergeChunks(String fileMd5, int chunkTotal, UploadFileParamsDto uploadFileParamsDto) throws IOException;


    /**
     * 根据媒资id获取媒资
     *
     * @param mediaId
     * @return
     */
    MediaFiles getFileById(String mediaId);
//    MediaFiles getFileById(String mediaId);

    /**
     * 从minio下载文件
     *
     * @param file       下载后的文件
     * @param bucket     minio中的桶
     * @param objectName minio中的对象名称
     * @return
     */
//    File downloadFileFromMinio(File file, String bucket, String objectName);

    /**
     * 将本地文件上传到MinIO
     *
     * @param localFilePath 本地文件路径
     * @param bucket        上传到的桶
     * @param objectName    上传到的objectName
     */
//    void addMediaFilesToMinIO(String filePath, String bucket, String objectName);
    boolean addMediaFilesToMinIO(String localFilePath, String mimeTyep, String bucket, String objectName);

    /**
     * 向数据库保存文件信息
     *
     * @param fileMd5
     * @param uploadFileParamsDto
     * @param bucket
     * @param objectName
     * @return
     */
    MediaFiles addMediaFilesToDB(String fileMd5, UploadFileParamsDto uploadFileParamsDto, String bucket, String objectName);


    /**
     * 根据文件md5，生成在minio中的文件路径
     *
     * @param fileMd5   文件md5
     * @param extension 文件后缀名
     * @return
     */
//    String getFilePathByMd5(String fileMd5, String extension);
}
