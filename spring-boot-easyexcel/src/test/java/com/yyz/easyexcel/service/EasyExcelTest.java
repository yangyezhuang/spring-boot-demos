package com.yyz.easyexcel.service;

import com.alibaba.excel.EasyExcel;
import com.yyz.easyexcel.entity.UserEntity;
import com.yyz.easyexcel.service.impl.DemoDataListener;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.List;

/**
 * ExcelTest
 *
 * @author YangYezhuang
 * @date 2023/8/21 15:34
 */
@Slf4j
@SpringBootTest
public class EasyExcelTest {

    String PATH = "D:\\Code\\JavaProjects\\SpringBoot-Projects\\spring-boot-demos\\spring-boot-easyexcel\\src\\main\\resources\\static";

    private List<UserEntity> data() {
        ArrayList<UserEntity> list = new ArrayList<>();
        for (int i = 1; i <= 10; i++) {
            UserEntity user = new UserEntity();
            user.setId(i);
            user.setUsername("user" + i);
            user.setPassword("12345");
            user.setSex("男");
            user.setAge(i);
            list.add(user);
        }
        return list;
    }

    /*
     * 根据list 写入excel
     */
    @Test
    void testWrite() {
        String fileName = PATH + "/EasyTest.xls";
        // 写法1
        // write(文件名，实体类)
        // sheet(表名)
        // doWrite(数据)
        EasyExcel.write(fileName, UserEntity.class).sheet("模板").doWrite(data());
    }


    /**
     * 最简单的读
     * <p>
     * 1. 创建excel对应的实体对象 参照{@link UserEntity}
     * <p>
     * 2. 由于默认一行行的读取excel，所以需要创建excel一行一行的回调监听器，参照{@link DemoDataListener}
     * <p>
     * 3. 直接读即可
     */
    @Test
    public void simpleRead() {
        // 写法1
        String fileName = PATH + "/EasyTest.xls";
        // 这里默认每次会读取100条数据 然后返回过来 直接调用使用数据就行
        // 具体需要返回多少行可以在`PageReadListener`的构造函数设置
//        EasyExcel.read(fileName, DemoData.class, new DemoDataListener()).sheet().doRead();
    }
}
