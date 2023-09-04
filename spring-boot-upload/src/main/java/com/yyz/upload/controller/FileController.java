package com.yyz.upload.controller;

import com.yyz.upload.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;


/**
 * FileController
 *
 * @author YZ.YANG
 * @date 2023/9/4 18:24
 */
@RestController
public class FileController {

    @Autowired
    FileService fileService;

    @PostMapping("/upload")
    public String upload(@RequestParam("file") MultipartFile file) {
        if (file.isEmpty()) {
            return "上传失败，请选择文件";
        }
        boolean result = fileService.upload(file);
        if (result) {
            return "上传成功";
        }
        return "上传成功";
    }


    @PostMapping("/uploadFiles")
    public String uploadFiles(@RequestParam("files") MultipartFile[] files) {
        if (files.length == 0) {
            return "上传失败，请选择文件";
        }
        boolean result = fileService.uploadFiles(files);
        if (result) {
            return "上传成功";
        }
        return "上传失败";
    }

}
