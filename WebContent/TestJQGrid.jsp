<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
  
<%
		String dateFrom		 = request.getParameter("schDepartDate"); 
		String dateTo			 = request.getParameter("schDepartDate2"); 
		String departure		 = request.getParameter("schDeparture"); 
		String arrival				 = request.getParameter("schArrival"); 
		
		session.setAttribute("dateFrom", dateFrom);
		session.setAttribute("dateTo", dateTo);
		session.setAttribute("departure", departure);
		session.setAttribute("arrival", arrival);
		
		//String getDataStr = "?dateFrom=" + dateFrom + "&dateTo=" + dateTo + "&departure=" + departure + "&arrival=" + arrival;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="<%=request.getContextPath()%>/jqGrid/css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/jqGrid/css/ui.jqgrid.css" rel="stylesheet" type="text/css" />

<script src="<%=request.getContextPath()%>/jqGrid/js/jquery-1.9.0.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jqGrid/js/i18n/grid.locale-kr_utf-8.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/jqGrid/js/jquery.jqGrid.min.js" type="text/javascript"></script>

<script type="text/javascript">

$(document).ready(function(){     
    jQuery("#gridList").jqGrid({   
    	url:"TestJQGrid_Processor.jsp",    
        datatype: "json",  
        jsonReader : {  // 이부분 추가 하셔야 json 쓰시기 편리 합니다. 
					page: "page", 
					total: "total", 
					root: "user", 
					records: function(obj){return obj.length;},
					repeatitems: false, 
					id: "id"
				}, // 여기 까지 
        colNames:['SCHNO','SCHAPNAME', 'SCHDEPARTDATE', 'SCHDEPARTTIME','SCHARRIVALTIME','SCHFARE','SCHSEATRESV','SCHDEPARTURE','SCHARRIVAL'],
   		colModel:[
   		{name:'SCHNO',index:'SCHNO', width:60,sortable:true },
   		{name:'SCHAPNAME',index:'SCHAPNAME', width:90,sortable:false},
   		{name:'SCHDEPARTDATE',index:'SCHDEPARTDATE', width:100,sortable:false},
   		{name:'SCHDEPARTTIME',index:'SCHDEPARTTIME', width:80, align:"right",sortable:false},
   		{name:'SCHARRIVALTIME',index:'SCHARRIVALTIME', width:80, align:"right",sortable:false},		
   		{name:'SCHFARE',index:'SCHFARE', width:80,align:"right",sortable:false},
   		{name:'SCHSEATRESV',index:'SCHSEATRESV', width:60,align:"right",sortable:false},
   		{name:'SCHDEPARTURE',index:'SCHDEPARTURE', width:80,align:"right",sortable:false},
   		{name:'SCHARRIVAL',index:'SCHARRIVAL', width:80, sortable:false}		
   	],
 	rowNum:10, // 한 화면에 보여줄 갯수
   	rowList:[5,10,15],  
   	pager: '#pager2',  
    viewrecords: true,	
	loadonce: true,
    caption:"Schedule List by JQGrid" // 챠트 제목
});  
});
</script>
</head>
<body>


  <table id="gridList" class="scroll" ></table>
   <div id="pager2"></div>

</body>
</html>