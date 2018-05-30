package util;

import java.io.Serializable;
/**
 * 返回信息
 * @author haq
 * @time 2018年5月6日18:54:09
 */
public class ResultUtil implements Serializable{

	private static final long serialVersionUID = 6567248280447916184L;
	
	public ResultUtil() {
		super();
	}
	public ResultUtil(String resultCode, String resultMessage, Object resultData) {
		super();
		this.resultCode = resultCode;
		this.resultMessage = resultMessage;
		this.resultData = resultData;
	}

	/*
	 * 返回结果-状态编码  
	 * 1.成功：200;
	 * 2.后台代码执行报错：500;
	 */
	private String resultCode;
	/*
	 * 返回结果-文字描述
	 */
	private String resultMessage;
	/*
	 * 返回结果-数据信息
	 */
	private Object resultData;
	public String getResultCode() {
		return resultCode;
	}
	public void setResultCode(String resultCode) {
		this.resultCode = resultCode;
	}
	public String getResultMessage() {
		return resultMessage;
	}
	public void setResultMessage(String resultMessage) {
		this.resultMessage = resultMessage;
	}
	public Object getResultData() {
		return resultData;
	}
	public void setResultData(Object resultData) {
		this.resultData = resultData;
	}
	
}
