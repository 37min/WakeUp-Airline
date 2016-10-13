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
	<td><font color="gray" size="2">홈>항공권예매>국내선<hr></font></td>
</tr>
<tr align="left">
	<td>
	
		
		<%
		if( sessionId == null || sessionId.equals("") )
		{
		%>
		회원전용 메뉴입니다.<br>
		로그인 후 이용해 주시기 바랍니다.<br>
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
							<td colspan="10" align="center">예약을 원하시는 항목을 선택해 주세요.</td>
						</tr>
						<tr>
							<td width="50px"></td>
							<td>비행기명:</td>
							<td>출발일자:</td>
							<td>출발시간:</td>
							<td>도착시간:</td>
							<td>일반요금:</td>
							<td>좌석수:</td>
							<td>잔여석:</td>
							<td>출발지:</td>
							<td>도착지:</td>
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
								<font color="red">매진</font>
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
							<td colspan="10"  style="text-align: center"><input type="submit" value="예약하기"></td>
						</tr>
					</table>
					</form>		
<%				
					}	
					else
					{
%>
						지정된 조건의 조회 결과가 없습니다.<br>	
						<a href="Reservation_domestic.jsp"><font color="gray">다시 조회하기</font></a>
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