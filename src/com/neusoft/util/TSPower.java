package com.neusoft.util;

public class TSPower {
	private int id;// tree����

	private String text;// tree����

	private String state;// tree����

	private boolean checked = false;// �Ƿ�ѡ��

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
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
}
