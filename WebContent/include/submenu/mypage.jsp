<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script>
$(function() {
  $( "#menu" ).menu();
});
</script>
<style>
.ui-menu { width: 174px;float:left; border-right: 1px solid #d8d8d8; font-family: "����", "Dotum";}
</style>
  
</head>
<body>
<ul id="menu">
  <li class="ui-state-disabled"><a href="#"> <font size="3" color="gray"><B>����������</B></font></a></li>
  <li><a href="Mypage_memberview.jsp"><font size="2" color="black">ȸ������ ��ȸ</font></a></li>
  <li><a href="Mypage_membermodify.jsp"><font size="2" color="black">ȸ������ ����</font></a></li>
  <li><a href="Mypage_memberpassmodify.jsp"><font size="2" color="black">��й�ȣ ����</font></a></li>
  <hr>
  <li><a href="Mypage_purchagelist.jsp"><font size="2" color="black">���ų��� ��ȸ</font></a></li>
  <li><a href="Mypage_reservationlist.jsp"><font size="2" color="black">���೻�� ��ȸ</font></a></li>
</ul>
</body>
</html>