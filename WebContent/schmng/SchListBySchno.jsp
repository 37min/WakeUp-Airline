
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchBean"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchDao"%>

<%@ page import="NET.WUA.MEMBER.DB.*"%>
<% 	MemberBean member=(MemberBean)session.getAttribute("session_member"); %>

<% 
	List schno = (List)request.getAttribute("schnolist"); 
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
			for(int i = 0; i < schno.size(); i++){
				SchBean sb1 = (SchBean) schno.get(i);
		%>
		<tr>
			<td><%=sb1.getSchNo()%></td>
			<td><%=sb1.getSchApName()%></td>
			<td><%=sb1.getSchDepartDate()%></td>
			<td><%=sb1.getSchDepartTime()%></td>
			<td><%=sb1.getSchArrivalTime()%></td>
			<td><%=sb1.getSchFare()%></td>
			<td><%=sb1.getShcSeat()%></td>
			<td><%=sb1.getSchSeatResv()%></td>
			<td><%=sb1.getSchDeparture()%></td>
			<td><%=sb1.getSchArrival()%></td>
		</tr>
	<% } %>
		
	</table>
	<hr>
	<input type="button" value="���ư���" onclick="location.href='SchSearch.jsp';">
	

</body>
</html>