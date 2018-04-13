package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
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
import com.neusoft.bean.Kb01;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Page;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

public class UserManagerServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public UserManagerServlet() {
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
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		String dqys=request.getParameter("page");
		Page<User> page=new Page<User>();
		ArrayList<User> list = new ArrayList<User>();
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
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String sqlc="select count(*) as count from F_USER";
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数
			
			String sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT NAME,PASSWORD,AKB021,TIMES,UFLAG,IP,ENDDATE  FROM F_USER ";
			
			sql=sql+") A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
			
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				User user = new User();
				user.setName(rs.getString("NAME"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setAkb021(rs.getString("AKB021"));
				user.setTimes(rs.getInt("TIMES"));
				user.setUflag(rs.getString("UFLAG"));
				user.setIp(rs.getString("IP"));
				user.setEnddate(rs.getDate("ENDDATE"));
				list.add(user);
			}
            page.setList(list);
			
			request.setAttribute("page", page);
			request.getRequestDispatcher("../userManager.jsp").forward(request, response);
			
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
