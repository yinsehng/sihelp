package com.neusoft.servlet.online;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;


public class AddOperatorServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddOperatorServlet() {
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
		
		String oname=request.getParameter("oname");
		String sex=request.getParameter("sex");
		String age=request.getParameter("age");
		String tel=request.getParameter("tel");
		String xl=request.getParameter("xl");
		String yq=request.getParameter("yq");
		String id=request.getParameter("id");
		String cid=request.getParameter("cid");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		//数据连接 
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			
			String sql;
			if(id!=null && !id.equals("")){
				sql="update operator set name='"+oname+"',sex='"+sex+"',age='"+age+"',tel='"+tel+"',xl='"+xl+"',mudi='"+yq+"',aae036=sysdate where id='"+id+"'";
				st.executeUpdate(sql);
			}else{
				sql="insert into operator(name,sex,age,tel,xl,mudi,aae036,flag,akb020,id,cid) values('"+oname+"','"+sex+"','"+age+"','"+tel+"','"+xl+"','"+yq+"',sysdate,'1','"+u.getName()+"',SEQ_OPER.Nextval,'"+cid+"')";
				st.executeUpdate(sql);
				st.executeUpdate("update course set num_b=num_b+1 where id='"+cid+"'");
			}
			
			con.commit();
			
//			if(id!=null){
//				request.getRequestDispatcher("../SelProType.do").forward(request, response);
//			}else{
				request.getRequestDispatcher("/oper/SelOperator.do").forward(request, response);
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
