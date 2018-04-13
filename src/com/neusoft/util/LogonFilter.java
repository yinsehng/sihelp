package com.neusoft.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.MDC;


public class LogonFilter implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;  
	    HttpServletResponse response = (HttpServletResponse) res;  
	    response.setCharacterEncoding("utf-8");
	    HttpSession session = request.getSession();  
	    
	    StringBuffer url=request.getRequestURL();
    	String urls[]=url.toString().split("/");
    	String page=urls[urls.length-1];
    	
	    if (session.getAttribute("user") != null) {//��¼����ܷ���  
	    	//1.���Ȳ�ѯ�����ʵ�ҳ���Ƿ��ڲ˵��б���
//	    	int flagall=0;
//	    	ArrayList alall=(ArrayList)session.getAttribute("menuall");
//	    	Iterator itall=alall.iterator();
//	    	while(itall.hasNext()){
//	    		Menu m=(Menu)itall.next();
//	    		String lurl=m.getLocation();
//	    		String jsps[]=lurl.split("/");
//	    		String jsp=jsps[jsps.length-1];
//	    		if(jsp.equalsIgnoreCase(page)){//�˵��б�����
//	    			flagall=1;
//	    		}
//	    	}
//	    	//����ҳ��Ϊ�˵��б���ҳ��
//	    	if(flagall==1){
//	    		//2.�鿴Ȩ���б����Ƿ���
//	    		//Ȩ�޲�ѯ
//		    	int flag=0;
//		    	ArrayList al=(ArrayList)session.getAttribute("menu");
//		    	Iterator it=al.iterator();
//		    	while(it.hasNext()){
//		    		Menu m=(Menu)it.next();
//		    		String lurl=m.getLocation();
//		    		String jsps[]=lurl.split("/");
//		    		String jsp=jsps[jsps.length-1];
//		    		if(jsp.equalsIgnoreCase(page)){//���ʵ�ҳ����Ȩ�ޱ�����
//		    			flag=1;
//		    		}
//		    	}
//		    	if(flag==1){//��Ȩ��
		    		chain.doFilter(request, response);  
//		    	}else{//û��Ȩ��
//		    		response.sendRedirect("quit.jsp"); 
//		    	}
//	    	}else{//�����б���ҳ��ֱ�ӷ���
//	    		chain.doFilter(request, response);  
//	    	}
	    } else { //δ��¼
	    	//���·��������ӡ����
	    	
	    	if(page.equalsIgnoreCase("index.jsp")||page.equalsIgnoreCase("install_lodop") || page.equalsIgnoreCase("quit.jsp")|| page.equalsIgnoreCase("note.jsp")){
	    		chain.doFilter(request, response);  
	    	}else{
	    		String path = request.getContextPath();
	    		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	    		response.sendRedirect(basePath+"index.jsp");  
	    	}
	    }  
		
	}

	public void init(FilterConfig arg0) throws ServletException {
		
		
	}
	
}
