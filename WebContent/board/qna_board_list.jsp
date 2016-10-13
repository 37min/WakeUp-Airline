<%@ page language="java" contentType="text/html; charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="NET.WUA.BOARD.DB.*" %>
<%
	List boardList=(List)request.getAttribute("boardlist");
	int listcount=(Integer)request.getAttribute("listcount");
	int nowpage=(Integer)request.getAttribute("page");
	int maxpage=(Integer)request.getAttribute("maxpage");
	int startpage=(Integer)request.getAttribute("startpage");
	int endpage=(Integer)request.getAttribute("endpage");
%>
<%
	response.setCharacterEncoding("euc-kr");
%>
<html>
<head>
	<title>Q&A �Խ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
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

<body link="#00FF33" vlink="#00FFFF" alink="#6600FF">
<!-- �Խ��� ����Ʈ -->

<table width=50% border="0" cellpadding="0" cellspacing="0">
<%
if(listcount > 0){
%>
	<tr align="center" valign="middle">
		<td colspan="3"><font size=5>Q&A �Խ���</font></td>
		<td colspan="2" align=right>
			<font size=2>�� ���� : ${listcount }</font>
		</td>
	</tr><br><br><br>
	<tr>
	<td colspan="5"><br><br><td>
	</tr>
	
	<tr align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;" width="8%" height="26">
			<div align="center">��ȣ</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="50%">
			<div align="center">����</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="14%">
			<div align="center">�ۼ���</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="17%">
			<div align="center">��¥</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;" width="11%">
			<div align="center">��ȸ��</div>
		</td> 
	</tr>
	
	<%
		for(int i=0;i<boardList.size();i++){
			BoardBean bl=(BoardBean)boardList.get(i);
	%>
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<%=bl.getBoard_num()%>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<%if(bl.getBoard_re_lev()!=0){ %>
				<%for(int a=0;a<=bl.getBoard_re_lev()*2;a++){ %>
				&nbsp;
				<%} %>
				��
			<%}else{ %>
				��
			<%} %>
			<a href="./BoardDetailAction.bo?num=<%=bl.getBoard_num()%>">
				<%=bl.getBoard_subject()%>
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_name() %></div>
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_date() %></div>
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%=bl.getBoard_readcount() %></div>
		</td>
	</tr>
	<%} %>
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%if(nowpage<=1){ %>
			[����]&nbsp;
			<%}else{ %>
			<a href="boardList.bo?page=<%=nowpage-1 %>">[����]</a>&nbsp;
			<%} %>
			
			<%for(int a=startpage;a<=endpage;a++){
				if(a==nowpage){%>
				[<%=a %>]
				<%}else{ %>
				<a href="boardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp;
				<%} %>
			<%} %>
			
			<%if(nowpage>=maxpage){ %>
			[����]
			<%}else{ %>
			<a href="boardList.bo?page=<%=nowpage+1 %>">[����]</a>
			<%} %>
		</td>
	</tr>
	<%
    }
	else
	{
	%>
	<tr align="center" valign="middle">
		<td colspan="4">Q&A �Խ���</td>
		<td align=right>
			<font size=2>��ϵ� ���� �����ϴ�.</font>
		</td>
	</tr>
	<%
	}
	%>
	<tr align="right">
		<td colspan="5">
	   		<a href="BoardWrite.bo">[�۾���]</a>
		</td>
	</tr>
</table>

</body>
</html>