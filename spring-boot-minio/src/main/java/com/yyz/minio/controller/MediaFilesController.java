package com.example.minio.controller;

import com.example.minio.pojo.*;
import com.example.minio.service.MediaFileService;
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
public class MediaFilesController {


    @Autowired
    MediaFileService mediaFileService;


    /**
     * 媒资列表查询接口
     */
    @PostMapping("/files")
    public PageResult<MediaFiles> list(PageParams pageParams, @RequestBody QueryMediaParamsDto queryMediaParamsDto) {
        return mediaFileService.queryMediaFiles(pageParams, queryMediaParamsDto);
    }


    /**
     * 上传文件
     */
    @RequestMapping(value = "/upload/coursefile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public UploadFileResultDto upload(@RequestPart("filedata") MultipartFile filedata) throws IOException {
        // 准备上传文件信息
        UploadFileParamsDto uploadFileParamsDto = new UploadFileParamsDto();
        // 原始文件名称
        uploadFileParamsDto.setFilename(filedata.getOriginalFilename());
        // 文件大小
        uploadFileParamsDto.setFileSize(filedata.getSize());
        // 文件类型
        uploadFileParamsDto.setFileType("001001");
        // 创建临时文件
        File tempFile = File.createTempFile("minio", ".temp");
        filedata.transferTo(tempFile);
        Long companyId = 1232141425L;
        // 文件路径
        String localFilePath = tempFile.getAbsolutePath();

        UploadFileResultDto uploadFileResultDto = mediaFileService.uploadFile(uploadFileParamsDto, localFilePath);
        return uploadFileResultDto;
    }


//    @ApiOperation("上传文件")
//    @RequestMapping(value = "/upload/coursefile", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
//    public UploadFileResultDto upload(@RequestPart("filedata") MultipartFile upload,
//                                      @RequestParam(value = "folder", required = false) String folder,
//                                      @RequestParam(value = "objectName", required = false) String objectName) {
//        UploadFileParamsDto uploadFileParamsDto = new UploadFileParamsDto();
//        uploadFileParamsDto.setFileSize(upload.getSize());
//        String contentType = upload.getContentType();
//        if (contentType.contains("image")) {
//            uploadFileParamsDto.setFileType("001001");
//        } else {
//            uploadFileParamsDto.setFileType("001003");
//        }
//        uploadFileParamsDto.setRemark("");
//        uploadFileParamsDto.setFilename(upload.getOriginalFilename());
//        uploadFileParamsDto.setContentType(contentType);
//        Long companyId = 1232141425L;
//        try {
//            UploadFileResultDto uploadFileResultDto = mediaFileService.uploadFile(companyId, uploadFileParamsDto, upload.getBytes(), folder, objectName);
//            return uploadFileResultDto;
//        } catch (IOException e) {
//            OrangeException.cast("上传文件过程出错:" + e.getMessage());
//        }
//        return null;
//    }

//    @ApiOperation(value = "预览文件")
//    @GetMapping("/preview/{mediaId}")
//    public RestResponse<String> getPlayUrlByMediaId(@PathVariable String mediaId) {
//        MediaFiles mediaFile = mediaFileService.getFileById(mediaId);
//        return RestResponse.success(mediaFile.getUrl());
//    }
}