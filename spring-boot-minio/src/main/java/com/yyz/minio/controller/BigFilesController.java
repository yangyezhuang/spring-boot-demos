package com.example.minio.controller;

import com.example.minio.pojo.RestResponse;
import com.example.minio.pojo.UploadFileParamsDto;
import com.example.minio.service.MediaFileService;
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
public class BigFilesController {
    @Autowired
    MediaFileService mediaFileService;

    /**
     * 文件上传前检查文件
     */
    @PostMapping("/upload/checkfile")
    public RestResponse<Boolean> checkFile(@RequestParam("fileMd5") String fileMd5) {
        return mediaFileService.checkFile(fileMd5);
    }

    /**
     * 分块文件上传前检查分块
     */
    @PostMapping("/upload/checkchunk")
    public RestResponse<Boolean> checkChunk(@RequestParam("fileMd5") String fileMd5, @RequestParam("chunk") int chunk) {
        return mediaFileService.checkChunk(fileMd5, chunk);
    }

    /**
     * 上传分块文件
     */
    @PostMapping("/upload/uploadchunk")
    public RestResponse uploadChunk(@RequestParam("file") MultipartFile file, @RequestParam("fileMd5") String fileMd5, @RequestParam("chunk") int chunk) throws Exception {
        // 创建临时文件
        File tempFile = File.createTempFile("minio", ".temp");
        file.transferTo(tempFile);
        // 文件路径
        String localFilePath = tempFile.getAbsolutePath();

        RestResponse restResponse = mediaFileService.uploadChunk(fileMd5, chunk, localFilePath);
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
        RestResponse restResponse = mediaFileService.mergeChunks( fileMd5, chunkTotal, uploadFileParamsDto);
        return restResponse;
    }
}