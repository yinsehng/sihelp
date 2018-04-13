package com.neusoft.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Message;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;

public class LogonServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LogonServlet() {
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
		//����ǰ̨����
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		String img=request.getParameter("img");
		
		if(name==null || password==null || img==null){
			Message me=new Message();
			me.setMessage("��Ϣ¼�����");
			request.setAttribute("mes", me);
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		
		//��ȡsession
		HttpSession session=request.getSession();
		//�ж���֤��
		String rand=(String)session.getAttribute("rand");
		if(!img.equals("ToKenType")){
			if(!img.equalsIgnoreCase(rand)){
				Message me=new Message();
				me.setMessage("��֤�����");
				request.setAttribute("mes", me);
				request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
				return;
			}
		}
		
		//��������
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select * from f_user where name='"+name+"'");
			if(rs.next()){
				User u=new User();
				u.setName(rs.getString("name"));
				u.setIp(rs.getString("ip"));
				u.setPassword(rs.getString("password"));
				u.setTimes(rs.getInt("times"));
				Timestamp timeStamp = rs.getTimestamp("enddate");
				String endDateStr = null;
				if (timeStamp != null && timeStamp.toString().contains(".0")) {
					endDateStr = timeStamp.toString().substring(0, (timeStamp.toString().length()) - 2);
					u.setEnddate(TimeUtil.convertStringToDate(endDateStr, "yyyy-MM-dd HH:mm:ss"));
				}
				u.setAkb021(rs.getString("akb021"));
				u.setType(rs.getInt("type"));
				u.setUflag(rs.getString("uflag"));
				if(!u.getPassword().equals(password)){//�������
					Message me=new Message();
					me.setMessage("�������");
					request.setAttribute("mes", me);
					request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
					return;
				}else{//������ȷ��¼�ɹ�
					//��¼��¼ʱ�䣬ip �޸ĵ�¼����
					String sql="update f_user set ip='"+request.getRemoteAddr()+"', times=nvl(times,0)+1, enddate=sysdate where name='"+name+"'";
					System.out.println(sql);
					st.execute(sql);//ִ��
					//��¼��¼��־
					String isql="insert into f_user_log(id,name,ip,time) values(SEQ_F_USERLOG.NEXTVAL,'"+u.getName()+"','"+request.getRemoteAddr()+"',sysdate)";
					System.out.println(isql);
					st.execute(isql);
					//�ύ����
					con.commit();
					session.setAttribute("user", u);//�洢��¼��־
					request.getRequestDispatcher("../main.jsp").forward(request, response);
//					request.getRequestDispatcher("../index2main.jsp").forward(request, response);
					return;
				}
			}else{//�û�������
				Message me=new Message();
				me.setMessage("�û�������");
				request.setAttribute("mes", me);
				request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
				return;
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}finally{
			try {
				if(rs!=null)
					rs.close();
				if(st!=null)
					st.close();
				if(con!=null)
					con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
//		User u=new User();
//		u.setAkb021("8888");
//		u.setName("�����û�");
//		u.setType(1);
//		session.setAttribute("user", u);//�洢��¼��־
		request.getRequestDispatcher("../main.jsp").forward(request, response);
		
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
