package com.neusoft.servlet.online.course;

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

import com.neusoft.bean.Course;
import com.neusoft.bean.CourseKb01;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Page;


public class SelCourKb01Servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelCourKb01Servlet() {
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
		String cid=request.getParameter("cid");
		
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		
		//数据连接mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String dqys=request.getParameter("page");
		Page<CourseKb01> page=new Page<CourseKb01>();
	
		  //分页
	    int dqy;
	    if(dqys!=null){
	    	dqy=Integer.parseInt(dqys);//当前页
	    }else{
	    	dqy=1;
	    }
		page.setCurrent(dqy);//当前页
		
		int mys=page.getPer();//每页记录数
		int zys;//总页数
		     
		
		try {
			String sqlc="select count(*) as count from COUR_KB01 where cid='"+cid+"' ";
//			if(cname!=null && !cname.equals("")){
//				sqlc=sqlc+" and cname like '%"+cname+"%' ";
//			} 
//			if(type!=null && !type.equals("0")){
//				sqlc=sqlc+" and type = '"+type+"' ";
//			}
//			else{
//				sqlc="select count(*) as count from product";
//			}
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数

			String sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT * FROM COUR_KB01 WHERE cid='"+cid+"' ";
			
//			if(cname!=null && !cname.equals("")){
//				sql=sql+" and cname like '%"+cname+"%' ";
//			} 
//			if(type!=null && !type.equals("0")){
//				sql=sql+" and type = '"+type+"' ";
//			}
			sql=sql+" ) A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
			
				
			rs=st.executeQuery(sql);
			ArrayList<CourseKb01> al=new ArrayList<CourseKb01>();
			while(rs.next()){
				CourseKb01 op=new CourseKb01();
				op.setId(rs.getString("id"));
				op.setAkb020(rs.getString("akb020"));
				op.setAkb021(rs.getString("akb021"));
				op.setCid(rs.getString("cid"));
				al.add(op);
			}
			page.setList(al);
			
			rs=st.executeQuery("select * from course where id='"+cid+"'");
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
			request.setAttribute("course", op);
			
			request.setAttribute("page", page);
//			if(id!=null){
//				request.getRequestDispatcher("/vocadmin/product/edit_protype.jsp").forward(request, response);
//			}else{
				request.getRequestDispatcher("/online/course/coursekb01.jsp").forward(request, response);
//			}
			
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
