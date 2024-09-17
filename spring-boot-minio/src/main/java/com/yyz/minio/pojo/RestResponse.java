package com.yyz.minio.pojo;


public class RestResponse<T> {
    /**
     * 相应编码 0为正常 -1为错误
     */
    private int code;
    /**
     * 响应提示信息
     */
    private String msg;
    /**
     * 响应内容
     */
    private T result;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public T getResult() {
        return result;
    }

    public void setResult(T result) {
        this.result = result;
    }

    public RestResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public RestResponse() {
        this(0, "success");
    }

    /**
     * 错误信息的封装
     */
    public static <T> RestResponse<T> validfail() {
        RestResponse<T> response = new RestResponse<>();
        response.setCode(-1);
        return response;
    }

    public static <T> RestResponse<T> validfail(String msg) {
        RestResponse<T> response = new RestResponse<>();
        response.setCode(-1);
        response.setMsg(msg);
        return response;
    }

    public static <T> RestResponse<T> validfail(T result, String msg) {
        RestResponse<T> response = new RestResponse<>();
        response.setCode(-1);
        response.setMsg(msg);
        response.setResult(result);
        return response;
    }

    /**
     * 正常信息的封装
     */
    public static <T> RestResponse<T> success() {
        return new RestResponse<>();
    }

    public static <T> RestResponse<T> success(T result) {
        RestResponse<T> response = new RestResponse<>();
        response.setResult(result);
        return response;
    }

    public static <T> RestResponse<T> success(String msg, T result) {
        RestResponse<T> response = new RestResponse<>();
        response.setMsg(msg);
        response.setResult(result);
        return response;
    }
}
