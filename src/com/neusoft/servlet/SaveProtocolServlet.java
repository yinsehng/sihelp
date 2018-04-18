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

public class SaveProtocolServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;


	public SaveProtocolServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String AKB020 = request.getParameter("AKB020");
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		String WQ_AKB021 = request.getParameter("WQ_AKB021");
		String WQ_NAME = request.getParameter("WQ_NAME");
		String WQ_ADDRESS = request.getParameter("WQ_ADDRESS");
		String WQ_POSTALCODE = request.getParameter("WQ_POSTALCODE");
		String WQ_TEL = request.getParameter("WQ_TEL");
		String WQ_VALID = request.getParameter("WQ_VALID");
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
			int result = st.executeUpdate("update  PROTOCOL set WQ_AKB021='"+WQ_AKB021+"',WQ_NAME ='"+WQ_NAME+"',WQ_ADDRESS = '"+WQ_ADDRESS+"' ,WQ_POSTALCODE='"+WQ_POSTALCODE+"', WQ_TEL = '"+WQ_TEL+"',WQ_VALID = '"+WQ_VALID+"' where AKB020 = '"+AKB020+"' and WQ_VALID = '1' and WQ_YEAR = '"+WQ_YEAR+"'");
			con.commit();
			if(result > 0){
				//����ɹ�
				request.getRequestDispatcher("ProtocolManageServlet").forward(request, response);
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
