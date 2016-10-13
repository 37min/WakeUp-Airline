<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationBean"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationDao"%>

<% 
	int rno = Integer.parseInt(request.getParameter("SelRno"));
	//ReservCancelForm.jsp?SelRno=<%= res.getrNo() 
	out.print("<script>");
	out.print("location.href='./ReservCancelAction.re?Rno=" + rno + "'");
	out.print("</script>");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Reservation Delete</title>
</head>
<body>

</body>
</html>