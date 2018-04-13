package com.neusoft.servlet.online.course;

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


public class AddCourseServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddCourseServlet() {
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
		
		String cname=request.getParameter("cname");
		String type=request.getParameter("type");
		String begindate=request.getParameter("begindate");
		String num_a=request.getParameter("num_a");
		String address=request.getParameter("address");
		String exp=request.getParameter("exp");
		String kb01type=request.getParameter("kb01type");
		String id=request.getParameter("id");
		String aae100=request.getParameter("aae100");
		
		String kb01="1";
		if(!kb01type.equals("")){
			kb01="0";
		}
		
		
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
				sql="update course set cname='"+cname+"',begindate='"+begindate+"',num_a='"+num_a+"',type='"+type+"',address='"+address+"',exp='"+exp+"',kb01type='"+kb01+"',aae100='"+aae100+"', aae036=sysdate where id='"+id+"'";
				st.executeUpdate(sql);
				//先删除所有该id下的dingdian
				String del="delete from COUR_KB01 where cid='"+id+"'";
				st.executeUpdate(del);
				
				if(kb01.equals("0")){
					
					String akb020s[]=kb01type.split("\\,");
					for(String akb020:akb020s){
						String s="select akb021 from f_user where name='"+akb020+"'";
						rs=st.executeQuery(s);
						rs.next();
						String sqlck="insert into COUR_KB01(id,cid,akb020,akb021) values(SEQ_COUR_KB01.Nextval,'"+id+"','"+akb020+"','"+rs.getString("akb021")+"')";
						st.executeUpdate(sqlck);
					}
				}
			}else{
				String seqsql="select SEQ_COUR.Nextval cid from dual";
				rs=st.executeQuery(seqsql);
				rs.next();
				String cid=rs.getString("cid");
				
				sql="insert into course(id,cname,begindate,num_a,type,address,aae036,exp,kb01type,num_b,aae100) values('"+cid+"','"+cname+"','"+begindate+"','"+num_a+"','"+type+"','"+address+"',sysdate,'"+exp+"','"+kb01+"','0','"+aae100+"')";
				st.executeUpdate(sql);
				
				
				if(kb01.equals("0")){
					String akb020s[]=kb01type.split("\\,");
					for(String akb020:akb020s){
						String s="select akb021 from f_user where name='"+akb020+"'";
						rs=st.executeQuery(s);
						rs.next();
						String sqlck="insert into COUR_KB01(id,cid,akb020,akb021) values(SEQ_COUR_KB01.Nextval,'"+cid+"','"+akb020+"','"+rs.getString("akb021")+"')";
						st.executeUpdate(sqlck);
					}
				}
				
			}
			
			
			
			con.commit();
			
//			if(id!=null){
//				request.getRequestDispatcher("../SelProType.do").forward(request, response);
//			}else{
				request.getRequestDispatcher("/course/SelCourse.do").forward(request, response);
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
