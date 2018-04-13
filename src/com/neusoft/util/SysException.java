package com.neusoft.util;

public class SysException extends RuntimeException {

	/**
	 * 持久层异常封装类
	 */
	private static final long serialVersionUID = 1L;

	private Throwable cause;// 错误原因

	public SysException(String msg) {
		super(msg);
	}

	public SysException(String msg, Throwable ex) {
		super(msg);
		this.cause = ex;
	}

	public SysException(Throwable ex) {
		super(ex);
		this.cause = ex;
	}

	public Throwable getCause() {
		return (this.cause == null ? this : this.cause);
	}

	public String getMessage() {
		String message = super.getMessage();
		Throwable cause = getCause();
		if (cause != null) {
			message = message + "caused by:" + cause;
		}
		return message;
	}
}