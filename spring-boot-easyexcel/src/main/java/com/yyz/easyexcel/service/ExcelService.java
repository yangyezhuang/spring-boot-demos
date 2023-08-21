package com.yyz.easyexcel.service;

import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public interface ExcelService {

    void importExcel(MultipartFile file) throws IOException;

    void exportExcel(HttpServletResponse response) throws IOException;
}
