package com.neusoft.servlet.online;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.bean.Operator;
import com.neusoft.jdbc.ConnectionManager;


public class SelOperForUpdServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelOperForUpdServlet() {
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
		String pid=request.getParameter("pid");
		String type=request.getParameter("type");
		
		//数据连接 
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String sql="select * from operator where id='"+pid+"' ";
				
			rs=st.executeQuery(sql);
			rs.next();
			Operator op =new Operator();
			op.setId(rs.getString("id"));
			op.setName(rs.getString("name"));
			op.setSex(rs.getString("sex"));
			op.setTel(rs.getString("tel"));
			op.setAge(rs.getString("age"));
			op.setXl(rs.getString("xl"));
			op.setMudi(rs.getString("mudi"));
			request.setAttribute("operator", op);
			if(type!=null && type.equals("admin")){
				request.getRequestDispatcher("/online/peixun_info.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/online/peixun.jsp").forward(request, response);
			}
			
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
