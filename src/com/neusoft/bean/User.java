package com.neusoft.bean;

import java.util.Date;

public class User {
	public String name;
	public String password;
	public String ip;
	public Date enddate;
	public int times;
	public String akb021;
	public int type;//�û����� 1����Ա 0����
	public String uflag;//1ҽԺ2ҩ��
	public String wq_valid;
	public String wq_year;
	
	
	
	public String getWq_year() {
		return wq_year;
	}
	public void setWq_year(String wq_year) {
		this.wq_year = wq_year;
	}
	public String getWq_valid() {
		return wq_valid;
	}
	public void setWq_valid(String wq_valid) {
		this.wq_valid = wq_valid;
	}
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
				+ akb021 + ", type=" + type + ", uflag=" + uflag
				+ ", wq_valid=" + wq_valid + ", wq_year=" + wq_year + "]";
	}
	
	
}
