
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchBean"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchDao"%>

<%@ page import="NET.WUA.MEMBER.DB.*"%>
<% 	MemberBean member=(MemberBean)session.getAttribute("session_member"); %>

<% 
	List departdatelist = (List)request.getAttribute("departdatelist"); 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<table border="1" align="center" width="700px">
		<tr>
			<td>�������ȣ:</td>
			<td>������:</td>
			<td>�������:</td>
			<td>��߽ð�:</td>
			<td>�����ð�:</td>
			<td>�Ϲݿ��:</td>
			<td>�¼���:</td>
			<td>����� �¼���:</td>
			<td>�����:</td>
			<td>������:</td>
		</tr>
		
		<%
			//schno	
			for(int i = 0; i < departdatelist.size(); i++){
				SchBean sb = (SchBean)departdatelist.get(i);
		%>
		<tr>
			<td><%=sb.getSchNo()%></td>
			<td><%=sb.getSchApName()%></td>
			<td><%=sb.getSchDepartDate()%></td>
			<td><%=sb.getSchDepartTime()%></td>
			<td><%=sb.getSchArrivalTime()%></td>
			<td><%=sb.getSchFare()%></td>
			<td><%=sb.getShcSeat()%></td>
			<td><%=sb.getSchSeatResv()%></td>
			<td><%=sb.getSchDeparture()%></td>
			<td><%=sb.getSchArrival()%></td>
		</tr>
	<% } %>
		
	</table>
	<hr>
	<input type="button" value="���ư���" onclick="location.href='SchSearch.jsp';">
	

</body>
</html>