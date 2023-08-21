package com.yyz.easyexcel.service.impl;

import com.alibaba.excel.EasyExcel;
import com.yyz.easyexcel.dao.UserDao;
import com.yyz.easyexcel.entity.UserEntity;
import com.yyz.easyexcel.service.ExcelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.List;

/**
 * ExcelServiceImpl
 *
 * @author YangYezhuang
 * @date 2023/8/21 16:17
 */
@Service
public class ExcelServiceImpl implements ExcelService {

    @Autowired
    UserDao demoDAO;

    /**
     * 将excel 导入数据库
     *
     * @param file
     */
    @Override
    public void importExcel(MultipartFile file) throws IOException {
        InputStream inputStream = file.getInputStream();
        // 默认每次读取100条数据 然后返回过来 直接调用使用数据就行，具体需要返回多少行可以在`PageReadListener`的构造函数设置
        EasyExcel.read(inputStream, UserEntity.class, new DemoDataListener(demoDAO)).sheet().doRead();
    }

    /**
     * 将数据导出为 excel
     */
    @Override
    public void exportExcel(HttpServletResponse response) throws IOException {
        // 查询数据
        List<UserEntity> data = demoDAO.findAll();
        // 设置响应信息
        String filename = URLEncoder.encode("user", "utf-8");
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + filename + ".xlsx");
        // 写入excel
        EasyExcel.write(response.getOutputStream(), UserEntity.class).sheet("sheet1").doWrite(data);
    }

}
