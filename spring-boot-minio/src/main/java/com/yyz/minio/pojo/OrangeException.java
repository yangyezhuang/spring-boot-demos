package com.example.minio.pojo;

/**
 * 自定义异常类型
 */
public class OrangeException extends RuntimeException {
    private String errMessage;

    public String getErrMessage() {
        return errMessage;
    }

    public OrangeException(String message) {
        super(message);
        this.errMessage = message;
    }

    public static void cast(String message) {
        throw new OrangeException(message);
    }

    public static void cast(CommonError error) {
        throw new OrangeException(error.getErrMessage());
    }
}
