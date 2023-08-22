package com.yyz.poi.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * UserService
 *
 * @author YangYezhuang
 * @date 2023/8/22 14:05
 */
public interface UserService {
    void importExcel(MultipartFile file) throws Exception;

    void exportExcel(HttpServletResponse response)  throws Exception;
}
