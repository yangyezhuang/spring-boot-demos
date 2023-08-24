package com.example.minio.controller;

import com.example.minio.service.MediaFileService;
import com.example.minio.pojo.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 媒资文件管理接口
 */
@Slf4j
@RestController
@RequestMapping("/open")
public class MediaOpenController {
    @Autowired
    MediaFileService mediaFileService;

    /**
     * 根据媒资id获取媒资
     */
    @GetMapping("/preview/{mediaId}")
    public RestResponse<String> getMediaUrl(@PathVariable String mediaId) {
        MediaFiles mediaFiles = mediaFileService.getFileById(mediaId);
        if (mediaFiles == null || StringUtils.isEmpty(mediaFiles.getUrl())) {
            OrangeException.cast("视频还没有转码处理");
            return RestResponse.validfail("视频还没有转码处理");
        }
        return RestResponse.success(mediaFiles.getUrl());
    }
}
