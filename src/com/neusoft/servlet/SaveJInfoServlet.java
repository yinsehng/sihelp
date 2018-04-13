package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Jinfo;
import com.neusoft.bean.Kb01;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

public class SaveJInfoServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public SaveJInfoServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String NAME = request.getParameter("NAME");
		String TYPE = request.getParameter("TYPE");
		String CORPORATION = request.getParameter("CORPORATION");
		String ADDRESS = request.getParameter("ADDRESS");
		String POSTALCODE = request.getParameter("POSTALCODE");
		String TEL = request.getParameter("TEL");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			int result = st.executeUpdate("update  JINFO set NAME='"+NAME+"',CORPORATION ='"+CORPORATION+"',ADDRESS = '"+ADDRESS+"' ,POSTALCODE='"+POSTALCODE+"', TEL = '"+TEL+"' where TYPE = '"+TYPE+"'");
			con.commit();
			if(result > 0){
				//保存成功
				request.getRequestDispatcher("JInfoMangerServlet").forward(request, response);
			}
			
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			Message mes=new Message();
			mes.setMessage("数据库操作失败");
			request.setAttribute("mes", mes);
			request.getRequestDispatcher("../exec/execkc33.jsp").forward(request, response);
		}finally{
			try {
				if(rs!=null)
					rs.close();
				if(st!=null)
					st.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
