<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@page import="NET.WUA.MEMBER.DB.MemberBean"%>
<%
		String strcontextPath = (String)request.getContextPath();

%>
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
<html>
<head>
<title></title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script>
	$(function() {
	  $( "#tabs" ).tabs();
	  
	  $( "input[type=submit, button]" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
	  
	});
	
</script>
</head>
<body>
<div id="tabs" style="width=150px;">
	<font align="left" size="2" >
	<ul>
		[ <%=sessionDTO.getmKorName() %> ] 님 반갑습니다.
	</ul></font>
	<HR>
	<div id="tabs-1">
	<font align="left" size="2" >
		마일리지 : [<%=sessionDTO.getmMileage() %>] Point<br><br>
		<a href="<%=strcontextPath %>/Mypage_memberview.jsp">마이페이지</a> / <a href="<%=strcontextPath %>/member/logout.jsp">로그아웃</a><br>
	</font>
	</div> 
	
</div>

</body>
</html>
