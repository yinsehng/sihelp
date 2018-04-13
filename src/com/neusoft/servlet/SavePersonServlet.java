package com.neusoft.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.neusoft.util.DocUtil;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

import eu.bitwalker.useragentutils.UserAgent;

public class SavePersonServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public SavePersonServlet() {
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
		String name = request.getParameter("name");
		name = new String(name.getBytes("iso8859-1"), "utf-8");
		String card = request.getParameter("card");
		String tel = request.getParameter("tel");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		//获取医院编码和名称
		String AKB020 = u.getName();
		String AKB021 = u.getAkb021();
		String YEAR = TimeUtil.getYear();
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String saveSql = "insert into protocoluser values('"+AKB020+"','"+AKB021+"','"+name+"','"+card+"','"+tel+"',sysdate,'"+YEAR+"','1')";
			int result = st.executeUpdate(saveSql);
			con.commit();
			if(result > 0){
				//保存成功
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("success");
		        writer.flush();
		        writer.close();
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
