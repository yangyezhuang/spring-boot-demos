package com.yyz.poi.controller;

import com.yyz.poi.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * Excel 控制层
 *
 * @author YangYezhuang
 * @date 2023/8/21 15:28
 */
@RestController
public class PoiExcelController {

    @Autowired
    ExcelService excelService;

    @PostMapping("/upload")
    public void upload(@RequestBody MultipartFile file) throws Exception {
        excelService.importExcel(file);
    }

    @GetMapping("/download")
    public void download(HttpServletResponse response) throws Exception {
        excelService.exportExcel(response);
    }

}
