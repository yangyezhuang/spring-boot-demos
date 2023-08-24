package com.yyz.minio.pojo;

import lombok.Data;
import lombok.ToString;

/**
 * 上传普通文件请求参数
 */
 @Data
 @ToString
public class UploadFileParamsDto {

 /**
  * 文件名称
  */
 private String filename;

 /**
  * 文件content-type
 */
 private String contentType;

 /**
  * 文件类型（文档，图片，视频）
  */
 private String fileType;
 /**
  * 文件大小
  */
 private Long fileSize;
}
