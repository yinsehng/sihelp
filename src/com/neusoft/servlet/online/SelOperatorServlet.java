package com.neusoft.servlet.online;

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

import com.neusoft.bean.Course;
import com.neusoft.bean.Operator;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.Page;


public class SelOperatorServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelOperatorServlet() {
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
		request.setCharacterEncoding("UTF-8");
		String flag=request.getParameter("flag");
		String oname=request.getParameter("oname");
		String cid=request.getParameter("cid");
		
		//获取session
		HttpSession session=request.getSession();
		//登录用户
		User u=(User)session.getAttribute("user");
		
		//数据连接mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String dqys=request.getParameter("page");
		Page<Operator> page=new Page<Operator>();
	
		  //分页
	    int dqy;
	    if(dqys!=null){
	    	dqy=Integer.parseInt(dqys);//当前页
	    }else{
	    	dqy=1;
	    }
		page.setCurrent(dqy);//当前页
		
		int mys=page.getPer();//每页记录数
		int zys;//总页数
		     
		
		try {
			String sqlc="select count(*) as count from operator where akb020='"+u.getName()+"' and cid='"+cid+"' ";
			if(flag!=null && !flag.equals("0")){
				sqlc=sqlc+" and flag='"+flag+"' ";
			} 
			if(oname!=null && !oname.equals("")){
				sqlc=sqlc+" and name like '%"+oname+"%' ";
			}
//			else{
//				sqlc="select count(*) as count from product";
//			}
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//计算总页数

			String sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT * FROM operator WHERE akb020='"+u.getName()+"' and cid='"+cid+"' ";
			
			if(flag!=null && !flag.equals("0")){
				sql=sql+" and flag='"+flag+"' ";
			}
			if(oname!=null && !oname.equals("")){
				sql=sql+" and name like '%"+oname+"%' ";
			}
			sql=sql+"  order by aae036 desc ) A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
			
				
			rs=st.executeQuery(sql);
			ArrayList<Operator> al=new ArrayList<Operator>();
			while(rs.next()){
				Operator op=new Operator();
				op.setId(rs.getString("id"));
				op.setName(rs.getString("name"));
				op.setAge(rs.getString("age"));
				op.setSex(rs.getString("sex"));
				op.setTel(rs.getString("tel"));
				op.setMudi(rs.getString("mudi"));
				op.setAae036(rs.getDate("aae036"));
				op.setPxrq(rs.getDate("pxrq"));
				op.setAkb020(rs.getString("akb020"));
				op.setFlag(rs.getString("flag"));
				op.setXl(rs.getString("xl"));
				op.setQxyy(rs.getString("qxyy"));
				al.add(op);
			}
			page.setList(al);
			
			request.setAttribute("page", page);
			
			rs=st.executeQuery("select * from course where id='"+cid+"'");
			rs.next();
			Course op=new Course();
			op.setId(rs.getString("id"));
			op.setCname(rs.getString("cname"));
			op.setBegindate(rs.getString("begindate"));
			op.setAddress(rs.getString("address"));
			op.setExp(rs.getString("exp"));
			op.setNum_a(rs.getString("num_a"));
			op.setNum_b(rs.getString("num_b"));
			op.setType(rs.getString("type"));
			op.setAae036(rs.getDate("aae036"));
			op.setKb01type(rs.getString("kb01type"));
			request.setAttribute("course", op);
//			if(id!=null){
//				request.getRequestDispatcher("/vocadmin/product/edit_protype.jsp").forward(request, response);
//			}else{
				request.getRequestDispatcher("/online/peixun_list.jsp").forward(request, response);
//			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				con.rollback();
			} catch (SQLException e1) {
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
