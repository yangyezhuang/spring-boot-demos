package com.yyz.poi.service;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.joda.time.DateTime;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.FileOutputStream;

/**
 * TestWriteXls
 *
 * @author YangYezhuang
 * @date 2023/8/21 14:29
 */
@SpringBootTest
public class ExcelWriteTest {
    String PATH = "D:\\Code\\JavaProjects\\SpringBoot-Projects\\spring-boot-demos\\spring-boot-poi\\src\\main\\resources\\static";

    /**
     * 写入xls
     *
     * @throws Exception
     */
    @Test
    void testWrite03() throws Exception {
        // 1. 创建工作簿
        HSSFWorkbook workbook = new HSSFWorkbook();
        // 2. 创建工作表
        Sheet sheet = workbook.createSheet("用户信息统计表");
        // 3. 创建第一行数据
        Row row1 = sheet.createRow(0);
        // 4. 创建单元格 (1,1)
        Cell cell11 = row1.createCell(0);
        // 5. 向单元格写入数据
        cell11.setCellValue("姓名");
        // 单元格 (1,2)
        Cell cell12 = row1.createCell(1);
        // 5. 向单元格写入数据
        cell12.setCellValue("时间");

        // 创建第二行数据 (2,1)
        Row row2 = sheet.createRow(1);
        // 创建单元格，向单元格写入数据
        Cell cell21 = row2.createCell(0);
        cell21.setCellValue("张三");
        // 单元格 (2,2)
        Cell cell22 = row2.createCell(1);
        String time = new DateTime().toString("yyyy-MM-dd HH:mm:ss");
        cell22.setCellValue(time);

        // 生成一张表（io流）
        FileOutputStream fileOutputStream = new FileOutputStream(PATH + "/用户信息03.xls");
        // 输出
        workbook.write(fileOutputStream);
        // 关闭流
        fileOutputStream.close();
        System.out.println("表格生成完毕");
    }


    /**
     * 写入xlsx
     *
     * @throws Exception
     */
    @Test
    void testWrite07() throws Exception {
        // 1. 创建工作簿
        XSSFWorkbook workbook = new XSSFWorkbook();
        // 2. 创建工作表
        Sheet sheet = workbook.createSheet("用户信息统计表");
        // 3. 创建第一行数据
        Row row1 = sheet.createRow(0);
        // 4. 创建单元格 (1,1)
        Cell cell11 = row1.createCell(0);
        // 5. 向单元格写入数据
        cell11.setCellValue("姓名");
        // 单元格 (1,2)
        Cell cell12 = row1.createCell(1);
        // 5. 向单元格写入数据
        cell12.setCellValue("时间");

        // 创建第二行数据 (2,1)
        Row row2 = sheet.createRow(1);
        // 创建单元格，向单元格写入数据
        Cell cell21 = row2.createCell(0);
        cell21.setCellValue("张三");
        // 单元格 (2,2)
        Cell cell22 = row2.createCell(1);
        String time = new DateTime().toString("yyyy-MM-dd HH:mm:ss");
        cell22.setCellValue(time);

        // 生成一张表（io流）
        FileOutputStream fileOutputStream = new FileOutputStream(PATH + "/static/用户信息07.xlsx");
        // 输出
        workbook.write(fileOutputStream);
        // 关闭流
        fileOutputStream.close();
        System.out.println("表格生成完毕");
    }


    /**
     * 大量数据写入xls
     *
     * @throws Exception
     */
    @Test
    void testWrite03BigData() throws Exception {
        // 记录开始时间
        long begin = System.currentTimeMillis();

        HSSFWorkbook workbook1 = new HSSFWorkbook();
        Sheet sheet1 = workbook1.createSheet();

        for (int rowNum = 0; rowNum < 65536; rowNum++) {
            Row row = sheet1.createRow(rowNum);
            for (int cellNum = 0; cellNum < 3; cellNum++) {
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("over");
        FileOutputStream fileOutputStream1 = new FileOutputStream(PATH + "/大数据测试03.xls");
        workbook1.write(fileOutputStream1);
        fileOutputStream1.close();

        // 记录结束时间
        long end = System.currentTimeMillis();
        System.out.println("表格生成完毕，用时：" + (double) (end - begin) / 1000);
    }


    /**
     * 大量数据写入xlsx，耗时较长
     *
     * @throws Exception
     */
    @Test
    void testWrite07BigData() throws Exception {
        // 记录开始时间
        long begin = System.currentTimeMillis();

        XSSFWorkbook workbook1 = new XSSFWorkbook();
        Sheet sheet1 = workbook1.createSheet();

        for (int rowNum = 0; rowNum < 100000; rowNum++) {
            Row row = sheet1.createRow(rowNum);
            for (int cellNum = 0; cellNum < 5; cellNum++) {
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("over");
        FileOutputStream fileOutputStream1 = new FileOutputStream(PATH + "/大数据测试07.xlsx");
        workbook1.write(fileOutputStream1);
        fileOutputStream1.close();

        // 记录结束时间
        long end = System.currentTimeMillis();
        System.out.println("表格生成完毕，用时：" + (double) (end - begin) / 1000);
    }

    /**
     * 大量数据写入xlsx，使用SXSSF
     * 优点:可以写非常大的数据量,如100万条甚至更多条,韦数据速度快，占用更少的内存
     * <p>
     * 注意:
     * 过程中会产生临时文件需要清理临时文件
     * 默认由100条2录被保存在内存中,如果超过这数量,则最前面的数据被写入临时文件
     * 如果想自定义内存中数据的数量,可以使用new SXSSFWorkbook(数量)
     *
     * @throws Exception
     */
    @Test
    void testWrite07BigDataSXSSF() throws Exception {
        // 记录开始时间
        long begin = System.currentTimeMillis();

        SXSSFWorkbook workbook1 = new SXSSFWorkbook();
        Sheet sheet1 = workbook1.createSheet();

        for (int rowNum = 0; rowNum < 100000; rowNum++) {
            Row row = sheet1.createRow(rowNum);
            for (int cellNum = 0; cellNum < 5; cellNum++) {
                Cell cell = row.createCell(cellNum);
                cell.setCellValue(cellNum);
            }
        }
        System.out.println("over");
        FileOutputStream fileOutputStream1 = new FileOutputStream(PATH + "/大数据加速测试07.xlsx");
        workbook1.write(fileOutputStream1);
        // 清除临时文件
        ((SXSSFWorkbook) workbook1).dispose();
        fileOutputStream1.close();

        // 记录结束时间
        long end = System.currentTimeMillis();
        System.out.println("表格生成完毕，用时：" + (double) (end - begin) / 1000);
    }
}
