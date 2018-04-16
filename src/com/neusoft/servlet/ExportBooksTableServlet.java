package com.neusoft.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddress;

import com.neusoft.bean.User;
import com.neusoft.jdbc.ConnectionManager;
import com.neusoft.util.TimeUtil;

public class ExportBooksTableServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String akb020 = request.getParameter("akb020");
		String akb021 = request.getParameter("akb021");
		String WQ_YEAR = request.getParameter("WQ_YEAR");
		String type = request.getParameter("type");
		if ("".equals(WQ_YEAR)||WQ_YEAR==null) {
			WQ_YEAR = TimeUtil.getYear();
		}
		//��ȡsession
		HttpSession session=request.getSession();
		//��¼�û�
		User u=(User)session.getAttribute("user");
		if (u == null) {
			request.getRequestDispatcher("../index.jsp?out=ok").forward(request, response);
			return;
		}
		ArrayList<User> users = find(akb020, akb021, WQ_YEAR, type);
	    //����HSSFWorkbook����(excel���ĵ�����)
	    HSSFWorkbook wb = new HSSFWorkbook();
	    HSSFCellStyle cellStyle=wb.createCellStyle();
	    
	    HSSFFont fontStyle = wb.createFont();
	    fontStyle.setFontName("����");
	    fontStyle.setFontHeightInPoints((short)16);
	    fontStyle.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	    //�����µ�sheet����excel�ı���
	    HSSFSheet sheet=wb.createSheet("����������ҽ�ƻ�����ǩ��Ϣ");
	    //��sheet�ﴴ����һ�У�����Ϊ������(excel����)��������0��65535֮����κ�һ��
	    HSSFRow row1=sheet.createRow(0);
	    //������Ԫ��excel�ĵ�Ԫ�񣬲���Ϊ��������������0��255֮����κ�һ��
	    HSSFCell cell=row1.createCell(0);
	    //���õ�Ԫ������
	    cell.setCellValue("����������ҽ�ƻ�����ǩ��Ϣ"+"��"+WQ_YEAR+"��");
	    cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
	    cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN); //�±߿�    
	    cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);//��߿�    
	    cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);//�ϱ߿�    
	    cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);//�ұ߿� 
	    cellStyle.setFont(fontStyle);
	    cell.setCellStyle(cellStyle);
	    
	    //�ϲ���Ԫ��CellRangeAddress����������α�ʾ��ʼ�У������У���ʼ�У� ������
	    sheet.addMergedRegion(new CellRangeAddress(0,0,0,4));
	    //��sheet�ﴴ���ڶ���
	    sheet.setColumnWidth(0, 1100);
	    sheet.setColumnWidth(1, 4000);
	    sheet.setColumnWidth(2, 10000);
	    sheet.setColumnWidth(3, 4000);
	    sheet.setColumnWidth(4, 4000);
	    HSSFRow row2=sheet.createRow(1);    
	    //������Ԫ�����õ�Ԫ������
	    HSSFCell cellrow20 = row2.createCell(0);
	    HSSFCell cellrow21 = row2.createCell(1);
	    HSSFCell cellrow22 = row2.createCell(2);
	    HSSFCell cellrow23 = row2.createCell(3);
	    HSSFCell cellrow24 = row2.createCell(4);
	    
	    HSSFCellStyle cellStylerow2=wb.createCellStyle();
	    cellStylerow2.setBorderBottom(HSSFCellStyle.BORDER_THIN); //�±߿�    
	    cellStylerow2.setBorderLeft(HSSFCellStyle.BORDER_THIN);//��߿�    
	    cellStylerow2.setBorderTop(HSSFCellStyle.BORDER_THIN);//�ϱ߿�    
	    cellStylerow2.setBorderRight(HSSFCellStyle.BORDER_THIN);//�ұ߿� 
	    cellrow20.setCellStyle(cellStylerow2);
	    cellrow21.setCellStyle(cellStylerow2);
	    cellrow22.setCellStyle(cellStylerow2);
	    cellrow23.setCellStyle(cellStylerow2);
	    cellrow24.setCellStyle(cellStylerow2);
	    cellrow20.setCellValue("���");
	    cellrow21.setCellValue("ҽ�ƻ������");
	    cellrow22.setCellValue("ҽ�ƻ�������");
	    cellrow23.setCellValue("ǩ��״̬");
	    cellrow24.setCellValue("ǩ�����");
	    //��sheet�ﴴ��������
	    //��ʼѭ��
	    for (int i = 0; i < users.size(); i++) {
	    	HSSFRow row = sheet.createRow(i+2);
	    	HSSFCellStyle cellStyle_=wb.createCellStyle();
	    	HSSFCell cell_0 = row.createCell(0);
	    	HSSFCell cell_1 = row.createCell(1);
	    	HSSFCell cell_2 = row.createCell(2);
	    	HSSFCell cell_3 = row.createCell(3);
	    	HSSFCell cell_4 = row.createCell(4);
	    	if ("1".equals(users.get(i).getWq_valid())) {
	    		//��ʾ��ǩ��
	    		cellStyle_.setFillForegroundColor(HSSFColor.TURQUOISE.index);// ���ñ���ɫ    
	    		cellStyle_.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); 
	    	} else {
	    		cellStyle_.setFillForegroundColor(HSSFColor.YELLOW.index);// ���ñ���ɫ    
	    		cellStyle_.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND); 
	    	}
	    	cell_0.setCellValue(i+1);
	    	cell_1.setCellValue(users.get(i).getName());
	    	cell_2.setCellValue(users.get(i).getAkb021());
	    	cell_3.setCellValue("1".equals(users.get(i).getWq_valid())?"��ǩ��":"δǩ��");  
	    	cell_4.setCellValue(users.get(i).getWq_year());
	    	cellStyle_.setBorderBottom(HSSFCellStyle.BORDER_THIN); //�±߿�    
	    	cellStyle_.setBorderLeft(HSSFCellStyle.BORDER_THIN);//��߿�    
	    	cellStyle_.setBorderTop(HSSFCellStyle.BORDER_THIN);//�ϱ߿�    
	    	cellStyle_.setBorderRight(HSSFCellStyle.BORDER_THIN);//�ұ߿� 
	    	cell_0.setCellStyle(cellStyle_);
	    	cell_1.setCellStyle(cellStyle_);
	    	cell_2.setCellStyle(cellStyle_);
	    	cell_3.setCellStyle(cellStyle_);
	    	cell_4.setCellStyle(cellStyle_);
	    }

	    //���Excel�ļ�
	    OutputStream output=response.getOutputStream();
	    response.reset();
	    String time = TimeUtil.getCurrentDate("yyyy-MM-dd HH:mm:ss");
	    String filename = "Harbin_" + time;
	    response.setHeader("Content-disposition", "attachment; filename="+filename+".xls");
	    response.setContentType("application/msexcel");
	    wb.write(output);
	    output.close();

		
	}

	public void init() throws ServletException {
	}
	
	private ArrayList find(String akb020, String akb021, String WQ_YEAR, String type){
		String sql_ = "";
		String A_sql = "";
		String action = "right";
		
		if ("1".equals(type)) {
        	A_sql += " and WQ_VALID = 1";
        	action = "left";
        }
		if (!"".equals(akb020)&&akb020!=null) {
			sql_ += " and NAME = '"+akb020+"'";
			action = "right";
		}
        if (!"".equals(akb021)&&akb021!=null) {
        	try {
				akb021 = new String(akb021.getBytes("iso8859-1"), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
        	sql_ += " and AKB021 like '%"+akb021+"%'";
		}
        
        
        A_sql += " and WQ_YEAR = '"+WQ_YEAR+"'";
		
		
		ArrayList<User> list = new ArrayList<User>();
		
		//��ȡ��ǰ��¼���û���ͨ���û����ɶ�Ӧ����ǩЭ����
		ConnectionManager cm= ConnectionManager.getInstance();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con=cm.getConnection();
			st=con.createStatement();
			String sql="";
            if ("2".equals(type)) {
                sql="SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE, '0' WQ_VALID,'"+WQ_YEAR+"' WQ_YEAR from F_USER B where  name not in (select akb020 from protocol where WQ_VALID = 1 and WQ_YEAR = '"+WQ_YEAR+"') "+sql_+" order by WQ_VALID asc";
	        } else {
	        	sql="SELECT B.NAME,B.PASSWORD,B.AKB021,B.TIMES,B.UFLAG,B.IP,B.ENDDATE,A.WQ_VALID,A.WQ_YEAR  from (select *from protocol where 1=1 "+A_sql+") A "+action+" join (select *from f_user where 1=1 "+sql_+") B on B.name = A.akb020 and A.WQ_VALID = 1 and A.WQ_YEAR = '"+WQ_YEAR+"' order by WQ_VALID asc";
	        }
			
			rs = st.executeQuery(sql);
			
			while(rs.next()){
				User user = new User();
				user.setName(rs.getString("NAME"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setAkb021(rs.getString("AKB021"));
				user.setTimes(rs.getInt("TIMES"));
				user.setUflag(rs.getString("UFLAG"));
				user.setIp(rs.getString("IP"));
				user.setEnddate(rs.getDate("ENDDATE"));
				user.setWq_valid(rs.getString("WQ_VALID"));
				user.setWq_year(rs.getString("WQ_YEAR"));
				list.add(user);
			}
			
			
		} catch (SQLException e) {
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
		return list;
	}

}
