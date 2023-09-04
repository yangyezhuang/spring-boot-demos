package com.yyz.upload.service.impl;

import com.yyz.upload.service.FileService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * FileServiceImpl
 *
 * @author YZ.YANG
 * @date 2023/9/4 18:25
 */
@Service
public class FileServiceImpl implements FileService {
    @Value("${file.path}")
    private String path;

    @Override
    public boolean upload(MultipartFile file) {
        String fileName = file.getOriginalFilename();
        String filePath = path + fileName;
        try {
            file.transferTo(new File(filePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean uploadFiles(MultipartFile[] files) {
        for (MultipartFile file : files) {
            String fileName = file.getOriginalFilename();
            String filePath = path + fileName;
            try {
                file.transferTo(new File(filePath));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return true;
    }
}
