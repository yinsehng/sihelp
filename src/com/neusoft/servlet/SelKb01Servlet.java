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

import com.neusoft.bean.Kb01;
import com.neusoft.bean.Page;
import com.neusoft.jdbc.ConnectionManager;

public class SelKb01Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public SelKb01Servlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@SuppressWarnings("resource")
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//��ȡǰ̨����
		String akb020=request.getParameter("akb020");
		String akb021=request.getParameter("akb021");
		request.setAttribute("akb020", akb020);
		request.setAttribute("akb021", akb021);
		
		String pa=request.getParameter("page");
		if(pa==null){
			System.out.println("kongle...");
			pa="1";
		}
		
		//��ҳ
		Page<Kb01> page=new Page<Kb01>();
		page.setCurrent(Integer.parseInt(pa));
		
		//��������
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		try {
			con=cm.getConnection();
			st=con.createStatement();
			
			int ii=(page.getPer()*page.getCurrent()-page.getPer())+1;//��ҳ��ʼ��¼
			int iii=page.getPer()*page.getCurrent();//��ҳ������¼
			
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
			ArrayList<Kb01> al=new ArrayList<Kb01>();
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
			int count=rs.getInt("count");//����
			page.setCount(count);//������ҳ��
			
			
			request.setAttribute("kb01", al);
			request.setAttribute("count", page.getCount()+"");
			request.setAttribute("current", page.getCurrent()+"");
			request.setAttribute("per", page.getPer()+"");
			request.getRequestDispatcher("../admin/exec.jsp").forward(request, response);
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			cm.close(con, st, rs);
		}
	
		
		
	}
	
	public void init() throws ServletException {
	}

}
