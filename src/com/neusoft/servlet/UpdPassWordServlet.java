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
import com.neusoft.jdbc.SiConnManager;

public class UpdPassWordServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdPassWordServlet() {
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
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		//接收前台数据
		String opass=request.getParameter("opassword");
		String npass=request.getParameter("npassword");
		
		
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String sql="select * from f_user where password='"+opass+"'";
			rs=st.executeQuery(sql);
			if(!rs.next()){
				Message mes=new Message();
				mes.setMessage("原密码错误");
				request.setAttribute("mes", mes);
				request.getRequestDispatcher("../upduser.jsp").forward(request, response);
			}else{
				String usql="update f_user set password='"+npass+"' where name='"+u.getName()+"'";
				st.execute(usql);
				con.commit();
				Message mes=new Message();
				mes.setMessage("修改成功");
				request.setAttribute("mes", mes);
				request.getRequestDispatcher("../upduser.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
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
