package com.yyz.upload.service;

import org.springframework.web.multipart.MultipartFile;

/**
 * FileService
 *
 * @author YZ.YANG
 * @date 2023/9/4 18:25
 */
public interface FileService {

    boolean upload(MultipartFile file);

    boolean uploadFiles(MultipartFile[] files);
}
