package com.neusoft.servlet.online;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Escape;


public class UpdQxyyServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdQxyyServlet() {
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
		response.setContentType("text/html");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String id=request.getParameter("id");
		String qxyy=request.getParameter("qxyy");
		qxyy=Escape.unescape(qxyy);
		//数据连接mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			
			String sqldel="update operator set qxyy= '"+qxyy+"' where id='"+id+"'";
			st.executeUpdate(sqldel);
			con.commit();
			
			out.print("ok");
			out.flush();
			out.close();
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
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
