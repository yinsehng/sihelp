package com.neusoft.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.neusoft.bean.Message;
import com.neusoft.bean.Protocol;
import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.DocUtil;
import com.neusoft.util.TimeUtil;

import eu.bitwalker.useragentutils.UserAgent;

public class CheckProtocolServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public CheckProtocolServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		String admin = request.getParameter("ADMIN");
		String AKB020 = request.getParameter("AKB020");
		String akbssssqqqqqq444444422222222021 = "aj4444dfjsdfjsd1";
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		if (!"1".equals(admin)) {
			//Ϊ�û���ӡ
			WQ_YEAR = TimeUtil.getCurrentDate("yyyy");
			AKB020 = u.getName();
		}
		String ie = "true";
		UserAgent userAgent = UserAgent.parseUserAgentString(request.getHeader("User-Agent"));
		String browserName = userAgent.getBrowser().getName();
		if (!browserName.contains("Internet Explorer")) {
			ie = "false";
		}
		
		String path = getServletContext().getRealPath("/"); 
		
		//��ȡ��ǰ��¼���û���ͨ���û����ɶ�Ӧ����ǩЭ����
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		ResultSet prs=null;
		try {
			//���ȼ��ü�ҽԺ������û��ǩ������Ч��Э�飬������ˣ��������Ѿ�ǩ��<������Բ���>
			con=cm.getConnection();
			st=con.createStatement();
			rs=st.executeQuery("select *from PROTOCOL where akb020 = '"+AKB020+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
			
			if(rs.next()){
				//˵�����ڣ���ת�Զ����ӡҳ�棬������fremarker����ģ��ҳ��
				//����ģ������htmlҳ�棬��URL����ǰ̨���д�ӡ
				//��ѯЭ����Ϣ
				Map<String, Object> dataMap=new HashMap<String, Object>();
		        Protocol protocol = new Protocol();
				//����Э����������
				prs = st.executeQuery("select *from PROTOCOL where akb020 = '"+AKB020+"' and WQ_YEAR = '"+WQ_YEAR+"' and WQ_VALID = '1'");
				if (prs.next()) {
					protocol.setAKB020(prs.getString("AKB020"));
					protocol.setAKB021(prs.getString("AKB021"));
					protocol.setWQ_AKB021(prs.getString("WQ_AKB021"));
					protocol.setWQ_NAME(prs.getString("WQ_NAME"));
					protocol.setWQ_ADDRESS(prs.getString("WQ_ADDRESS"));
					protocol.setWQ_POSTALCODE(prs.getString("WQ_POSTALCODE"));
					protocol.setWQ_TEL(prs.getString("WQ_TEL"));
					protocol.setWQ_IP(prs.getString("WQ_IP"));
					protocol.setWQ_YEAR(prs.getString("WQ_YEAR"));
					
					protocol.setWQ_TIME(TimeUtil.getDate(prs.getString("WQ_TIME")));
					protocol.setTYPE(prs.getString("TYPE"));
					protocol.setWQ_VALID(prs.getString("WQ_VALID"));
					protocol.setWQ_OPTIONS(prs.getString("WQ_OPTIONS"));
					protocol.setWQ_JDATE(prs.getString("WQ_JDATE"));
					protocol.setWQ_YDATE(prs.getString("WQ_YDATE"));
					protocol.setWQ_JTEL(prs.getString("WQ_JTEL"));
					protocol.setWQ_JNAME(prs.getString("WQ_JNAME"));
					protocol.setWQ_JINSTITUTION(prs.getString("WQ_JINSTITUTION"));
					protocol.setWQ_JADDRESS(prs.getString("WQ_JADDRESS"));
					protocol.setWQ_JPOSTALCODE(prs.getString("WQ_JPOSTALCODE"));
					dataMap.put("protocol", protocol);
					//�׷��ĵ绰Ϊ���
					String jtel = protocol.getWQ_JTEL();
					String[] tels = jtel.split(",");
					
					dataMap.put("jtel", tels);
					//Э����
					String option = protocol.getWQ_OPTIONS();
					String[] options = option.split(",");
					
					dataMap.put("options", options);
					dataMap.put("ie", ie);
					DocUtil docUtil=new DocUtil();
					String des = path+"protocol/heb_"+WQ_YEAR+"/"+protocol.getAKB020();
					
					File file = new File(des);
					if (!file.exists()) {
						file.mkdirs();
					}
					docUtil.createDoc(dataMap, "protocol_"+protocol.getTYPE(), des+"/"+protocol.getAKB020()+".html");
					String url = "protocol/heb_"+WQ_YEAR+"/"+protocol.getAKB020()+"/"+protocol.getAKB020()+".html";
					response.setContentType("text/html;charset=UTF-8");
					PrintWriter writer = response.getWriter();
			        writer.write(url);
			        writer.flush();
			        writer.close();
			        return;
				}
			} else {
				//˵��������
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("repeat");
		        writer.flush();
		        writer.close();
		        return;
			}
		} catch (Exception e) {
			
			try {
				con.rollback();
				//��ʾ����ʧ��
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter writer = response.getWriter();
		        writer.write("error");
		        writer.flush();
		        writer.close();
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
