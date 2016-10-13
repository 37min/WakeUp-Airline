<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationResultBean" %>	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@page import="NET.WUA.MEMBER.DB.MemberBean"%>

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
<jsp:include page="include/submenu/mypage.jsp" flush="true"/>
</div>
<div style="float:left; width: 796px; height: 600px;padding:0 0 0 0px;">
<!-- right contents area -->

<table width="100%">
<tr align="right">
	<td><font color="gray" size="2">Ȩ>����������>���ų��� ��ȸ<hr></font></td>
</tr>
<tr align="left">
	<td>
<%
		ArrayList<ReservationResultBean> myReservList = null;
		myReservList = (ArrayList<ReservationResultBean>) session.getAttribute("myReservationList");
		
		if( myReservList == null )
		{
%>	
			��ȸ����� �����ϴ�.
<%
		}
		else
		{
%>
			<form action="ReservCancelAction.re" name="ReservCancelForm" method="post">
			<table style="border: 1px solid #98bf21;border-collapse: collapse;text-align: center;">
				<tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
					<td style="border: 1px solid #98bf21;"><b>�����ȣ</b></td>
					<td style="border: 1px solid #98bf21;"><b>�����</b></td>
					<td style="border: 1px solid #98bf21;"><b>������</b></td>
					<td style="border: 1px solid #98bf21;"><b>�����</b></td>
					<td style="border: 1px solid #98bf21;"><b>��߽ð�</b></td>
					<td style="border: 1px solid #98bf21;"><b>�����ð�</b></td>
					<td style="border: 1px solid #98bf21;"><b>���׿��</b></td>
					<td style="border: 1px solid #98bf21;"><b>�������</b></td>
				</tr>
<%
				for( Object obj : myReservList )
				{
					ReservationResultBean rrb = (ReservationResultBean) obj;
%>
					<tr>
						<td style="border: 1px solid #98bf21;"><%=rrb.getrNo() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchDeparture() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchArrival() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchDepartDate() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchDepartTime() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchArrivalTime() %></td>
						<td style="border: 1px solid #98bf21;"><%=rrb.getSchFare() %></td>
						<td style="border: 1px solid #98bf21;">
<%
																					 System.out.println("");
																					 if( Integer.parseInt(rrb.getrState()) == 0 )
																					 {
%>
																						<font color="red">������</font>
<%																						 
																					 }
																					 else if ( Integer.parseInt(rrb.getrState()) == 1 )
																					 {
%>
																						<font color="black">���Ϸ�</font>
<%																						 
																					 }
																					 else
																					 {
%>
																						<font color="black">��ҵ�</font>
<%																						 
																					 }
%>
						</td>
					</tr>
<%					
				}
%>				
					<tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
						<td colspan="8"  style="border: 1px solid #98bf21;">����¡ó���� �ȵ�θ޴ٷ� �ϴ�...</td>
					</tr>
			</table>
			</form>
<%			
		}//end else.
%>	
	</td>
</tr>
</table>
</div>
</div>
</center>
</body>
</html>