package com.yyz.minio.pojo;

/**
 * 自定义异常类型
 */
public class MinioException extends RuntimeException {
    private String errMessage;

    public String getErrMessage() {
        return errMessage;
    }

    public MinioException(String message) {
        super(message);
        this.errMessage = message;
    }

    public static void cast(String message) {
        throw new MinioException(message);
    }

    public static void cast(CommonError error) {
        throw new MinioException(error.getErrMessage());
    }
}
