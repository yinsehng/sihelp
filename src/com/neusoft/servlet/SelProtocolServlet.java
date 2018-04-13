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

import com.neusoft.bean.Jinfo;
import com.neusoft.bean.Kb01;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

public class SelProtocolServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public SelProtocolServlet() {
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
		String WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		Kb01 kb01 = new Kb01();
		Protocol protocol = new Protocol();
		Jinfo jinfo = new Jinfo();
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select *from PROTOCOL where akb020 = '"+u.getName()+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
			
			if(rs.next()){
				//说明存在
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
				protocol.setWQ_JNAME(rs.getString("WQ_JNAME"));
				request.setAttribute("protocol", protocol);
				request.setAttribute("flag", "1");
			} else {
				rs=st.executeQuery("select *from KB01 where akb020 = '"+u.getName()+"'");
				if(rs.next()){
					kb01.setAkb020(rs.getString("AKB020"));
					kb01.setAkb021(rs.getString("AKB021"));
					kb01.setAkb025(rs.getString("AKB025"));
					kb01.setAae004(rs.getString("AAE004"));
					kb01.setAae005(rs.getString("AAE005"));
					kb01.setAae006(rs.getString("AAE006"));
					kb01.setCkb162(rs.getString("CKB162"));
					kb01.setProtocols(rs.getString("Protocol"));
				}
				if (kb01.getAkb020() != null) {
					request.setAttribute("kb01", kb01);
					request.setAttribute("flag", "0");
				} else {
					//未查询出来协议，请联系管理员进行网签协议的维护
				}
			}
			String selSql = "select *from JINFO where TYPE = '"+u.getUflag()+"'";
			rs=st.executeQuery(selSql);
			if(rs.next()){
				jinfo.setNAME(rs.getString("NAME"));
				jinfo.setCORPORATION(rs.getString("CORPORATION"));
				jinfo.setADDRESS(rs.getString("ADDRESS"));
				jinfo.setPOSTALCODE(rs.getString("POSTALCODE"));
				jinfo.setTEL(rs.getString("TEL"));
			}
			request.setAttribute("jinfo", jinfo);
			//此处判断是医院还是药店
			if ("1".equals(u.getUflag())) {
				//为医院
				request.getRequestDispatcher("../protocol.jsp").forward(request, response);
			} else if ("2".equals(u.getUflag())) {
				//为药店
				request.getRequestDispatcher("../ydprotocol.jsp").forward(request, response);
			}
			
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
