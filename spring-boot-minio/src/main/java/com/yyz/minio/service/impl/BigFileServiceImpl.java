package com.yyz.minio.service.impl;

import io.minio.ComposeObjectArgs;
import io.minio.ComposeSource;
import io.minio.MinioClient;
import io.minio.UploadObjectArgs;
import io.minio.errors.*;
import org.apache.commons.codec.digest.DigestUtils;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class BigFileServiceImpl {

    public static MinioClient minioClient = MinioClient.builder().
            endpoint("http://192.168.126.1:9000").
            credentials("minioadmin", "minioadmin").
            build();


    public static void testChunk() throws IOException {
        // 源文件
        File sourceFile = new File("D:\\Media\\dev\\1.mp4");
        // 分块文件存储路径
        String chunkFilePath = "D:\\Media\\dev\\chunk\\";
        // 分块文件大小
        int chunkSize = 1024 * 1024 * 5;
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


    public static void testMerge() throws IOException {
        // 块文件目录
        File chunkFolder = new File("D:\\Media\\dev\\chunk\\");
        // 源文件
        File sourceFile = new File("D:\\Media\\dev\\1.mp4");
        // 合并后的文件
        File mergeFile = new File("D:\\Media\\dev\\2.mp4");

        // 取出所有分块文件
        File[] files = chunkFolder.listFiles();
        // 将数组转成list
        List<File> fileList = Arrays.asList(files);
        // 对分块排序
        Collections.sort(fileList, new Comparator<File>() {
            @Override
            public int compare(File o1, File o2) {
                return Integer.parseInt(o1.getName()) - Integer.parseInt(o2.getName());
            }
        });
        // 向合并文件写的流
        RandomAccessFile raf_rw = new RandomAccessFile(mergeFile, "rw");
        // 缓冲区
        byte[] bytes = new byte[1024];
        // 遍历分块文件，向合并的文件写
        for (File file : fileList) {
            // 读分块的流
            RandomAccessFile raf_r = new RandomAccessFile(file, "r");
            int len = -1;
            while ((len = raf_r.read(bytes)) != -1) {
                raf_rw.write(bytes, 0, len);
            }
            raf_r.close();
        }
        raf_rw.close();
        // 校验文件是否一致
        String mergeFileMd5 = DigestUtils.md5Hex(new FileInputStream(mergeFile));
        String sourceFileMd5 = DigestUtils.md5Hex(new FileInputStream(sourceFile));
        if (mergeFileMd5.equals(sourceFileMd5)) {
            System.out.println("文件合并完成");
        }
    }

    public static void uploadMinio() {
        for (int i = 0; i < 2; i++) {
            try {
                minioClient.uploadObject(UploadObjectArgs.builder()
                        .bucket("test")
                        .object("chunk/" + i)
                        .filename("D:\\Media\\dev\\chunk\\" + i)
                        .build()
                );
                System.out.println("分块" + i + "上传成功");
            } catch (Exception e) {
                System.out.println("分块" + i + "上传失败");
            }
        }
    }


    public static void mergeMinio() throws ServerException, InsufficientDataException, ErrorResponseException, IOException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
//        List<ComposeSource> sources = new ArrayList<>();
//        for (int i = 0; i < 2; i++) {
//            // 指定分块文件的信息
//            ComposeSource composeSource = ComposeSource.builder().bucket("test").object("chunk/" + i).build();
//            sources.add(composeSource);
//        }
        List<ComposeSource> sources = Stream.iterate(0, i -> ++i).limit(2).map(i -> ComposeSource.builder().bucket("test").object("chunk/" + i).build()).collect(Collectors.toList());
        // 指定合并后的objectName
        minioClient.composeObject(ComposeObjectArgs.builder()
                .bucket("test")
                .object("merge01.mp4")
                .sources(sources) // 源文件
                .build());
    }

    public static void removeChunk() {

    }

    public static void main(String[] args) throws IOException, ServerException, InsufficientDataException, ErrorResponseException, NoSuchAlgorithmException, InvalidKeyException, InvalidResponseException, XmlParserException, InternalException {
//        testChunk();
//        testMerge();
        uploadMinio();
        mergeMinio();
    }
}
