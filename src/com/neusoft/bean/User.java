package com.neusoft.bean;

import java.util.Date;

public class User {
	public String name;
	public String password;
	public String ip;
	public Date enddate;
	public int times;
	public String akb021;
	public int type;//用户类型 1管理员 0定点
	public String uflag;//1医院2药店
	
	
	
	public String getUflag() {
		return uflag;
	}
	public void setUflag(String uflag) {
		this.uflag = uflag;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	public int getTimes() {
		return times;
	}
	public void setTimes(int times) {
		this.times = times;
	}
	public String getAkb021() {
		return akb021;
	}
	public void setAkb021(String akb021) {
		this.akb021 = akb021;
	}
	@Override
	public String toString() {
		return "User [name=" + name + ", password=" + password + ", ip=" + ip
				+ ", enddate=" + enddate + ", times=" + times + ", akb021="
				+ akb021 + ", type=" + type + ", uflag=" + uflag + "]";
	}
	
}
