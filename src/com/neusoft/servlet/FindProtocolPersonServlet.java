package com.neusoft.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.Protocoluser;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.DocUtil;
import com.neusoft.util.TimeUtil;

import eu.bitwalker.useragentutils.UserAgent;

public class FindProtocolPersonServlet extends HttpServlet {

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		       //获取session
				HttpSession session=request.getSession();
				//登录用户
				User u=(User)session.getAttribute("user");
				if (u == null) {
					request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
					return;
				}
				String akb020 = request.getParameter("akb020");
				String year = request.getParameter("year");
				
				
				ConnectionManager cm= ConnectionManager.getInstance();
				Connection con=null;
				Statement st=null;
				ResultSet rs=null;
				ResultSet prs=null;
				try {
					//首先检查该家医院今年有没有签署了有效的协议，如果有了，则提醒已经签署<这个可以不用>
					con=cm.getConnection();
					st=con.createStatement();
					String sql = "select *from protocoluser where akb020 = '"+akb020+"' and year = '"+year+"' and aae314 = 1";
					rs=st.executeQuery(sql);
					
					if(rs.next()){
						
				        Protocoluser protocoluser = new Protocoluser();
				        protocoluser.setAkb020(rs.getString("AKB020"));
						protocoluser.setAkb021(rs.getString("AKB021"));
						protocoluser.setAac002(rs.getString("AAC002"));
						protocoluser.setAac003(rs.getString("AAC003"));
						protocoluser.setAac005(rs.getString("AAC005"));
						protocoluser.setAae036(rs.getString("AAE036"));
					    // 第一种方式
					    String jsonString = JSONObject.toJSONString(protocoluser);
						response.setContentType("text/html;charset=UTF-8");
					    PrintWriter writer = response.getWriter();
					    writer.write(jsonString);
					    writer.flush();
					    writer.close();
					    return;
						
					}
				} catch (Exception e) {
					
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

	
	public void init() throws ServletException {
		// Put your code here
	}

}
