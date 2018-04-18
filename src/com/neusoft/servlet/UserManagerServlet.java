package com.neusoft.servlet;

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

import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Page;
import com.neusoft.util.TimeUtil;

public class UserManagerServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public UserManagerServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
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
		if ("1".equals(type)) {
        	A_sql += " and WQ_VALID = 1";
        	action = "left";
        }
		if (!"".equals(akb020)&&akb020!=null) {
			sql_ += " and NAME = '"+akb020+"'";
			action = "right";
		}
        if (!"".equals(akb021)&&akb021!=null) {
        	akb021 = new String(akb021.getBytes("iso8859-1"), "utf-8");
        	sql_ += " and AKB021 like '%"+akb021+"%'";
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
	        } else if ("1".equals(type)){
	        	sql_ = sql_.replace("NAME", "AKB020");
	        	sqlc="select count(*) as count from PROTOCOL B where  WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = 1 "+sql_;
	        	sql_ = sql_.replace("AKB020", "NAME");
	        } else {
	        	sqlc="select count(*) as count from F_USER B where  1=1  "+sql_;
	        }
			
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数
            if ("2".equals(type)) {
                sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE, '0' WQ_VALID,'"+WQ_YEAR+"' WQ_YEAR from F_USER B where  name not in (select akb020 from protocol where WQ_VALID = 1 and WQ_YEAR = '"+WQ_YEAR+"') "+sql_+" ";
	        	
	        	sql=sql+" order by WQ_VALID asc) A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
	        } else {
	        	sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE,A.WQ_VALID,A.WQ_YEAR  from (select *from protocol where 1=1 "+A_sql+" order by WQ_VALID desc) A "+action+" join (select *from f_user where 1=1 "+sql_+") B on B.name = A.akb020 and A.WQ_VALID = 1 and A.WQ_YEAR = '"+WQ_YEAR+"' order by WQ_VALID asc";
	        	
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
				user.setWq_year(rs.getString("WQ_YEAR"));
				list.add(user);
			}
            page.setList(list);
			
			request.setAttribute("page", page);
			request.setAttribute("akb020", akb020);
			request.setAttribute("akb021", akb021);
			request.setAttribute("WQ_YEAR", WQ_YEAR);
			request.setAttribute("type", type);
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
			cm.close(con, st, rs);
		}
	}
	
	public void init() throws ServletException {
	}
}
