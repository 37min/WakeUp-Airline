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

<link href="<%=request.getContextPath()%>/jqGrid/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqGrid/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath()%>/jqGrid/js/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jqGrid/js/i18n/grid.locale-kr_utf-8.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){     
    jQuery("#gridList").jqGrid({   
    	url:"SuperMan2.action",    
        datatype: "json",  
        jsonReader : {  // 이부분 추가 하셔야 json 쓰시기 편리 합니다. 
					page: "page", 
					total: "total", 
					root: "user", 
					records: function(obj){return obj.length;},
					repeatitems: false, 
					id: "id"
				}, // 여기 까지 
        colNames:['id','Date', 'Client', 'Amount','Tax','Total','Notes'],
   		colModel:[
   		{name:'id',index:'id', width:60 },
   		{name:'invdate',index:'invdate', width:90 },
   		{name:'name',index:'name', width:100},
   		{name:'amount',index:'amount', width:80, align:"right"},
   		{name:'tax',index:'tax', width:80, align:"right"},		
   		{name:'total',index:'total', width:80,align:"right"},		
   		{name:'note',index:'note', width:150, sortable:false}		
   	],
 	rowNum:10, // 한 화면에 보여줄 갯수
   	rowList:[5,10,15],  
   	pager: '#pager2',  
    viewrecords: true,	
	loadonce: true,
    caption:"JSON Example" // 챠트 제목
});  
});
</script>

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
%>
			<table id="gridList" class="scroll" ></table>
			<div id="pager2"></div>			
<%			
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