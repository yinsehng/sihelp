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

public class CopyOfUserManagerServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public CopyOfUserManagerServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	

	@SuppressWarnings("resource")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String akb020 = request.getParameter("akb020");
		String akb021 = request.getParameter("akb021");
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		String type = request.getParameter("type");
		String sql_ = "";
		String A_sql = "";
		String action = "right";
		if ("".equals(WQ_YEAR)||WQ_YEAR==null) {
			WQ_YEAR = TimeUtil.getYear();
		}
		if (!"".equals(akb020)&&akb020!=null) {
			sql_ += " and NAME = '"+akb020+"'";
		}
        if (!"".equals(akb021)&&akb021!=null) {
        	akb021 = new String(akb021.getBytes("iso8859-1"), "utf-8");
        	sql_ += " and AKB021 like '%"+akb021+"%'";
		}
        if ("1".equals(type)) {
        	A_sql += " and WQ_VALID = 1";
        	action = "left";
        }
        
        A_sql += " and WQ_YEAR = '"+WQ_YEAR+"'";
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
			String sqlc= "";
			String sql="";
			if ("2".equals(type)) {
				sqlc="select count(*) as count from F_USER B where 1=1 and name not in (select akb020 from protocol where WQ_VALID = 1 and WQ_YEAR = '"+WQ_YEAR+"')" +sql_;
	        } else {
	        	sqlc="select count(*) as count from F_USER B where 1=1 " +sql_;
	        }
			
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数
            if ("2".equals(type)) {
                sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE, '0' WQ_VALID from F_USER B where  name not in (select akb020 from protocol where WQ_VALID = 1 and WQ_YEAR = '"+WQ_YEAR+"')  ";
	        	
	        	sql=sql+") A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
	        } else {
	        	
	        	sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE,A.WQ_VALID  from (select *from protocol where 1=1 "+A_sql+") A "+action+" join (select *from f_user where 1=1 "+sql_+") B on B.name = A.akb020 and A.WQ_VALID = 1 and A.WQ_YEAR = '"+WQ_YEAR+"' ";
	        	
	        	sql=sql+") A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
	        }
			
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
				user.setWq_valid(rs.getString("WQ_VALID"));
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
