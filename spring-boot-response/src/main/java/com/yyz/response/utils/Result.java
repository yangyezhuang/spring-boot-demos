package com.yyz.response.utils;

import lombok.Data;

/**
 * 封装数据类型
 *
 * @author YZ.YANG
 * @date 2023/8/31 10:41
 */
@Data
public class Result {
    private int code;
    private String msg;
    private Object data;

    public void setResultCode(ResultCode code) {
        this.code = code.getCode();
        this.msg = code.getMsg();
    }


    /**
     * 成功 不返回数据直接返回成功信息
     *
     * @return 封装结果
     */
    public static Result success() {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        return result;
    }


    /**
     * 成功 并且加上返回数据
     *
     * @param data 数据
     * @return 封装结果
     */
    public static Result success(Object data) {
        Result result = new Result();
        result.setResultCode(ResultCode.SUCCESS);
        result.setData(data);
        return result;
    }


    /**
     * 成功 自定义成功返回状态 加上数据
     *
     * @param resultCode 状态码
     * @param data       数据
     * @return 封装结果
     */
    public static Result success(ResultCode resultCode, Object data) {
        Result result = new Result();
        result.setResultCode(resultCode);
        result.setData(data);
        return result;
    }


    /**
     * 单返回失败的状态码
     *
     * @param resultCode 状态码
     * @return 封装结果
     */
    public static Result fail(ResultCode resultCode) {
        Result result = new Result();
        result.setResultCode(resultCode);
        return result;
    }


    /**
     * 返回失败的状态码及数据
     *
     * @param resultCode 状态码
     * @param data       数据
     * @return 封装结果
     */
    public static Result fail(ResultCode resultCode, Object data) {
        Result result = new Result();
        result.setResultCode(resultCode);
        result.setData(data);
        return result;
    }

}
