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

import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;

public class CheckPersonServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public CheckPersonServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		//��ȡҽԺ���������
		String AKB020 = u.getName();
		String YEAR = TimeUtil.getYear();
		//��ȡ��ǰ��¼���û���ͨ���û����ɶ�Ӧ����ǩЭ����
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String sql = "select count(1) NUM from protocoluser where akb020 = '"+AKB020+"' and AAE314 = 1 and YEAR = '"+YEAR+"'";
			rs = st.executeQuery(sql);
			//test����һ��
			if(rs.next()){
				//����ɹ�
				int num = rs.getInt("NUM");
				if (num > 0) {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter writer = response.getWriter();
			        writer.write("1");
			        writer.flush();
			        writer.close();
				} else {
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter writer = response.getWriter();
			        writer.write("0");
			        writer.flush();
			        writer.close();
				}
				
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
