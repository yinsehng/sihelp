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
		//下载插件
		//1、首先检查客户浏览器版本
		String version = (String)request.getParameter("version");
		if (version.contains("32")) {
			//提供32位下载
			path = path+"install_lodop32.exe";
			
		} else {
			//提供64位下载
			path = path + "install_lodop64.ext";
		}
		downloadFileByOutputStream(response,path);
	}
	
	/**
	      * 下载文件，通过OutputStream流
	      * @param response
	      * @throws FileNotFoundException
	      * @throws IOException
	      */
	     private void downloadFileByOutputStream(HttpServletResponse response,String path)
	             throws FileNotFoundException, IOException {
	         //1.获取要下载的文件的绝对路径
	         String realPath = path;
	         //2.获取要下载的文件名
	         String fileName = realPath.substring(realPath.lastIndexOf("\\")+1);
	         //3.设置content-disposition响应头控制浏览器以下载的形式打开文件
	         response.setHeader("content-disposition", "attachment;filename="+fileName);
	         //4.获取要下载的文件输入流
	         InputStream in = new FileInputStream(realPath);
	         int len = 0;
	         //5.创建数据缓冲区
	         byte[] buffer = new byte[1024];
	         //6.通过response对象获取OutputStream流
	         OutputStream out = response.getOutputStream();
	         //7.将FileInputStream流写入到buffer缓冲区
	         while ((len = in.read(buffer)) > 0) {
	         //8.使用OutputStream将缓冲区的数据输出到客户端浏览器
	             out.write(buffer,0,len);
	         }
	         in.close();
	     }

	public void init() throws ServletException {
	}

}
