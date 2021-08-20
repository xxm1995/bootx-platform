package cn.bootx.common.core.rest;

import cn.bootx.common.core.code.CommonCode;

import java.io.Serializable;

/**
* 响应类
* @author xxm
* @date 2020/1/22 15:26
*/
public class ResResult<T> implements Serializable {
    private static final long serialVersionUID = -3041700282408360384L;
    private String msg = "success";
    private int code = CommonCode.SUCCESS_CODE;
    private T data;
    public ResResult() {
        super();
    }

    public ResResult(int code) {
        this.code = code;
    }

    public ResResult(int code, T data) {
        this(code);
        this.data = data;
    }

    public ResResult(int code, String msg) {
        this(code);
        this.msg = msg;
    }

    public ResResult(int code, T data, String msg) {
        this(code, msg);
        this.data = data;
    }

    public String getMsg() {
        return msg;
    }

    public ResResult<T> setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public int getCode() {
        return code;
    }

    public ResResult<T> setCode(int code) {
        this.code = code;
        return this;
    }

    public T getData() {
        return data;
    }

    public ResResult<T> setData(T data) {
        this.data = data;
        return this;
    }
}
