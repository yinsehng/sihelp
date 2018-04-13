package com.neusoft.util;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import freemarker.template.TemplateException;

public class Snippet {
	public static void main(String[] args) {
		htmlTest();
	}
	public static void htmlTest(){
		DocUtil docUtil=new DocUtil();
		Map<String, Object> dataMap=new HashMap<String, Object>();
        dataMap.put("akb021", "成大方圆医药公司二道沟分店");
        dataMap.put("aae004", "杨春雨");
        dataMap.put("aae006", "长春市宽城区铁北康泰乐园10栋1楼门市");
        dataMap.put("ckb162", "10000001");
        dataMap.put("aae005", "86134006");
			try {
				//TemplateParseUtil.parse("/", "protocol.ftl", "tempFile/htmlTest.html", dataMap);
				docUtil.createDoc(dataMap, "protocol", "/protocol/dingdian.html");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
}

