package com.yyz.response.utils;

/**
 * 状态码
 *
 * @author YZ.YANG
 * @date 2023/8/31 10:42
 */
public enum ResultCode {
    SUCCESS(1, "成功"),
    FAIL(0, "鼠失败"),
    SERVER_BUSY(503, "服务器正忙，请稍后再试");

    private int code;
    private String msg;

    ResultCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public int getCode() {
        return this.code;
    }

    public String getMsg() {
        return this.msg;
    }
}
