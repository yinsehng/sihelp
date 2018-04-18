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

import com.alibaba.fastjson.JSONObject;
import com.neusoft.bean.Message;
import com.neusoft.bean.Protocoluser;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;


public class FindProtocolPersonServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
	}

	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		       //��ȡsession
				HttpSession session=request.getSession();
				//��¼�û�
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
				try {
					//���ȼ��ü�ҽԺ������û��ǩ������Ч��Э�飬������ˣ��������Ѿ�ǩ��<������Բ���>
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
					    // ��һ�ַ�ʽ
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
					mes.setMessage("���ݿ����ʧ��");
					request.setAttribute("mes", mes);
					request.getRequestDispatcher("../exec/execkc33.jsp").forward(request, response);
				}finally{
					cm.close(con, st, rs);
				}
		
	}

	public void init() throws ServletException {
	}

}
