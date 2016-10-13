
<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
   
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationBean"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationDao"%>

<% 
   List reservlist = (List)request.getAttribute("reservlist"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Check View Page</title>
</head>
<body>
	   <table border="1" align="center">
	      <tr>
	         <td align ="center" width="150px">예약 번호</td>
	         <td align ="center" width="150px">예약 스케줄 번호</td>
	         <td align ="center" width="150px">예약자 아이디</td>
	         <td align ="center" width="150px">예약 상태</td>
	      </tr>
	      
	      <%
	         for(int i = 0; i < reservlist.size(); i++){
	        	 ReservationBean res = (ReservationBean) reservlist.get(i);
	      %>
	      <tr>
	        <td><%=res.getrNo()%></td>
	        <td><%=res.getrScheNo()%></td>
	        <td><%=res.getrMemberId()%></td>
	        <td><%=res.getrState()%></td> 
	        <td><a href="ReservCancelForm.jsp?SelRno=<%= res.getrNo() %>">취소</a></td>  
	      </tr>
	  	  <% } %>
	      
	   </table>

	   <hr>
	   <center>
	   	<input type="button" value="다시검색" onclick="location.href='ReservCheckForm.jsp';">
	   </center>
</body>
</html>