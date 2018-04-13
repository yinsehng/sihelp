package com.neusoft.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class TextJson<M> {

	/**
	 * 将对象或集合转换为json,使用json-lib api
	 * 
	 */

	public String table(Page<M> page) {
		StringBuffer sb = new StringBuffer();
		if (page != null) {
			sb.append("{\"total\":");
			sb.append(page.getCount() + ",");
			sb.append("\"rows\"" + ":");
			sb.append(process(page.getList()));
			sb.append("}");
		}
		return sb.toString();
	}

	public String table(Page<M> page, String[] c) {
		StringBuffer sb = new StringBuffer();
		if (page != null) {
			sb.append("{\"total\":");
			sb.append(page.getCount() + ",");
			sb.append("\"rows\"" + ":");
			sb.append(process(page.getList(), c));
			sb.append("}");
		}
		return sb.toString();
	}

	/**
	 * 处理object
	 * */
	public String process(M m) {
		JsonConfig c = new JsonConfig();
		c.registerJsonValueProcessor(Date.class, new DateProcess());
		JSONObject json = JSONObject.fromObject(m);
		return json.toString();
	}

	/**
	 * 处理object,带过滤
	 * */
	public String process(M m, String[] exclusions) {
		JsonConfig c = new JsonConfig();
		c.setExcludes(exclusions);
		c.registerJsonValueProcessor(Date.class, new DateProcess());
		JSONObject json = JSONObject.fromObject(m, c);
		return json.toString();
	}

	/**
	 * 处理list
	 * */
	public String process(List<M> list) {
		JsonConfig c = new JsonConfig();
		c.registerJsonValueProcessor(Date.class, new DateProcess());
		JSONArray json = JSONArray.fromObject(list);
		return json.toString();
	}

	/**
	 * 处理list,带过滤
	 * */
	public String process(List<M> list, String[] exclusions) {
		JsonConfig c = new JsonConfig();
		c.setExcludes(exclusions);
		c.registerJsonValueProcessor(Date.class, new DateProcess());
		JSONArray json = JSONArray.fromObject(list, c);
		return json.toString();
	}

	/**
	 * Date处理,实现JsonValueProcessor接口
	 * */
	class DateProcess implements JsonValueProcessor {

		private final String format = "yyyy-MM-dd HH:mm";

		public Object processArrayValue(Object obj, JsonConfig c) {
			// TODO Auto-generated method stub
			return null;
		}

		public Object processObjectValue(String str, Object obj, JsonConfig c) {
			if (obj == null) {
				return null;
			} else if (obj instanceof Date) {
				return new SimpleDateFormat(format).format((Date) obj);
			}
			return null;
		}

	}
}
