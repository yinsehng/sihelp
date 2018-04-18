package com.neusoft.servlet;

import java.io.IOException;
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
import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;

public class JInfoMangerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public JInfoMangerServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		ArrayList<Jinfo> list = new ArrayList<Jinfo>();
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select *from JINFO");
			
			while(rs.next()){
				Jinfo jinfo = new Jinfo();
				jinfo.setNAME(rs.getString("NAME"));
				jinfo.setCORPORATION(rs.getString("CORPORATION"));
				jinfo.setADDRESS(rs.getString("ADDRESS"));
				jinfo.setPOSTALCODE(rs.getString("POSTALCODE"));
				jinfo.setTYPE(rs.getString("TYPE"));
				jinfo.setTEL(rs.getString("TEL"));
				list.add(jinfo);
			}
			request.setAttribute("list", list);
			request.getRequestDispatcher("../jinfo.jsp").forward(request, response);
			
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
			cm.close(con, st, rs);
		}
	}
	 
	public void init() throws ServletException {
	}
}
