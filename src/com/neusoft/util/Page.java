package com.neusoft.util;

import java.io.Serializable;
import java.util.List;

public class Page<M> implements Serializable {

	/**
	 * 封装的page,包括总当前页数,每页条数,总页数以及数据集合
	 */
	private static final long serialVersionUID = 1L;

	private int current = 0;// 默认不分页

	private int per = 10;// 每页显示多少条数据(默认)

	private List<M> list;// 数据集合

	private int count;// 总数页数

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
