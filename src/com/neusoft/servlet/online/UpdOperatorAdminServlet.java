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

import com.neusoft.jdbc.ConnectionManager;


public class UpdOperatorAdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdOperatorAdminServlet() {
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
		
		String ids=request.getParameter("ids");
		String flag=request.getParameter("flag");
		
		//数据连接mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			
			String[] idsstr=ids.split(",");
			String dids="";
			
			for(String idstr : idsstr){
				if(dids.equals("")){
					dids=dids+"'"+idstr+"'";
				}else{
					dids=dids+",'"+idstr+"'";
				}
			}
			
			
			String sqldel="update operator set flag= '"+flag+"' where id in("+dids+")";
			st.executeUpdate(sqldel);
			con.commit();
			request.getRequestDispatcher("/oper/SelOperatorAdmin.do?page="+request.getParameter("_current")).forward(request, response);
			
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
