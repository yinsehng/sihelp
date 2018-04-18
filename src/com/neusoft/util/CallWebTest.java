package com.neusoft.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.zip.GZIPInputStream;

public class CallWebTest {
	
	public static String call(){
		URL url = null;
		HttpURLConnection urlConn = null;
		InputStream in = null;
		BufferedReader br = null;
		StringBuilder content = new StringBuilder(200);
		try {
			url = new URL("http://www.baidu.com");
			urlConn = (HttpURLConnection) url.openConnection();
			urlConn.setRequestProperty("User-Agent","Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
			urlConn.setRequestProperty("Accept","image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*");
			urlConn.setRequestProperty("Accept-Language", "zh-cn");
			urlConn.setRequestProperty("UA-CPU", "x86");
			urlConn.setRequestProperty("Accept-Encoding", "gzip");// 
			urlConn.setRequestProperty("Content-type", "text/html");
			urlConn.setRequestProperty("Connection", "close"); // 减轻被访问的压力，
			urlConn.setUseCaches(false);// 缓存
			urlConn.setConnectTimeout(6 * 1000);
			urlConn.setReadTimeout(6 * 1000);
			urlConn.setDoOutput(true);
			urlConn.setDoInput(true);
			urlConn.setRequestMethod("POST");
			if (urlConn.getContentEncoding() != null && !urlConn.getContentEncoding().equalsIgnoreCase("")) {
				String encode = urlConn.getContentEncoding().toLowerCase();
				if (encode != null && !encode.equalsIgnoreCase("") && encode.indexOf("gzip") >= 0) {
					in = new GZIPInputStream(urlConn.getInputStream());
				}
			}
			if (null == in) {
				in = urlConn.getInputStream();
			}
			if (null != in) {
				br = new BufferedReader(new InputStreamReader(in, "gb2312"));
				String line = "";
				while ((line = br.readLine()) != null) {
					content.append(line);
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return e.getMessage();
		} catch (IOException e) {
			e.printStackTrace();
			return e.getMessage();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
					 StringWriter sw = new StringWriter();  

			            e.printStackTrace(new PrintWriter(sw, true));  


					return e.getMessage();
				}
				in = null;
			}
			if (null != br) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
					return e.getMessage();
				}
				in = null;
			}
		}
		return content.toString();
	}
	
	public static void main(String args[]){
			call();
	}
}
