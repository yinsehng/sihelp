package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

import com.neusoft.bean.User;
import com.neusoft.util.ExecAction;
import com.neusoft.util.Util;

public class AdminServlet extends HttpServlet {
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(AdminServlet.class);//日志文件

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		Util util=new Util();
		MDC.put("username", u.getName());//将akb020添加日志文件中
		MDC.put("ip", util.getIpAddr(request));
		
		
		PrintWriter pw=response.getWriter();
		
		
		String al=request.getParameter("al");
		String[] ss=al.split(",");
		MDC.put("actype", ss[0]);//将执行类型添加日志文件中
		
		
		if(ss.length<2){
			pw.print("{\"error\":\"传入的参数错误\",\"success\":\"0\"}");
			pw.flush();
			pw.close();
			return;
		}
		
		ExecAction ea=new ExecAction();
		String xml=ea.getActionReturn("utf-8", ss[1], ss[0]);//执行清除非数据库形式
		if(xml==null || xml.equalsIgnoreCase("")){
			log.error("返回结果为空处理编号为："+ss[1]+" ");
			pw.print("{\"error\":\"返回结果为空\",\"success\":\"0\"}");
			pw.flush();
			pw.close();
			return;
		}
		int a=xml.lastIndexOf("<appCode>")+9;
		int b=xml.lastIndexOf("</appCode>");
		String code=xml.substring(a,b);
		if(!code.equalsIgnoreCase("0")){
			System.out.println(xml);
			log.error("返回结果为非0数值处理编号为："+ss[1]+" ");
			pw.print("{\"error\":\"返回结果为非0数值\",\"success\":\"0\"}");
			pw.flush();
			pw.close();
			return;
		}else{//正常处理添加日志
			log.info("处理成功!处理编号为："+ss[1]+" 返回串为："+xml);
			//成功
			pw.print("{\"error\":\"0\",\"success\":\"处理成功\"}");
			pw.flush();
			pw.close();
		}
		
	}
	 

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
