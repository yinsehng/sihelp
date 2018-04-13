package com.neusoft.util;

import java.util.Properties;

public class OSinfo {
	/**
	 * 
	 *  ��                                         ���ֵ������ 
		java.version Java ����ʱ�����汾 
		java.vendor Java ����ʱ������Ӧ�� 
		java.vendor.url Java ��Ӧ�̵� URL 
		java.home Java ��װĿ¼ 
		java.vm.specification.version Java ������淶�汾 
		java.vm.specification.vendor Java ������淶��Ӧ�� 
		java.vm.specification.name Java ������淶���� 
		java.vm.version Java �����ʵ�ְ汾 
		java.vm.vendor Java �����ʵ�ֹ�Ӧ�� 
		java.vm.name Java �����ʵ������ 
		java.specification.version Java ����ʱ�����淶�汾 
		java.specification.vendor Java ����ʱ�����淶��Ӧ�� 
		java.specification.name Java ����ʱ�����淶���� 
		java.class.version Java ���ʽ�汾�� 
		java.class.path Java ��·�� 
		java.library.path ���ؿ�ʱ������·���б� 
		java.io.tmpdir Ĭ�ϵ���ʱ�ļ�·�� 
		java.compiler Ҫʹ�õ� JIT ������������ 
		java.ext.dirs һ��������չĿ¼��·�� 
		os.name ����ϵͳ������ 
		os.arch ����ϵͳ�ļܹ� 
		os.version ����ϵͳ�İ汾 
		file.separator �ļ��ָ������� UNIX ϵͳ���ǡ�/���� 
		path.separator ·���ָ������� UNIX ϵͳ���ǡ�:���� 
		line.separator �зָ������� UNIX ϵͳ���ǡ�/n���� 
		user.name �û����˻����� 
		user.home �û�����Ŀ¼ 
		user.dir  �û��ĵ�ǰ����Ŀ¼
		
		�����һ���Ի�ȡ����ϵͳ��ȫ����Ϣ�������������´��룺
		java.util.Enumeration enum =props.propertyNames();
		while (enum.hasMoreElements()){
		   String name= (String)enum.nextElement();
		   String value = props.getProperty(name);
		   System.out.println(name+" : "+value+"\n");
		)
	 */
	public void getOsInfo(){
		Properties props=System.getProperties(); //���ϵͳ���Լ�    
		String osName = props.getProperty("os.name"); //����ϵͳ����    
		String osArch = props.getProperty("os.arch"); //����ϵͳ����    
		String osVersion = props.getProperty("os.version"); //����ϵͳ�汾   
		String osuser=props.getProperty("user.name");
		System.out.println(osName + osArch+osVersion+osuser);
	}
	public static void main(String args[]){
		new OSinfo().getOsInfo();
	}

}
