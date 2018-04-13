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

public class ExecSiAction {


	/**
	 * @author 迟国会
	 * @param charset 字符集
	 * @param akb020 定点编号
	 * @param code 执行过程1签到，2对照，3传输
	 * @return 执行字符串XML文件
	 * */
	public  String getActionReturn(String inputdata,String cardinfo,String dllparam,String dllparm) {

		URL url = null;
		HttpURLConnection urlConn = null;
		try {
			ReadPro rp=new ReadPro();
			String ip=rp.getValue("siip");
			String port=rp.getValue("siport");
			String username=rp.getValue("username");
			String password=rp.getValue("password");
//			url = new URL("http://88.1.1.203:7071/eapdomain/si/SiInterfaceAction.do?method=siInterface&eap_username=admin&eap_password=1&inputData="+inputdata+"&dllParam=001D927E7FCF|50&dllparm=1$229900|1|150901|1|150901|1|150901|1|150901|1|150901|&cardInfo="+cardinfo+"");
			url = new URL("http://"+ip+":"+port+"/eapdomain/si/SiInterfaceAction.do?method=siInterface&eap_username="+username+"&eap_password="+password+"&inputData="+inputdata+"&dllParam="+dllparam+"&dllparm="+dllparm+"&cardInfo="+cardinfo+"");
			System.out.println(url.toString());
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
		urlConn.setConnectTimeout(1000000000);
		urlConn.setReadTimeout(600000000);
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
				br = new BufferedReader(new InputStreamReader(in, "gbk"));
				String line = "";
				while ((line = br.readLine()) != null) {
					content.append(line);
				}
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return errorMes(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
			return errorMes(e.getMessage());
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
					return errorMes(e.getMessage());
				}
				in = null;
			}
			if (null != br) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
					return errorMes(e.getMessage());
				}
				in = null;
			}
		}
		return content.toString();
	}
	
	public String errorMes(String err){
		String e="<reponseEnvelope><header><appCode>1</appCode><errorMessage briefMessage=\"\" detailMessage=\"^"+err+"^\"/></header><body><parameters></parameters><dataStores></dataStores></body></reponseEnvelope>";
		return e;
	}

}
