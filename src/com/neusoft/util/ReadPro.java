package com.neusoft.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.Properties;

public class ReadPro {
	private Properties propertie; 
	private FileInputStream inputFile;
	
	public ReadPro(){
		propertie=new Properties();
    	try {
    		URL url=ReadPro.class.getResource("./config.properties");
    		String furl=java.net.URLDecoder.decode(url.getFile(),"utf-8");  
    		inputFile=new FileInputStream(furl);//得到当前文件所在路径
			propertie.load(inputFile);
			inputFile.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public String getValue(String key){
		String value="";
		if(propertie.containsKey(key)){
			value=propertie.getProperty(key);
			return value;
		}else{
			return value;
		}
  }
	public static void main(String[] args) {
		new ReadPro();
	}
}
