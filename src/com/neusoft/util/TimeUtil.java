package com.neusoft.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {

	public static String getCurrentDate(String formate) {
		Date date = new Date();
		return new SimpleDateFormat(formate).format(date);
	}
	
	public static String getDate(String strdate){
		return new SimpleDateFormat("yyyyÄêMMÔÂddÈÕ").format(convertStringToDate(strdate, "yyyy-MM-dd"));
	}
	public static Date convertStringToDate(String strdate, String format) {
		SimpleDateFormat sdf = new SimpleDateFormat(format);
	    Date date = null;
		try {
			date = sdf.parse(strdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    return date;
	}
	
	public static boolean compareDate(String startDate, String endDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date dt1 = df.parse(startDate);
            Date dt2 = df.parse(endDate);
            if (dt1.getTime() > dt2.getTime()) {
                return true;
            } else if (dt1.getTime() < dt2.getTime()) {
                return false;
            } else {
                return false;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
        }
		return false;
	}
	
	public static java.sql.Date sqlDate(String strDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = null;
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
	    return new java.sql.Date(date.getTime());
	}
	
	public static String getSubstrData(String str) {
		if (str != null && !"".equals(str)){
			if (str.contains(".0")) {
				return str.substring(0, str.indexOf("."));
			}
		}
		return "";
	}
	
	public static String getStrDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = sdf.format(date);
		return str;
	}
	
	public static String getYear() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String str = sdf.format(new Date());
		return str;
	}
	
	
	public static String getStrDate(Date date, boolean b) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str = sdf.format(date);
		return str;
	}
}
