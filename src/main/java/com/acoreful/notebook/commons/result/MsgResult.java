package com.acoreful.notebook.commons.result;

import java.io.UnsupportedEncodingException;

public class MsgResult {
	private boolean success;
	private Object data;
	private String errorCode;
	private String msg;
	
	
	private MsgResult(boolean success, Object data, String msg) {
		super();
		this.success = success;
		this.data = data;
		this.msg = msg;
	}
	private MsgResult(boolean success, Object data, String errorCode, String msg) {
		super();
		this.success = success;
		this.data = data;
		this.errorCode = errorCode;
		this.msg = msg;
	}

	/**
	 * 只返回成功的布尔值
	 * @return
	 */
	public static MsgResult success() {
		return new MsgResult(true, null, null);
	}
	
	/**
	 * 返回成功的布尔值和数据
	 * @param data
	 * @return
	 */
	public static MsgResult success(Object data) {
		return new MsgResult(true, data, null);
	}
	
	/**
	 * 返回成功的布尔值、数据和消息
	 * @param data
	 * @param msg
	 * @return
	 */
	public static MsgResult success(Object data, String msg) {
		return new MsgResult (true, data, msg);
	}
	
	/**
	 * 只返回失败的布尔值
	 * @return
	 */
	public static MsgResult failure() {
		return new MsgResult(false, null, null);
	}
	
	/**
	 * 返回失败的布尔值和数据
	 * @param data
	 * @return
	 */
	public static MsgResult failure(Object data) {
		return new MsgResult(false, data, null);
	}
	
	/**
	 * 返回失败的布尔值、数据和消息
	 * @param data
	 * @param msg
	 * @return
	 */
	public static MsgResult failure(String errorCode,String msg) {
		return new MsgResult(false, null,errorCode, msg);
	}
	/**
	 * 返回失败的布尔值、数据和消息
	 * @param data
	 * @param msg
	 * @return
	 */
	public static MsgResult failure(Object data, String msg) {
		return new MsgResult(false, data, msg);
	}
	
	public static String attachment(String fileName, String format) {
		return attachment(fileName + "." + format);
	}
	
	public static String attachment(String fullFileName) {
		String encodedFileName = "";
		try {
			encodedFileName = new String(fullFileName.getBytes(), "ISO8859-1"); // 解决中文乱码问题
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "attachment; filename=\"" + encodedFileName + "\"";
	}
	
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public String getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
