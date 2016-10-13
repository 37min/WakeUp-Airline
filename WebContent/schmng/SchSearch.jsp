<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	
<%@ page import="NET.WUA.MEMBER.DB.*"%>
<% 	MemberBean member=(MemberBean)session.getAttribute("session_member"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
	  $( "#datepicker" ).datepicker({
			  dateFormat: "yy-mm-dd"  
	  });
	  $( "#datepicker2" ).datepicker({
		  dateFormat: "yy-mm-dd"  
  });
	});
</script>

</head>
<body>

	<form action="SuperMan.action" submit="post">
	<table border="1" align="left" width="300px" style="border: 1px solid #98bf21;border-collapse: collapse;font-family: 'Trebuchet MS';">
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">출발일자</td> 
			<td style="text-align: left"><input type="text" id="datepicker" name="schDepartDate"></td>
		</tr>
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">출발일자</td> 
			<td style="text-align: left"><input type="text" id="datepicker2" name="schDepartDate2"></td>
		</tr>
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#ffffff;">
			<td style="text-align: right">출발지</td> 
			<td style="text-align: left">
				<select name="schDeparture">
					<option value="Kimpo">[ 김포 ]-Kimpo</option>
					<option value="Busan">[ 부산 ]-Busan</option>
					<option value="Jeju">[ 제주 ]-Jeju</option>
				</select>
			</td>
		</tr>
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">도착지</td> 
			<td style="text-align: left">
				<select name="schArrival">
					<option value="Kimpo">[ 김포 ]-Kimpo</option>
					<option value="Busan">[ 부산 ]-Busan</option>
					<option value="Jeju">[ 제주 ]-Jeju</option>
				</select>
			</td>
		</tr>
		<tr  style="font-size: 10pt;height: 30px;background-color:#ffffff;">
			<td colspan="2"  style="text-align: center"><input type="submit" value="조회하기"></td>
		</tr>
	</table>
 	</form>	

</body>
</html>