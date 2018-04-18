package com.neusoft.servlet;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DownloadServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public DownloadServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String path = getServletContext().getRealPath("\\");
		path = path +"servlet\\";
		//���ز��
		//1�����ȼ��ͻ�������汾
		String version = (String)request.getParameter("version");
		if (version.contains("32")) {
			//�ṩ32λ����
			path = path+"install_lodop32.exe";
			
		} else {
			//�ṩ64λ����
			path = path + "install_lodop64.ext";
		}
		downloadFileByOutputStream(response,path);
	}
	
	/**
	      * �����ļ���ͨ��OutputStream��
	      * @param response
	      * @throws FileNotFoundException
	      * @throws IOException
	      */
	     private void downloadFileByOutputStream(HttpServletResponse response,String path)
	             throws FileNotFoundException, IOException {
	         //1.��ȡҪ���ص��ļ��ľ���·��
	         String realPath = path;
	         //2.��ȡҪ���ص��ļ���
	         String fileName = realPath.substring(realPath.lastIndexOf("\\")+1);
	         //3.����content-disposition��Ӧͷ��������������ص���ʽ���ļ�
	         response.setHeader("content-disposition", "attachment;filename="+fileName);
	         //4.��ȡҪ���ص��ļ�������
	         InputStream in = new FileInputStream(realPath);
	         int len = 0;
	         //5.�������ݻ�����
	         byte[] buffer = new byte[1024];
	         //6.ͨ��response�����ȡOutputStream��
	         OutputStream out = response.getOutputStream();
	         //7.��FileInputStream��д�뵽buffer������
	         while ((len = in.read(buffer)) > 0) {
	         //8.ʹ��OutputStream��������������������ͻ��������
	             out.write(buffer,0,len);
	         }
	         in.close();
	     }

	public void init() throws ServletException {
	}

}
