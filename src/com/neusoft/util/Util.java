package com.neusoft.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;

public class Util {
	
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
	 public static boolean isHasValues(Object object){
	        Field[] fields = object.getClass().getDeclaredFields();
	        boolean flag = false;
	        for (int i = 0; i < fields.length; i++) {
	            String fieldName = fields[i].getName();
	            String methodName = "get"+fieldName.substring(0, 1).toUpperCase()+fieldName.substring(1);
	            Method getMethod;
	            try {
	                getMethod = object.getClass().getMethod(methodName);
	                Object obj = getMethod.invoke(object);
	                if (obj != null) {
	                    flag = true;
	                    break;
	                }
	            } catch (Exception e) {
	            }
	            
	        }
	        return flag;
	        
	    }
	

}
