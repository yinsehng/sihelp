package com.neusoft.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Kb01;
import com.neusoft.bean.Page;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.jdbc.SiConnManager;

public class SelKb01Servlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelKb01Servlet() {
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
		request.setCharacterEncoding("utf-8");
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		
		//获取前台数据
		String akb020=request.getParameter("akb020");
		String akb021=request.getParameter("akb021");
		request.setAttribute("akb020", akb020);
		request.setAttribute("akb021", akb021);
		
		String pa=request.getParameter("page");
		if(pa==null){
			System.out.println("kongle...");
			pa="1";
		}
		
		
		//分页
		Page page=new Page();
		page.setCurrent(Integer.parseInt(pa));
		System.out.println("每页显示数："+page.getPer());
		
		
		
		//连接数据
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			
			int ii=(page.getPer()*page.getCurrent()-page.getPer())+1;//分页开始记录
			int iii=page.getPer()*page.getCurrent();//分页结束记录
			
			String sql="select * from (select a.*,rownum rn from(select akb020,akb021,akb025,aae004,aae005,aae006,ckb162 from kb01 where 1=1 ";
			String countsql="select count(1) count from kb01 where 1=1 ";
			
			if(akb020!=null && akb020.length()>0){
				akb020=akb020.trim();
				sql=sql+" and akb020='"+akb020+"'";
				countsql=countsql+" and akb020='"+akb020+"'";
			}
			if(akb021!=null && akb021.length()>0){
				String akb021_b="";
				akb021=akb021.trim();
				for(int i=0;i<akb021.length();i++){
					akb021_b=akb021_b+"%"+akb021.charAt(i);
				}
				sql=sql+" and akb021 like '"+akb021_b+"%'";
				countsql=countsql+" and akb021 like '"+akb021_b+"%'";
			}
			sql=sql+") a where rownum<='"+iii+"') where rn>='"+ii+"'";
			
			rs=st.executeQuery(sql);
			ArrayList al=new ArrayList();
			while(rs.next()){//akb020,akb021,akb025,aae004,aae005,aae006,ckb162
				Kb01 kb01=new Kb01();
				kb01.setAkb020(rs.getString("akb020"));
				kb01.setAkb021(rs.getString("akb021"));
				kb01.setAkb025(rs.getString("akb025"));
				kb01.setAae004(rs.getString("aae004"));
				kb01.setAae005(rs.getString("aae005"));
				kb01.setAae006(rs.getString("aae006"));
				kb01.setCkb162(rs.getString("ckb162"));
				al.add(kb01);
			}
			
			
			
			rs=st.executeQuery(countsql);
			rs.next();
			int count=rs.getInt("count");//总数
			page.setCount(count);//设置总页数
			
			
			request.setAttribute("kb01", al);
			request.setAttribute("count", page.getCount()+"");
			request.setAttribute("current", page.getCurrent()+"");
			request.setAttribute("per", page.getPer()+"");
			request.getRequestDispatcher("../admin/exec.jsp").forward(request, response);
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
