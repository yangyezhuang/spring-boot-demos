package com.yyz.minio.controller;

import com.yyz.minio.pojo.RestResponse;
import com.yyz.minio.pojo.UploadFileParamsDto;
import com.yyz.minio.service.FileService;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * 大文件上传接口
 */
@RestController
public class BigFileController {

    @Autowired
    FileService fileService;

    /**
     * 上传前检查文件
     */
    @PostMapping("/upload/checkfile")
    public RestResponse<Boolean> checkFile(@RequestParam("fileMd5") String fileMd5) {
        return fileService.checkFile(fileMd5);
    }


    /**
     * 分块上传前检查分块
     */
    @PostMapping("/upload/checkchunk")
    public RestResponse<Boolean> checkChunk(@RequestParam("fileMd5") String fileMd5, @RequestParam("chunk") int chunk) {
        return fileService.checkChunk(fileMd5, chunk);
    }


    /**
     * 上传分块文件
     * <p>
     * 前端分好块后调用上传接口，避免后端分块造成资源消耗
     */
    @PostMapping("/upload/chunk")
    public RestResponse uploadChunk(@RequestParam("file") MultipartFile file, @RequestParam("fileMd5") String fileMd5, @RequestParam("chunk") int chunk) throws Exception {
        // 创建临时文件
        File tempFile = File.createTempFile("minio", ".temp");
        file.transferTo(tempFile);
        // 文件路径
        String localFilePath = tempFile.getAbsolutePath();

        RestResponse restResponse = fileService.uploadChunk(fileMd5, chunk, localFilePath);
        return restResponse;
    }


    /**
     * 合并分块文件
     */
    @PostMapping("/upload/mergechunks")
    public RestResponse mergeChunks(@RequestParam("fileMd5") String fileMd5, @RequestParam("fileName") String fileName,
                                    @RequestParam("chunkTotal") int chunkTotal) throws IOException {
        UploadFileParamsDto uploadFileParamsDto = new UploadFileParamsDto();
        uploadFileParamsDto.setFilename(fileName);
        uploadFileParamsDto.setFileType("001002");
        RestResponse restResponse = fileService.mergeChunks(fileMd5, chunkTotal, uploadFileParamsDto);
        return restResponse;
    }
}