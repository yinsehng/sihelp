package com.neusoft.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;

public class SelKc33Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SelKc33Servlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select count(*) from f_kc33_log where akb020='"+u.getName()+"' and trunc(upddate,'dd')=trunc(sysdate,'dd')");
			rs.next();
			int count=rs.getInt(1);
			request.setAttribute("count", count+"");
			request.getRequestDispatcher("../exec/execkc33.jsp").forward(request, response);
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			Message mes=new Message();
			mes.setMessage("���ݿ����ʧ��");
			request.setAttribute("mes", mes);
			request.getRequestDispatcher("../exec/execkc33.jsp").forward(request, response);
		}finally{
			cm.close(con, st, rs);
		}
	}
	
	public void init() throws ServletException {
	}

}
