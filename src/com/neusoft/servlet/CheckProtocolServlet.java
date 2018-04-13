package com.neusoft.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.neusoft.util.DocUtil;
import com.neusoft.util.TimeUtil;
import com.neusoft.util.Util;

import eu.bitwalker.useragentutils.UserAgent;

public class CheckProtocolServlet extends HttpServlet {
	/**
	 * Constructor of the object.
	 */
	public CheckProtocolServlet() {
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
		String admin = request.getParameter("ADMIN");
		String AKB020 = request.getParameter("AKB020");
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		if (!"1".equals(admin)) {
			//为用户打印
			WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
			AKB020 = u.getName();
		}
		String ie = "true";
		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		String browserName = userAgent.getBrowser().getName();
		if (!browserName.contains("Internet Explorer")) {
			ie = "false";
		}
		
		String path = getServletContext().getRealPath("/"); 
		
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
			rs=st.executeQuery("select *from PROTOCOL where akb020 = '"+AKB020+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
			
			if(rs.next()){
				//说明存在，跳转自定义打印页面，并利用fremarker生成模板页面
				//利用模板生成html页面，将URL传到前台进行打印
				//查询协议信息
				Map<String, Object> dataMap=new HashMap<String, Object>();
				List<String> list = new ArrayList<String>();
				List<String> listOp = new ArrayList<String>();
		        Protocol protocol = new Protocol();
				//查找协议项进行填充
				prs = st.executeQuery("select *from PROTOCOL where akb020 = '"+AKB020+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
				if (prs.next()) {
					protocol.setAKB020(prs.getString("AKB020"));
					protocol.setAKB021(prs.getString("AKB021"));
					protocol.setWQ_AKB021(prs.getString("WQ_AKB021"));
					protocol.setWQ_NAME(prs.getString("WQ_NAME"));
					protocol.setWQ_ADDRESS(prs.getString("WQ_ADDRESS"));
					protocol.setWQ_POSTALCODE(prs.getString("WQ_POSTALCODE"));
					protocol.setWQ_TEL(prs.getString("WQ_TEL"));
					protocol.setWQ_IP(prs.getString("WQ_IP"));
					protocol.setWQ_YEAR(prs.getString("WQ_YEAR"));
					protocol.setWQ_TIME(prs.getString("WQ_TIME"));
					protocol.setTYPE(prs.getString("TYPE"));
					protocol.setWQ_VALID(prs.getString("WQ_VALID"));
					protocol.setWQ_OPTIONS(prs.getString("WQ_OPTIONS"));
					protocol.setWQ_JDATE(prs.getString("WQ_JDATE"));
					protocol.setWQ_YDATE(prs.getString("WQ_YDATE"));
					protocol.setWQ_JTEL(prs.getString("WQ_JTEL"));
					protocol.setWQ_JNAME(prs.getString("WQ_JNAME"));
					protocol.setWQ_JINSTITUTION(prs.getString("WQ_JINSTITUTION"));
					protocol.setWQ_JADDRESS(prs.getString("WQ_JADDRESS"));
					protocol.setWQ_JPOSTALCODE(prs.getString("WQ_JPOSTALCODE"));
					dataMap.put("protocol", protocol);
					//甲方的电话为多个
					String jtel = protocol.getWQ_JTEL();
					String[] tels = jtel.split(",");
					
					dataMap.put("jtel", tels);
					//协议项
					String option = protocol.getWQ_OPTIONS();
					String[] options = option.split(",");
					
					dataMap.put("options", options);
					dataMap.put("ie", ie);
					DocUtil docUtil=new DocUtil();
					String des = path+"protocol/heb_"+WQ_YEAR+"/"+protocol.getAKB020();
					
					File file = new File(des);
					if (!file.exists()) {
						file.mkdirs();
					}
					docUtil.createDoc(dataMap, "protocol_"+protocol.getTYPE(), des+"/"+protocol.getAKB020()+".html");
					String url = "protocol/heb_"+WQ_YEAR+"/"+protocol.getAKB020()+"/"+protocol.getAKB020()+".html";
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter writer = response.getWriter();
			        writer.write(url);
			        writer.flush();
			        writer.close();
			        return;
				}
			} else {
				//说明不存在
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("repeat");
		        writer.flush();
		        writer.close();
		        return;
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
			try {
				if(rs!=null)
					rs.close();
				if(prs != null)
					prs.close();
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
