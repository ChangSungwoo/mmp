package com.mymovieprice.mmp.common.web;

public class MMPExceptionHandler extends RuntimeException {
	

	private static final long serialVersionUID = 8374839679758617081L;

	private String exceptionMsg;
	private String exceptionCode;
	private String exceptionSrc;

	public MMPExceptionHandler(String exceptionMsg, String exceptionCode , String exceptionSrc) {
		super();
		this.exceptionMsg = exceptionMsg;
		this.exceptionCode = exceptionCode;
		this.exceptionSrc = exceptionSrc;
	}

	public String getExceptionMsg() {
		return exceptionMsg;
	}

	public void setExceptionMsg(String exceptionMsg) {
		this.exceptionMsg = exceptionMsg;
	}

	public String getExceptionCode() {
		return exceptionCode;
	}

	public void setExceptionCode(String exceptionCode) {
		this.exceptionCode = exceptionCode;
	}

	public String getExceptionSrc() {
		return exceptionSrc;
	}

	public void setExceptionSrc(String exceptionSrc) {
		this.exceptionSrc = exceptionSrc;
	}
	
}
