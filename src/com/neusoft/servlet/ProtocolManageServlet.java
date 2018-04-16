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

import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Page;


public class ProtocolManageServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ProtocolManageServlet() {
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
		String type = (String)request.getParameter("type");
		String WQ_YEAR = (String)request.getParameter("WQ_YEAR");
		String sql_ = "";
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		if (!"".equals(type)&& type != null) {
			sql_+=" and type = '"+type+"'";
		}
		if (!"".equals(WQ_YEAR)&&WQ_YEAR!=null) {
			sql_+=" and WQ_YEAR = '"+WQ_YEAR+"'";
		}
		//数据连接mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String dqys=request.getParameter("page");
		Page<Protocol> page=new Page<Protocol>();
		ArrayList<Protocol> list = new ArrayList<Protocol>();
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
			String sqlc="select count(*) as count from PROTOCOL where 1=1 and WQ_VALID = 1 " + sql_;
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数

			String sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT * FROM PROTOCOL WHERE 1=1 and WQ_VALID = 1";
			if (!"0".equals(type) && type != null) {
				sql = sql + " and TYPE = '"+type+"'";
			}
			
			if (!"".equals(WQ_YEAR) && WQ_YEAR != null) {
				sql = sql + " and WQ_YEAR = '"+WQ_YEAR+"'";
			}
			sql=sql+" order by WQ_TIME desc) A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
			
				
			rs = st.executeQuery(sql);
			while(rs.next()){
				Protocol protocol=new Protocol();
				protocol.setAKB020(rs.getString("AKB020"));
				protocol.setAKB021(rs.getString("AKB021"));
				protocol.setWQ_AKB021(rs.getString("WQ_AKB021"));
				protocol.setWQ_NAME(rs.getString("WQ_NAME"));
				protocol.setWQ_ADDRESS(rs.getString("WQ_ADDRESS"));
				protocol.setWQ_POSTALCODE(rs.getString("WQ_POSTALCODE"));
				protocol.setWQ_TEL(rs.getString("WQ_TEL"));
				protocol.setWQ_IP(rs.getString("WQ_IP"));
				protocol.setWQ_YEAR(rs.getString("WQ_YEAR"));
				protocol.setWQ_TIME(rs.getString("WQ_TIME"));
				protocol.setTYPE(rs.getString("TYPE"));
				protocol.setWQ_VALID(rs.getString("WQ_VALID"));
				protocol.setWQ_OPTIONS(rs.getString("WQ_OPTIONS"));
				protocol.setWQ_JDATE(rs.getString("WQ_JDATE"));
				protocol.setWQ_YDATE(rs.getString("WQ_YDATE"));
				list.add(protocol);
			}
			page.setList(list);
			
			request.setAttribute("page", page);
			request.getRequestDispatcher("../protocolsmanage.jsp").forward(request, response);
			
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
