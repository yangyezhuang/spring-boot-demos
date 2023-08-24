package com.yyz.minio;

import io.minio.*;
import io.minio.errors.*;
import io.minio.http.Method;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.io.IOUtils;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.*;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

@SpringBootTest
public class MinioTest {

    @Autowired
    MinioClient minioClient;

    @Value("${minio.bucket.files}")
    private String bucketName;


    /**
     * 上传测试
     */
    @Test
    public void uploadTest() {
        try {
            minioClient.uploadObject(
                    UploadObjectArgs.builder()
                            .bucket(bucketName)
                            .object("pic01.png")
                            .filename("C:\\Users\\15863\\Desktop\\Picture\\background\\01.png")
                            .build()
            );
            System.out.println("上传成功");
        } catch (Exception e) {
            System.out.println("上传失败");
        }
    }


    /**
     * 删除测试
     */
    @Test
    public void deleteTest() {
        try {
            minioClient.removeObject(RemoveObjectArgs
                    .builder()
                    .bucket(bucketName)
                    .object("pic01.png")
                    .build());
            System.out.println("删除成功");
        } catch (Exception e) {
            System.out.println("删除失败");
        }
    }


    /**
     * 下载测试
     */
    @Test
    public void getFileTest() {
        try {
            FilterInputStream inputStream = minioClient.getObject(GetObjectArgs.builder()
                    .bucket(bucketName)
                    .object("pic01.png")
                    .build());
            FileOutputStream fileOutputStream = new FileOutputStream("C:\\Users\\yyz\\Desktop\\tmp.png");
            IOUtils.copy(inputStream, fileOutputStream);
            System.out.println("下载成功");
        } catch (Exception e) {
            System.out.println("下载失败");
        }
    }


    /**
     * 本地分块测试
     *
     * @throws IOException
     */
    @Test
    public void testChunk() throws IOException {
        // 源文件
        File sourceFile = new File("D:\\Media\\dev\\1.mp4");
        // 块文件路径
        String chunkPath = "D:\\Media\\dev\\chunk";
        File chunkFolder = new File(chunkPath);
        if (!chunkFolder.exists()) {
            chunkFolder.mkdirs();
        }
        // 分块大小 1M
        long chunkSize = 1024 * 1024 * 1;
        // 计算块数，向上取整
        long chunkNum = (long) Math.ceil(sourceFile.length() * 1.0 / chunkSize);
        // 缓冲区大小
        byte[] buffer = new byte[1024];
        // 使用RandomAccessFile访问文件
        RandomAccessFile raf_read = new RandomAccessFile(sourceFile, "r");
        // 遍历分块，依次向每一个分块写入数据
        for (int i = 0; i < chunkNum; i++) {
            // 创建分块文件，默认文件名 path + i，例如chunk\1  chunk\2
            File file = new File(chunkPath + i);
            if (file.exists()) {
                file.delete();
            }
            boolean newFile = file.createNewFile();
            if (newFile) {
                int len;
                RandomAccessFile raf_write = new RandomAccessFile(file, "rw");
                // 向分块文件写入数据
                while ((len = raf_read.read(buffer)) != -1) {
                    raf_write.write(buffer, 0, len);
                    // 写满就停
                    if (file.length() >= chunkSize)
                        break;
                }
                raf_write.close();
            }
        }
        raf_read.close();
        System.out.println("写入分块完毕");
    }


    /**
     * 本地合并测试
     *
     * @throws IOException
     */
    @Test
    public void testMerge() throws IOException {
        // 块文件目录
        File chunkFolder = new File("D:\\Media\\dev\\chunk");
        // 源文件
        File sourceFile = new File("D:\\Media\\dev\\1.mp4");
        // 合并文件
        File mergeFile = new File("D:\\Media\\dev\\1-1.mp4");
        mergeFile.createNewFile();
        // 用于写文件
        RandomAccessFile raf_write = new RandomAccessFile(mergeFile, "rw");
        // 缓冲区
        byte[] buffer = new byte[1024];
        // 文件名升序排序
        File[] files = chunkFolder.listFiles();
        List<File> fileList = Arrays.asList(files);
        Collections.sort(fileList, Comparator.comparingInt(o -> Integer.parseInt(o.getName())));
        // 合并文件
        for (File chunkFile : fileList) {
            // 读分块的流
            RandomAccessFile raf_read = new RandomAccessFile(chunkFile, "r");
            int len;
            while ((len = raf_read.read(buffer)) != -1) {
                raf_write.write(buffer, 0, len);
            }
            raf_read.close();
        }
        raf_write.close();
        // 判断合并后的文件是否与源文件相同
        FileInputStream fileInputStream = new FileInputStream(sourceFile);
        FileInputStream mergeFileStream = new FileInputStream(mergeFile);
        //取出原始文件的md5
        String originalMd5 = DigestUtils.md5Hex(fileInputStream);
        //取出合并文件的md5进行比较
        String mergeFileMd5 = DigestUtils.md5Hex(mergeFileStream);
        if (originalMd5.equals(mergeFileMd5)) {
            System.out.println("合并文件成功");
        } else {
            System.out.println("合并文件失败");
        }
    }


    /**
     * 测试上传分块到minio
     */
    @Test
    void uploadMinio() {
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


    /**
     * 测试将minio的分块合并
     *
     * @throws Exception
     */
    @Test
    void mergeMinio() throws Exception {
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


    /**
     * 获取签名
     *
     * @return
     */
    @Test
    void getPresignedUrl() {
        String fileName = "pre.mp4";
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String objectName = format + "/" + fileName;
        String preSignedUrl = null;

        try {
            // 制作签名
            preSignedUrl = minioClient.getPresignedObjectUrl(GetPresignedObjectUrlArgs.builder()
                    .method(Method.PUT) //这里必须是PUT，如果是GET的话就是文件访问地址了。如果是POST上传会报错.
                    .bucket(bucketName)
                    .object(objectName)
                    .expiry(60 * 60 * 24)
                    .build());
            System.out.println("预签名: " + preSignedUrl);
        } catch (Exception e) {
            System.out.println("获取预签名失败");
        }
    }
}
