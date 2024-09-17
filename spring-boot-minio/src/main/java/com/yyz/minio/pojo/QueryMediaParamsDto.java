package com.yyz.minio.pojo;

/**
 * 媒资文件查询请求模型类
 */
public class QueryMediaParamsDto {
    // 媒资文件名称
    private String filename;
    // 媒资类型
    private String fileType;
    // 审核状态
    private String auditStatus;

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getAuditStatus() {
        return auditStatus;
    }

    public void setAuditStatus(String auditStatus) {
        this.auditStatus = auditStatus;
    }
}
