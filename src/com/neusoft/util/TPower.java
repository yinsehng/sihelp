package com.neusoft.util;

import java.util.List;

public class TPower {

	private int id;// tree����

	private String text;// tree����

	private String state;// tree����

	private boolean checked = false;// �Ƿ�ѡ��

	private List<TSPower> children;// Ҷ�ӽڵ�

	public List<TSPower> getChildren() {
		return children;
	}

	public void setChildren(List<TSPower> children) {
		this.children = children;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

}
