package com.neusoft.util;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

public class EnvServlet {
	public long timeUse=0;
	public Hashtable<String,String> htParam=new Hashtable<String,String>();
	private Hashtable<String,String> htShowMsg=new Hashtable<String,String>();
	public void setHashtable()
	{
		Properties me=System.getProperties();
		Enumeration em=me.propertyNames();
		while(em.hasMoreElements())
		{
			String strKey=(String)em.nextElement();
			String strValue=me.getProperty(strKey);
			htParam.put(strKey,strValue);
		}
	}	
	public String queryHashtable(String strKey)
	{
		strKey=(String)htParam.get(strKey);
		return strKey;
	}

}
