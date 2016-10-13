<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<% 
	int schno = Integer.parseInt(request.getParameter("SchNo"));
	String memberid = (String)(request.getParameter("memberID"));
		
	out.print("<script>");
	out.print("location.href='./ReservSaveAction.re?SchNo=" + schno + "&memberID=" + memberid + "'");
	out.print("</script>");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Reservation Process</title>
</head>
<body>

</body>
</html>