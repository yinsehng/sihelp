package com.neusoft.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;

public class ProtocolCountServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public ProtocolCountServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@SuppressWarnings("resource")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String WQ_YEAR = (String)request.getParameter("WQ_YEAR");
		if (WQ_YEAR == null || "".equals(WQ_YEAR)) {
			WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
		}
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		StringBuilder xAxis = new StringBuilder();
		StringBuilder series = new StringBuilder();
		int VALIDNUM = 0;
		int TOTALNUM = 0;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select count(*) VALIDNUM from PROTOCOL where WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
			
			if(rs.next()){
				VALIDNUM = rs.getInt("VALIDNUM");
				request.setAttribute("VALIDNUM", VALIDNUM);
			}
			rs = st.executeQuery("select count(*) TOTALNUM from F_USER where TYPE is null");
			if(rs.next()){
				TOTALNUM = rs.getInt("TOTALNUM");
				request.setAttribute("TOTALNUM", TOTALNUM);
			}
			
			rs = st.executeQuery("select count(*) NUM,WQ_DATE from (select A.*,substr(wq_time,0,10 ) wq_date from protocol A where A.wq_valid = 1 and A.wq_year = '"+WQ_YEAR+"') group by wq_date order by wq_date");
			while(rs.next()){
				
				series.append(rs.getInt("NUM")).append(",");
				xAxis.append("\"").append(rs.getString("WQ_DATE")).append("\"").append(",");
			}
			if (series != null&&series.length()>0) {
				series.deleteCharAt(series.lastIndexOf(","));
			}
			if (xAxis != null&&series.length()>0) {
				xAxis.deleteCharAt(xAxis.lastIndexOf(","));
			}
			request.setAttribute("series", series.toString());
			request.setAttribute("xAxis", xAxis.toString());
			request.setAttribute("WQ_YEAR", WQ_YEAR);
			request.getRequestDispatcher("../protocolcount.jsp").forward(request, response);
			
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
