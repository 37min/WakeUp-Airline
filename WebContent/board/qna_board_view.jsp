<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="NET.WUA.BOARD.DB.*" %>
<%
BoardBean board = (BoardBean)request.getAttribute("boarddata");

ServletContext context = getServletContext();
String sDownLoadPath =context.getRealPath("boardUpload");

//String sFilePath = sDownLoadPath + "\\" + filename;

%>
<%
	response.setCharacterEncoding("euc-kr");
%>

<html>
<head>
	<title>Q&A 게시판</title>
</head>
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
font-family: "돋움", "Dotum";
font-size: 12px;
}
</style>
<body>
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0">
	<tr align="center" valign="middle">
		<td colspan="5">Q&A 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%=board.getBoard_subject() %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=0 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%=board.getBoard_content() %>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">첨부파일</div>
		</td>
		<td style="font-family:돋음; font-size:12">
		<%if(!(board.getBoard_file()==null)){ %>
		
		 <a href="board/COS_Filedown.jsp?file_name=<%=board.getBoard_file() %>">
		 <%=board.getBoard_file() %>
		
		<%} %>
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="./BoardReplyView.bo?num=<%=board.getBoard_num() %>">
			[답변]
			</a>&nbsp;&nbsp;
			<a href="./BoardModify.bo?num=<%=board.getBoard_num() %>">
			[수정]
			</a>&nbsp;&nbsp;
			<a href="./BoardDelete.bo?num=<%=board.getBoard_num() %>">
			[삭제]
			</a>&nbsp;&nbsp;
			<a href="./boardList.bo">[목록]</a>&nbsp;&nbsp;
			</font>
		</td>
	</tr>
</table>
<!-- 게시판 수정 -->
</body>
</html>