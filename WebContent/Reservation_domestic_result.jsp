<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchBean"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchDao"%>
<%@page import="NET.WUA.MEMBER.DB.MemberBean"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<%
		MemberBean sessionDTO = null;
		sessionDTO = (MemberBean) session.getAttribute("session_member");
		
		String sessionId = "";
		
		if( sessionDTO != null )
		{
			sessionId = sessionDTO.getmId();
		}
		else
			System.out.println("SessionDTO is null");
		
		System.out.println("sessionId is " + sessionId);
%>
</head>
<body>
<center>
<!-- Menu Area -->
<div style="width:1000px;"><jsp:include page="Menu.jsp" flush="true"/></div>
<!-- Contents Area -->
<div style="width:1000px;">
<div style="float:left; width:200px;padding:0 0 0 0px;height: 600px;"><!-- left sub menu area -->
<%
		if( sessionId == null || sessionId.equals("") )
		{
%>
<jsp:include page="member/loginFormMini.jsp" flush="false"/>
<%
		}
		else
		{
%>
<jsp:include page="member/logonMini.jsp" flush="false"/>
<%			
		}
%>
<hr>
<jsp:include page="include/submenu/reservation.jsp" flush="true"/>
</div>
<div style="float:left; width: 796px; height: 600px;padding:0 0 0 0px;">
<!-- right contents area -->

<table width="100%">
<tr align="right">
	<td><font color="gray" size="2">Ȩ>�װ��ǿ���>������<hr></font></td>
</tr>
<tr align="left">
	<td>
	
		
		<%
		if( sessionId == null || sessionId.equals("") )
		{
		%>
		ȸ������ �޴��Դϴ�.<br>
		�α��� �� �̿��� �ֽñ� �ٶ��ϴ�.<br>
		<%
				}
				else
				{
					List schlist = (List) session.getAttribute("schList"); 
					
					if( schlist.size() != 0 )
					{
%>
						<form action="ReservInsertMemberAction.re" name="ReservcheckForm" method="post">
						<table border="1" align="center" width="750px">
						<tr>
							<td colspan="10" align="center">������ ���Ͻô� �׸��� ������ �ּ���.</td>
						</tr>
						<tr>
							<td width="50px"></td>
							<td>������:</td>
							<td>�������:</td>
							<td>��߽ð�:</td>
							<td>�����ð�:</td>
							<td>�Ϲݿ��:</td>
							<td>�¼���:</td>
							<td>�ܿ���:</td>
							<td>�����:</td>
							<td>������:</td>
						</tr>
				
					  	<%
					  		System.out.println("schlist.size() = " + schlist.size());
							for (int i = 0; i < schlist.size(); i++) {
								SchBean sb = (SchBean)schlist.get(i);
						%>
				
						<tr>
							<td width="50px" align="center">
<%

		if(sb.getSchSeatResv() != 0)
		{
%>
								<input type="hidden" name="reservation_memberId" value="<%=sessionId %>">
								<input type="radio" name="reservation_schNo" value="<%=sb.getSchNo()%>">
<%
		}
		else
		{
%>
								<font color="red">����</font>
<%
		}
%>							
								
							</td>
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
						<tr>
							<td colspan="10"  style="text-align: center"><input type="submit" value="�����ϱ�"></td>
						</tr>
					</table>
					</form>		
<%				
					}	
					else
					{
%>
						������ ������ ��ȸ ����� �����ϴ�.<br>	
						<a href="Reservation_domestic.jsp"><font color="gray">�ٽ� ��ȸ�ϱ�</font></a>
<%						
					}
				}
%>
	</td>
</tr>
</table>
</div>
</div>
</center>
</body>
</html>