<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content`="text/html; charset=EUC-KR">
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
<!-- 웹폰트 -->



<!-- 끝 -->

</head>
<body>
<center>
<!-- Menu Area -->
<div style="width:1000px;"><jsp:include page="Menu.jsp" flush="false"/></div>
<!-- Contents Area -->
<div style="width:1000px;">
<div style="float:left; width:180px;padding:10px;border-right: 1px solid #d8d8d8;height: 600px;">
<!-- left sub menu area -->
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
</div>
<div style="float:left;height: 95%;padding:10px;">
<!-- right contents area -->
<img src="include/fallback/mainpageimg.jpg">
</div>
</div>
<!-- Footer Area -->
</center>
</body>
</html>