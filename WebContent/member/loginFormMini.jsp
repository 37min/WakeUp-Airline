<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
		String strcontextPath = (String)request.getContextPath();

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
		환영합니다  WUAirline
	</ul></font>
	<HR>
	<div id="tabs-1">
		<form name="loginform" action="MemberLoginAction.me" method="post">
			<font size="1" align="left">
			<table border="0">
				<tr><td align="left">ID</td><td align="right"><input type="text" size="20" name="user_id" id="user_id" ></td></tr>
				<tr><td align="left">PW</td><td align="right"><input type="password"  size="20" name="user_pw" id="user_pw" ></td></tr>
			</table>
			</font>
		<hr>
			<font size="2" align="right">
			<input type="submit" value="로그인"><input type="button" value="회원가입" onclick="location='./JoinPage.jsp'"></a>
			</font>
		</form>
	</div> 
	
</div>

</body>
</html>
