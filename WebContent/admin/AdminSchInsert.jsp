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
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
	$(function() {
	  $( "#datepicker" ).datepicker({
			  dateFormat: "yy-mm-dd"  
	  });
	
	});
</script>
</head>
<body>

<center>
	<form action="AdminSchInsert.fp" submit="post">
	
	<table border="1" align="left" width="300px" style="border: 1px solid #98bf21;border-collapse: collapse;font-family: 'Trebuchet MS';">
	
<!-- 	schapname, <input type="text" name="schapname">
	shcseat, <input type="text" name="schapname">
	schseatresv, <input type="text" name="schapname"> -->
	
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">출발일자</td> 
			<td style="text-align: left">
			<input type="text" id="datepicker" name="schDepartDate">
			</td>
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
	
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">출발시간</td> 
			<td style="text-align: left">
			<select name="schDepartTime">
					<option value="08:00">08:00</option>
					<option value="12:00">12:00</option>
					<option value="16:00">16:00</option>
				</select></td>
		</tr>
		
		<tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
			<td style="text-align: right">항공요금</td> 
			<td style="text-align: left">
			<input type="text" name="fare"/>
			<input type="hidden" name="seat" value="30"/>
			<input type="hidden" name="seatrsv" value="30"/>
			<input type="hidden" name="apname" value="WAL063"/>
			</td>
		</tr>
		
	
	
	<tr><td colspan="2"><input type="submit" value="항공편 추가"></td></tr>
	
	</form>
</table>
</center>
	
</body>
</html>