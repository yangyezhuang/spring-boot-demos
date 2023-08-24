package com.orange.media.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.*;

/**
 * 测试大文件上传方法
 */
@SpringBootTest
public class BigFileTest {

    /**
     * 分块测试
     */
    @Test
    public void testChunk() throws IOException {
        // 源文件
        File sourceFile = new File("D:\\Media\\dev\\1.mp4");
        // 分块文件存储路径
        String chunkFilePath = "\"D:\\Media\\dev\\chunk";
        // 分块文件大小
        int chunkSize = 1024 * 1024 * 1;
        // 分块文件个数
        int chunkNum = (int) Math.ceil(sourceFile.length() * 1.0 / chunkSize);
        // 使用溜从源文件读数据，向分块文件写数据
        RandomAccessFile raf_r = new RandomAccessFile(sourceFile, "r");
        // 缓冲区
        byte[] bytes = new byte[1024];
        for (int i = 0; i < chunkNum; i++) {
            File chunkFile = new File(chunkFilePath + i);
            // 分块文件写入流
            RandomAccessFile raf_rw = new RandomAccessFile(chunkFile, "rw");
            int len = -1;
            while ((len = raf_r.read(bytes)) != -1) {
                raf_rw.write(bytes, 0, len);
                if (chunkFile.length() >= chunkSize) {
                    break;
                }
            }
            raf_rw.close();
        }
        raf_r.close();
    }


    /**
     * 合并分块
     */
    @Test
    public void testMerge() {

    }
}
