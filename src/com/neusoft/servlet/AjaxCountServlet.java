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

import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.ReadPro;

public class AjaxCountServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AjaxCountServlet() {
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
		response.setContentType("text/html;charset=utf-8");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		
		
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select count(*) from f_kc33_log where akb020='"+u.getName()+"' and trunc(upddate,'dd')=trunc(sysdate,'dd')");
			rs.next();
			int kc33count=rs.getInt(1);//当天已经使用清除登录点次数
			
			rs=st.executeQuery("select count(*) from f_localdb_log where akb020='"+u.getName()+"' and trunc(upddate,'dd')=trunc(sysdate,'dd')");
			rs.next();
			int localdbcount=rs.getInt(1);//当天已经使用修改传输时间次数
			
			rs=st.executeQuery("select count(*) from f_ya02_log where akb020='"+u.getName()+"' and trunc(upddate,'dd')=trunc(sysdate,'dd')");
			rs.next();
			int ya02count=rs.getInt(1);//当天已经使用处理对照问题次数
			
			
			//读取配置文件
			ReadPro pro=new ReadPro();
		    String ya02=pro.getValue("ya02count");
		    String localdb=pro.getValue("localdbcount");
		    String kc33=pro.getValue("kc33count");

		    int ya02c=Integer.parseInt(ya02);
		    int localdbc=Integer.parseInt(localdb);
		    int kc33c=Integer.parseInt(kc33);
			
			
			String json="{\"kc33\":\""+kc33count+"\",\"localdb\":\""+localdbcount+"\",\"ya02\":\""+ya02count+"\",\"kc33c\":\""+(kc33c-kc33count)+"\",\"localdbc\":\""+(localdbc-localdbcount)+"\",\"ya02c\":\""+(ya02c-ya02count)+"\" }";
			
			PrintWriter pw=response.getWriter();
			pw.print(json);
			pw.flush();
			pw.close();
			
			
			
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
