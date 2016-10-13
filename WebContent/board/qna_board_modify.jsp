<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="NET.WUA.BOARD.DB.*" %>
<%
	response.setCharacterEncoding("euc-kr");
	BoardBean board = (BoardBean)request.getAttribute("boarddata");
%>

<html>
<head>
	<title>Q&A �Խ���</title>
	<script type="text/javascript">
	function modifyboard(){
		modifyform.submit();
	}
	</script>
	<style type="text/css">
tr td div a:link {
	color: #333;
}
tr td div a:visited {
	color: #333;
}
tr td div a:hover {
	color: #333;
}
tr td div a:active {
	color: #F06;
}
*{
font-family: "����", "Dotum";
font-size: 12px;
}
</style>
</head>

<body>
<!-- �Խ��� ���� -->
<form action="BoardModifyAction.bo" method="post" name="modifyform">
<input type="hidden" name="BOARD_NUM" value=<%=board.getBoard_num() %>>
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">Q&A �Խ���</td>
	</tr>
	<tr>
		<td height="16" style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" size="50" maxlength="100" 
				value="<%=board.getBoard_subject()%>">
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"><%=board.getBoard_content() %></textarea>
		</td>
	</tr>
	<%if(!(board.getBoard_file()==null)){ %>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">���� ÷��</div>
		</td>
		<td>
			&nbsp;&nbsp;<%=board.getBoard_file() %>
		</td>
	</tr>
	<%} %>
	<tr>
		<td height="16" style="font-family:����; font-size:12">
			<div align="center">��й�ȣ</div>
		</td>
		<td>
			<input name="BOARD_PASS" type="password">
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="javascript:modifyboard()">[����]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� ���� -->
</body>
</html>