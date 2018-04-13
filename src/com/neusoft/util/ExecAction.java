package com.neusoft.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.zip.GZIPInputStream;

import org.apache.log4j.Logger;

public class ExecAction {

	/**
	 * @author 迟国会
	 * @param charset 字符集
	 * @param akb020 定点编号
	 * @param code 执行过程1签到，2对照，3传输
	 * @return 执行字符串XML文件
	 * */
	public  String getActionReturn(String charset,String akb020,String code) {

		URL url = null;
		HttpURLConnection urlConn = null;
		try {
			url = new URL("http://10.1.1.30:7071/his/PreBalanceAction.do?userid=2005&startdate="+akb020+"|"+code+"|&method=queryyc02");
			urlConn = (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		urlConn.setRequestProperty("User-Agent",
				"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
		urlConn.setRequestProperty(
				"Accept",
				"image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*");
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

		BufferedReader br = null;
		StringBuilder content = new StringBuilder(200);
		InputStream in = null;
		try {
			if (null == urlConn) {
				return "";
			}
			if (urlConn.getContentEncoding() != null
					&& !urlConn.getContentEncoding().equalsIgnoreCase("")) {
				String encode = urlConn.getContentEncoding().toLowerCase();
				if (encode != null && !encode.equalsIgnoreCase("")
						&& encode.indexOf("gzip") >= 0) {
					in = new GZIPInputStream(urlConn.getInputStream());
				}
			}

			if (null == in) {
				in = urlConn.getInputStream();
			}
			if (null != in) {
				br = new BufferedReader(new InputStreamReader(in, charset));
				String line = "";
				while ((line = br.readLine()) != null) {
					content.append(line);
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				in = null;
			}
			if (null != br) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
				in = null;
			}
		}
		return content.toString();
	}
	
	
	public static String getActionReturn1(String urls) {
	    if(urls.equals("1")){
	         return null;
	    }
	    String retval="";
	    URL url = null;
	    HttpURLConnection urlConn = null;
	    try {
	        url = new URL(urls);
	        urlConn = (HttpURLConnection) url.openConnection();
	    } catch (MalformedURLException e2) {
	      // TODO Auto-generated catch block
	         e2.printStackTrace();
	         retval=e2.getMessage();
	         return retval;
	    } catch (IOException e) {
	          e.printStackTrace();
	          retval=e.getMessage();
	          return retval;
	    }

	    urlConn.setRequestProperty("User-Agent",
	        "Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)");
	    urlConn.setRequestProperty(
	        "Accept",
	        "image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-powerpoint, application/vnd.ms-excel, application/msword, */*");
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

	    BufferedReader br = null;
	    StringBuilder content = new StringBuilder(200);
	    InputStream in = null;
	    try {
	      if (null == urlConn) {
	        return "";
	      }
	      if (urlConn.getContentEncoding() != null
	          && !urlConn.getContentEncoding().equalsIgnoreCase("")) {
	        String encode = urlConn.getContentEncoding().toLowerCase();
	        if (encode != null && !encode.equalsIgnoreCase("")
	            && encode.indexOf("gzip") >= 0) {
	          in = new GZIPInputStream(urlConn.getInputStream());
	        }
	      }

	      if (null == in) {
	        in = urlConn.getInputStream();
	      }
	      if (null != in) {
	        br = new BufferedReader(new InputStreamReader(in, "utf-8"));
	        String line = "";
	        while ((line = br.readLine()) != null) {
	          content.append(line);
	        }
	      }
	    } catch (UnsupportedEncodingException e) {
	      e.printStackTrace();
	      retval=e.getMessage();
	      return retval;
	    } catch (IOException e) {
	      e.printStackTrace();
	      retval=e.getMessage();
	      return retval;
	    } finally {
	      if (null != in) {
	        try {
	          in.close();
	        } catch (IOException e) {
	          e.printStackTrace();
	          retval=e.getMessage();
	          return retval;
	        }
					in = null;
				}
				if (null != br) {
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
	          retval=e.getMessage();
	          return retval;
					}
					in = null;
				}
			}
			return content.toString();
		}
	
	public static void main(String[] args) {
		System.out.println(getActionReturn1("http://localhost:9080/sihelp"));
	}
}
