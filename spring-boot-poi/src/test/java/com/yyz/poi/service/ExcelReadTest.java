package com.yyz.poi.service;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileInputStream;

/**
 * ExcelReadTest
 *
 * @author YangYezhuang
 * @date 2023/8/21 15:16
 */
@SpringBootTest
public class ExcelReadTest {

    String PATH = "D:\\Code\\JavaProjects\\SpringBoot-Projects\\spring-boot-demos\\spring-boot-poi\\src\\main\\resources\\static";

    /**
     * 读取xls
     *
     * @throws Exception
     */
    @Test
    void testRead03() throws Exception {
        // 获取文件流
        FileInputStream inputStream = new FileInputStream(PATH + "/用户信息.xls");
        // 1. 创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook(inputStream);
        // 2. 得到工作表
        Sheet sheet = workbook.getSheetAt(0);
        // 3. 得到行
        Row row = sheet.getRow(0);
        // 4. 得到列
        Cell cell = row.getCell(0);

        System.out.println(cell.getStringCellValue());
        inputStream.close();
    }

    /**
     * 读取xlsx
     *
     * @throws Exception
     */
    @Test
    void testRead07() throws Exception {
        // 获取文件流
        FileInputStream inputStream = new FileInputStream(PATH + "/用户信息.xls");
        // 1. 创建工作簿
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        // 2. 得到工作表
        Sheet sheet = workbook.getSheetAt(0);
        // 3. 得到行
        Row row = sheet.getRow(0);
        // 4. 得到列
        Cell cell = row.getCell(0);

        System.out.println(cell.getStringCellValue());
        inputStream.close();
    }
}
