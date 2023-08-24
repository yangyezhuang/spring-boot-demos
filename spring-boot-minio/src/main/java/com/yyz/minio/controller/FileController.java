package com.yyz.minio.controller;

import com.yyz.minio.pojo.*;
import com.yyz.minio.service.FileService;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;


/**
 * 媒资文件管理接口
 */
@RestController
public class FileController {

    @Autowired
    FileService fileService;

    /**
     * 媒资列表查询接口
     */
    @PostMapping("/files")
    public PageResult<MediaFiles> list(PageParams pageParams, @RequestBody QueryMediaParamsDto queryMediaParamsDto) {
        return fileService.queryMediaFiles(pageParams, queryMediaParamsDto);
    }


    /**
     * 上传文件
     *
     * @param file 源文件
     * @return uploadFileResultDto
     * @throws IOException e
     */
    @RequestMapping(value = "/upload", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public UploadFileResultDto upload(@RequestPart("file") MultipartFile file) throws IOException {
        // 准备上传文件信息
        UploadFileParamsDto uploadFileParamsDto = new UploadFileParamsDto();
        // 原始文件名称
        uploadFileParamsDto.setFilename(file.getOriginalFilename());
        // 文件大小
        uploadFileParamsDto.setFileSize(file.getSize());
        // 文件类型
        uploadFileParamsDto.setFileType("001001");
        // 创建临时文件
        File tempFile = File.createTempFile("minio", ".temp");
        file.transferTo(tempFile);
        // 文件路径
        String localFilePath = tempFile.getAbsolutePath();

        UploadFileResultDto uploadFileResultDto = fileService.uploadFile(uploadFileParamsDto, localFilePath);
        return uploadFileResultDto;
    }


    /**
     * 预览文件
     *
     * @param fileId 文件id
     * @return fileURL
     */
    @GetMapping("/preview/{fileId}")
    public RestResponse<String> getMediaUrl(@PathVariable("fileId") String fileId) {
        MediaFiles mediaFiles = fileService.getFileById(fileId);
        if (mediaFiles == null || StringUtils.isEmpty(mediaFiles.getUrl())) {
            MinioException.cast("视频还没有转码处理");
            return RestResponse.validfail("视频还没有转码处理");
        }
        return RestResponse.success(mediaFiles.getUrl());
    }


    /**
     * 删除文件
     *
     * @param fileId 文件id
     * @return b
     */
    @DeleteMapping("/delete/{fileId}")
    public RestResponse<String> deleteObject(@PathVariable("fileId") String fileId) {
        boolean b = fileService.deleteObject(fileId);
        if (b) {
            return RestResponse.success("删除成功");
        }
        return RestResponse.validfail("删除成功");
    }

}