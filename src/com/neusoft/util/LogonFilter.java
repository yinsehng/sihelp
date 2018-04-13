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
    	
	    if (session.getAttribute("user") != null) {//登录后才能访问  
	    	//1.首先查询所访问的页面是否在菜单列表中
//	    	int flagall=0;
//	    	ArrayList alall=(ArrayList)session.getAttribute("menuall");
//	    	Iterator itall=alall.iterator();
//	    	while(itall.hasNext()){
//	    		Menu m=(Menu)itall.next();
//	    		String lurl=m.getLocation();
//	    		String jsps[]=lurl.split("/");
//	    		String jsp=jsps[jsps.length-1];
//	    		if(jsp.equalsIgnoreCase(page)){//菜单列表中有
//	    			flagall=1;
//	    		}
//	    	}
//	    	//访问页面为菜单列表中页面
//	    	if(flagall==1){
//	    		//2.查看权限列表中是否有
//	    		//权限查询
//		    	int flag=0;
//		    	ArrayList al=(ArrayList)session.getAttribute("menu");
//		    	Iterator it=al.iterator();
//		    	while(it.hasNext()){
//		    		Menu m=(Menu)it.next();
//		    		String lurl=m.getLocation();
//		    		String jsps[]=lurl.split("/");
//		    		String jsp=jsps[jsps.length-1];
//		    		if(jsp.equalsIgnoreCase(page)){//访问的页面在权限表中有
//		    			flag=1;
//		    		}
//		    	}
//		    	if(flag==1){//有权限
		    		chain.doFilter(request, response);  
//		    	}else{//没有权限
//		    		response.sendRedirect("quit.jsp"); 
//		    	}
//	    	}else{//不是列表中页面直接访问
//	    		chain.doFilter(request, response);  
//	    	}
	    } else { //未登录
	    	//如果路径包含打印放行
	    	
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
