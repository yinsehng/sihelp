package com.neusoft.servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.util.Escape;
import com.neusoft.util.ExecSiAction;

public class SihelpServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SihelpServlet() {
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
		//接收前台数据
		String cardinfo=request.getParameter("cardinfo");
		String dllparam=request.getParameter("dllparam");
		String dllparm=request.getParameter("dllparm");
		String inputdata=request.getParameter("inputdata");
//		inputdata=new String(inputdata.getBytes("iso-8859-1"),"utf-8");
		inputdata=Escape.unescape(inputdata);
		ExecSiAction ea =new ExecSiAction();
		String returnval=ea.getActionReturn(inputdata, cardinfo,dllparam,dllparm);
		System.out.println("inservlet-----------"+returnval);
		PrintWriter pw=response.getWriter();
		pw.print(returnval);
		pw.flush();
		pw.close();
		
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
