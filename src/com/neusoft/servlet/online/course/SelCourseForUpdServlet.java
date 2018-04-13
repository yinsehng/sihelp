package com.neusoft.servlet.online.course;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.bean.Course;
import com.neusoft.bean.Operator;
import com.neusoft.jdbc.ConnectionManager;


public class SelCourseForUpdServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelCourseForUpdServlet() {
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
			String sql="select * from course where id='"+pid+"' ";
				
			rs=st.executeQuery(sql);
			rs.next();
			Course op=new Course();
			op.setId(rs.getString("id"));
			op.setCname(rs.getString("cname"));
			op.setBegindate(rs.getString("begindate"));
			op.setAddress(rs.getString("address"));
			op.setExp(rs.getString("exp"));
			op.setNum_a(rs.getString("num_a"));
			op.setNum_b(rs.getString("num_b"));
			op.setType(rs.getString("type"));
			op.setAae036(rs.getDate("aae036"));
			op.setKb01type(rs.getString("kb01type"));
			op.setAae100(rs.getString("aae100"));
			request.setAttribute("course", op);
			
			String sqlck="select akb020 from COUR_KB01 where cid='"+pid+"'";
			rs=st.executeQuery(sqlck);
			String akb020s="";
			while (rs.next()) {
				akb020s=akb020s+rs.getString("akb020")+",";
			}
			request.setAttribute("kb01type", akb020s);
			if(type!=null && type.equals("user")){
				request.getRequestDispatcher("/online/course/course_info.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("/online/course/course.jsp").forward(request, response);
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
