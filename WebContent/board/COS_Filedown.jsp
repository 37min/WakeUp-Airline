<%@ page language="java" 
contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<%@ page import="java.io.File" %>
<%@ page import="java.io.*" %>
<%
	 //�⺻���� ���� : file�� / ����� ���
	  String filename =request.getParameter("file_name");
      String savePath ="boardUpload";

      ServletContext context = getServletContext();
      String sDownLoadPath =context.getRealPath(savePath);
      
      String sFilePath = sDownLoadPath + "\\" + filename.trim();
      
      //read �� ���Ͽ� ���� ���� (server ��� ��ο� � ���� read)
      //out.print(filename + "<br> " + context + "<br> " + sDownLoadPath + "<br>"+ sFilePath);
      
      //�� ������ ��� ���� �ؼ� Client ���� ����
      byte[] b = new byte[4096];
      //File oFile = new File(sFilePath);
      
      FileInputStream in = new FileInputStream(sFilePath);
      
      String sMimeType = getServletContext().getMimeType(sFilePath);
      //out.print(sMimeType);
      
      //������ ���� ����
      if(sMimeType ==null) {
    	  sMimeType = "application/octet-stream";
      }
      
      //out.print(sMimeType + "<br>");
      //out.print(filename);
      response.setContentType(sMimeType);
      //�ѱ� ó�� ���� ����
      String sEncoding = new String(filename.getBytes("euc-kr"),"8859_1");
      response.setHeader("Content-Disposition","attachment;filename= " + sEncoding);
      //response.setHeader("Content-Disposition","attachment;filename= " + filename +";");
      //out.print(sMimeType + " / " + sEncoding);
      
      ServletOutputStream out2 = response.getOutputStream();
      int numRead;
      
      while((numRead = in.read(b,0,b.length))!=-1){ 
    	//read() => a.txt read  byte[] b = new byte[4096]; write
    	  out2.write(b,0,numRead);
      }
     out2.flush();
      out2.close();
      in.close();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>File DownLoad Process</title>
</head>
<body>

</body>
</html>