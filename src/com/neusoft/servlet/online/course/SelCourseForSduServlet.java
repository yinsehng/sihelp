package com.neusoft.servlet.online.course;

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


public class SelCourseForSduServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public SelCourseForSduServlet() {
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
//		String id=request.getParameter("id");
		
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		
		//��������mysql
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		
		String dqys=request.getParameter("page");
		Page<Course> page=new Page<Course>();
	
		  //��ҳ
	    int dqy;
	    if(dqys!=null){
	    	dqy=Integer.parseInt(dqys);//��ǰҳ
	    }else{
	    	dqy=1;
	    }
		page.setCurrent(dqy);//��ǰҳ
		
		int mys=page.getPer();//ÿҳ��¼��
		int zys;//��ҳ��
		     
		
		try {
			String sqlc="select count(*) as count from course where (type='"+u.getUflag()+"' and kb01type='1' or id in(SELECT cid FROM COUR_KB01 where akb020='"+u.getName()+"') )and aae100='1' ";
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery(sqlc);
			rs.next();
			page.setCount(rs.getInt("count"));//������ҳ��

			String sql="SELECT *  FROM (SELECT A.*, ROWNUM RN FROM (SELECT * FROM course WHERE (type='"+u.getUflag()+"' and kb01type='1'  or id in(SELECT cid FROM COUR_KB01 where akb020='"+u.getName()+"') )and aae100='1' ";
			
			sql=sql+"  order by aae036 desc ) A WHERE ROWNUM <= "+(((dqy-1)*mys)+mys)+") WHERE RN > "+((dqy-1)*mys);
			
				
			rs=st.executeQuery(sql);
			ArrayList<Course> al=new ArrayList<Course>();
			while(rs.next()){
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
				al.add(op);
			}
			page.setList(al);
			
			request.setAttribute("page", page);
			request.getRequestDispatcher("/online/course/coursekb01_list.jsp").forward(request, response);
			
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
