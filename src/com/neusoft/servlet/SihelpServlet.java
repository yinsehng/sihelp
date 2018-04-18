package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.util.Escape;
import com.neusoft.util.ExecSiAction;

public class SihelpServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SihelpServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
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

	public void init() throws ServletException {
	}

}
