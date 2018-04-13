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

public class EditProtocolServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public EditProtocolServlet() {
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
		String AKB020 = request.getParameter("AKB020");
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		Protocol protocol = new Protocol();
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select *from PROTOCOL where AKB020 = '"+AKB020+"' and WQ_VALID = 1 and WQ_YEAR = '"+WQ_YEAR+"'");
			
			if(rs.next()){
				protocol.setAKB020(rs.getString("AKB020"));
				protocol.setAKB021(rs.getString("AKB021"));
				protocol.setWQ_AKB021(rs.getString("WQ_AKB021"));
				protocol.setWQ_NAME(rs.getString("WQ_NAME"));
				protocol.setWQ_ADDRESS(rs.getString("WQ_ADDRESS"));
				protocol.setWQ_POSTALCODE(rs.getString("WQ_POSTALCODE"));
				protocol.setWQ_TEL(rs.getString("WQ_TEL"));
				protocol.setWQ_IP(rs.getString("WQ_IP"));
				protocol.setWQ_YEAR(rs.getString("WQ_YEAR"));
				protocol.setWQ_TIME(rs.getString("WQ_TIME"));
				protocol.setTYPE(rs.getString("TYPE"));
				protocol.setWQ_VALID(rs.getString("WQ_VALID"));
				protocol.setWQ_OPTIONS(rs.getString("WQ_OPTIONS"));
				protocol.setWQ_JDATE(rs.getString("WQ_JDATE"));
				protocol.setWQ_YDATE(rs.getString("WQ_YDATE"));
				
			}
			request.setAttribute("protocol", protocol);
			request.getRequestDispatcher("../editprotocol.jsp").forward(request, response);
			
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
