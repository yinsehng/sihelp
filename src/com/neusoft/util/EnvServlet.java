package com.neusoft.util;

import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Properties;

public class EnvServlet {
	public long timeUse=0;
	public Hashtable htParam=new Hashtable();
	private Hashtable htShowMsg=new Hashtable();
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
