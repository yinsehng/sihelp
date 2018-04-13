package com.neusoft.util;

import java.util.HashMap;
import java.util.Map;

public class TestDoc1 {
    public static void main(String[] args) {
        DocUtil docUtil=new DocUtil();
        Map<String, Object> dataMap=new HashMap<String, Object>();
        dataMap.put("akb021", "成大方圆医药公司二道沟分店");
        dataMap.put("aae004", "杨春雨");
        dataMap.put("aae006", "长春市宽城区铁北康泰乐园10栋1楼门市");
        dataMap.put("ckb162", "10000001");
        dataMap.put("aae005", "86134006");
        docUtil.createDoc(dataMap, "dingdian", "D:\\dingdian1.doc");
    }
}