package com.neusoft.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Kb01;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

public class ProtocolCountServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public ProtocolCountServlet() {
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
		String WQ_YEAR = (String)request.getParameter("WQ_YEAR");
		if (WQ_YEAR == null || "".equals(WQ_YEAR)) {
			WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
		}
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		//��ȡ��ǰ��¼���û���ͨ���û����ɶ�Ӧ����ǩЭ����
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
			mes.setMessage("���ݿ����ʧ��");
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
