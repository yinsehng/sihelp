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
import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

public class SubmitProtocolServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public SubmitProtocolServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Util util = new Util();
		request.setCharacterEncoding("UTF-8");
		//获取各种参数
		String WQ_AKB021 = request.getParameter("WQ_AKB021").trim();
		WQ_AKB021 = new String(WQ_AKB021.getBytes("iso8859-1"), "utf-8");
		String WQ_NAME = request.getParameter("WQ_NAME").trim();
		WQ_NAME = new String(WQ_NAME.getBytes("iso8859-1"), "utf-8");
		String WQ_ADDRESS = request.getParameter("WQ_ADDRESS").trim();
		WQ_ADDRESS = new String(WQ_ADDRESS.getBytes("iso8859-1"), "utf-8");
		String WQ_POSTALCODE = request.getParameter("WQ_POSTALCODE").trim();
		WQ_POSTALCODE = new String(WQ_POSTALCODE.getBytes("iso8859-1"), "utf-8");
		String WQ_TEL = request.getParameter("WQ_TEL").trim();
		WQ_TEL = new String(WQ_TEL.getBytes("iso8859-1"), "utf-8");
		String TYPE = request.getParameter("TYPE");
		String WQ_OPTIONS = request.getParameter("WQ_OPTIONS").trim();
		WQ_OPTIONS = new String(WQ_OPTIONS.getBytes("iso8859-1"), "utf-8");
		String WQ_IP = util.getIpAddr(request);
		String WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
		String WQ_TIME = TimeUtil.getCurrentDate("yyyy-MM-dd HH:mm:ss");
		WQ_OPTIONS = WQ_OPTIONS.substring(1, WQ_OPTIONS.lastIndexOf(","));
		String WQ_JDATE = TimeUtil.getCurrentDate("yyyy-MM-dd");
		WQ_JDATE = WQ_JDATE.substring(0, 4) + "年" + WQ_JDATE.substring(5, 7) + "月" + WQ_JDATE.substring(8, 10) + "日";
		//后台可以加入判断为空，提示到前端，比如这样 后期可以加入
		/*if ("王晓彩".equals(WQ_NAME)) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = response.getWriter();
	        writer.write("法人代表：王晓彩，不正确");
	        writer.flush();
	        writer.close();
	        return;
		}*/
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		Jinfo jinfo = new Jinfo();
		//获取当前登录的用户，通过用户生成对应的网签协议书
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		ResultSet prs=null;
		try {
			//首先检查该家医院今年有没有签署了有效的协议，如果有了，则提醒已经签署<这个可以不用>
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select *from PROTOCOL where akb020 = '"+u.getName()+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
			
			if(rs.next()){
				//说明存在
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("repeat");
		        writer.flush();
		        writer.close();
		        return;
			}
			
			prs = st.executeQuery("select *from JINFO where TYPE ='"+u.getUflag()+"'");
			if (prs.next()) {
				jinfo.setNAME(prs.getString("NAME"));
				jinfo.setCORPORATION(prs.getString("CORPORATION"));
				jinfo.setADDRESS(prs.getString("ADDRESS"));
				jinfo.setPOSTALCODE(prs.getString("POSTALCODE"));
				jinfo.setTEL(prs.getString("TEL"));
			}
			//可以保存了，首先根据查询
			String insertSql = "insert into PROTOCOL values('"+u.getName()+"','"+u.getAkb021()+"','"+WQ_AKB021+"','"+WQ_NAME+"','"+WQ_ADDRESS+"','"+WQ_POSTALCODE+"',"
					+ "'"+WQ_TEL+"','"+WQ_IP+"','"+WQ_YEAR+"','"+WQ_TIME+"','"+TYPE+"','1','"+WQ_OPTIONS+"','"+WQ_JDATE+"','"+WQ_JDATE+"',"
							+ "'"+jinfo.getNAME()+"','"+jinfo.getCORPORATION()+"','"+jinfo.getADDRESS()+"','"+jinfo.getPOSTALCODE()+"','"+jinfo.getTEL()+"')";
			
			int result = st.executeUpdate(insertSql);
			con.commit();
			//没有出现异常，跳转到查看页面，其实也是protocol.jsp页面
			if (result > 0) {
				//表示保存成功
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("ok");
		        writer.flush();
		        writer.close();
			}
		} catch (Exception e) {
			
			try {
				con.rollback();
				//表示保存失败
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("error");
		        writer.flush();
		        writer.close();
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
