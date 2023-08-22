package com.yyz.poi.service.impl;

import com.yyz.poi.dao.UserDao;
import com.yyz.poi.pojo.User;
import com.yyz.poi.service.UserService;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * UserServiceImpl
 *
 * @author YangYezhuang
 * @date 2023/8/22 14:05
 */
@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserDao userDao;

    /**
     * 将表格数据导入到数据库
     *
     * @param file
     * @throws Exception
     */
    @Transactional
    @Override
    public void importExcel(MultipartFile file) throws Exception {
        // 获取文件流
        InputStream inputStream = file.getInputStream();
        // 创建工作簿
        XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
        // 得到工作表
        Sheet sheet = workbook.getSheetAt(0);

        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            //读取行
            Row row = sheet.getRow(i);
            //读取单元格
            Cell cell0 = row.getCell(0);
            Cell cell1 = row.getCell(1);
            Cell cell2 = row.getCell(2);
            Cell cell3 = row.getCell(3);
            Cell cell4 = row.getCell(4);
            // 设置单元格类型
            cell0.setCellType(CellType.STRING);
            cell1.setCellType(CellType.STRING);
            cell2.setCellType(CellType.STRING);
            cell3.setCellType(CellType.STRING);
            cell4.setCellType(CellType.STRING);
            // 构造数据
            User user = new User();
            user.setId(Integer.parseInt(cell0.getStringCellValue()));
            user.setUsername(cell1.getStringCellValue());
            user.setPassword(cell2.getStringCellValue());
            user.setSex(cell3.getStringCellValue());
            user.setAge(Integer.parseInt(cell4.getStringCellValue()));
            // 保存数据
            userDao.save(user);
        }
        inputStream.close();
    }


    /**
     * 将数据库数据导出为excel
     *
     * @param response
     * @throws Exception
     */
    @Override
    public void exportExcel(HttpServletResponse response) throws Exception {
        // 查询数据
        List<User> list = userDao.getAll();
        // 生成表格
        SXSSFWorkbook workbook1 = new SXSSFWorkbook();
        Sheet sheet = workbook1.createSheet();

        int rowNum = 0;
        Row row;
        for (User user : list) {
            //创建行
            row = sheet.createRow(rowNum);

            Cell cell0 = row.createCell(0);
            cell0.setCellValue(user.getId());

            Cell cell1 = row.createCell(1);
            cell1.setCellValue(user.getUsername());

            Cell cell2 = row.createCell(2);
            cell2.setCellValue(user.getPassword());

            Cell cell3 = row.createCell(3);
            cell3.setCellValue(user.getSex());

            Cell cell4 = row.createCell(4);
            cell4.setCellValue(user.getAge());

            rowNum++;
        }

        // 设置响应信息
        String filename = URLEncoder.encode("POI导出测试", "utf-8");
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xlsx");
        // 写入excel
        workbook1.write(response.getOutputStream());
        // 清除临时文件
        ((SXSSFWorkbook) workbook1).dispose();
        response.getOutputStream().close();
    }

}
