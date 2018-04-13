package com.neusoft.util;

import java.io.Serializable;
import java.util.List;

public class Page<M> implements Serializable {

	/**
	 * ��װ��page,�����ܵ�ǰҳ��,ÿҳ����,��ҳ���Լ����ݼ���
	 */
	private static final long serialVersionUID = 1L;

	private int current = 0;// Ĭ�ϲ���ҳ

	private int per = 10;// ÿҳ��ʾ����������(Ĭ��)

	private List<M> list;// ���ݼ���

	private int count;// ����ҳ��

	public int getCount() {
		return count;
	}

	public void setCount(long count) {
		this.count = (int) (count % per == 0 ? count / per : count / per + 1);
	}

	public void setPer(int per) {
		this.per = per;
	}

	public int getCurrent() {
		return current;
	}

	public int getPer() {
		return per;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	public List<M> getList() {
		return list;
	}

	public void setList(List<M> list) {
		this.list = list;
	}

}
