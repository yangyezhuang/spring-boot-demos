package com.yyz.minio.pojo;

import lombok.Data;
import lombok.ToString;

/**
 * 媒资文件查询请求模型类
 */
@Data
@ToString
public class QueryMediaParamsDto {
    // 媒资文件名称
    private String filename;
    // 媒资类型
    private String fileType;
    // 审核状态
    private String auditStatus;
}
