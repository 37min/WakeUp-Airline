<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="NET.WUA.BOARD.DB.*" %>
<%
	BoardBean board=(BoardBean)request.getAttribute("boarddata");
    String Content = board.getBoard_content();
%>
<%
	response.setCharacterEncoding("euc-kr");
%>
<html>
<head>
	<title>Q&A �Խ���</title>
	<script language="javascript">
	function replyboard(){
		boardform.submit();
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
<!-- �Խ��� �亯 -->
<form action="./BoardReplyAction.bo" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="<%=board.getBoard_num() %>">
<input type="hidden" name="BOARD_RE_REF" value="<%=board.getBoard_re_ref() %>">
<input type="hidden" name="BOARD_RE_LEV" value="<%=board.getBoard_re_lev() %>">
<input type="hidden" name="BOARD_RE_SEQ" value="<%=board.getBoard_re_seq() %>">

<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">Q&A �Խ���</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�۾���</div>
		</td>
		<td>
			<input name="BOARD_NAME" type="text"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12" height="16">
			<div align="center">�� ��</div>
		</td>
		<td>
			<input name="BOARD_SUBJECT" type="text" size="50" 
				maxlength="100" value="Re: <%=board.getBoard_subject() %>"/>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
			<div align="center">�� ��</div>
		</td>
		<td>
			<textarea name="BOARD_CONTENT" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:����; font-size:12">
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
		<a href="javascript:replyboard()">[���]</a>&nbsp;&nbsp;
		<a href="javascript:history.go(-1)">[�ڷ�]</a>
		</td>
	</tr>
</table>
</form>
<!-- �Խ��� �亯 -->
*������ ����*<br>
<hr>
<%= Content.replaceAll("\r\n", "<br>") %>
<hr>

</body>
</html>