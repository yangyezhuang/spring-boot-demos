package com.yyz.easyexcel.controller;

import com.yyz.easyexcel.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Excel 控制层
 *
 * @author YangYezhuang
 * @date 2023/8/21 14:02
 */
@RestController
public class ExcelController {
    @Autowired
    ExcelService excelService;

    /**
     * 上传excel并导入数据库
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public void upload(@RequestBody MultipartFile file) throws IOException {
        excelService.importExcel(file);
    }


    /**
     * 将数据库数据导出为excel
     *
     * @return
     */
    @GetMapping("/download")
    public void download(HttpServletResponse response) throws IOException {
        excelService.exportExcel(response);
    }

}
