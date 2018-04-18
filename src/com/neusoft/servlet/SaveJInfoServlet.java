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

public class SaveJInfoServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public SaveJInfoServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String NAME = request.getParameter("NAME");
		String TYPE = request.getParameter("TYPE");
		String CORPORATION = request.getParameter("CORPORATION");
		String ADDRESS = request.getParameter("ADDRESS");
		String POSTALCODE = request.getParameter("POSTALCODE");
		String TEL = request.getParameter("TEL");
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
		try {
			con=cm.getConnection();
			st=con.createStatement();
			int result = st.executeUpdate("update  JINFO set NAME='"+NAME+"',CORPORATION ='"+CORPORATION+"',ADDRESS = '"+ADDRESS+"' ,POSTALCODE='"+POSTALCODE+"', TEL = '"+TEL+"' where TYPE = '"+TYPE+"'");
			con.commit();
			if(result > 0){
				//����ɹ�
				request.getRequestDispatcher("JInfoMangerServlet").forward(request, response);
			}
			
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
			cm.close(con, st, rs);
		}
	}
	
	public void init() throws ServletException {
	}
}
