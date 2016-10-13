<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationBean"%>
<%@ page import="NET.WUA.RESERVATION.DB.ReservationDao"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Reservation check</title>
</head>
<body>
<form name="ReservcheckForm" action="./ReservInsertViewAction.re" method="post">
<center>
	<table border=1>
		<tr>
			<td colspan="2" align=center>예약하기</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="RMEMBER_ID"/>
			<input type="submit" value="확인"></td>
		</tr>
		<tr>
		<td>출국 날짜</td>
		<td><select name = "date">
				<option value = "2011-01-01">11년 1월 1일</option>
				<option value = "2012-02-02">12년 2월 2일</option>
				<option value = "2013-03-03">13년 3월 3일</option>
			</select></td>
		</tr>
		<tr>
		<td>출발지</td>
		<td><select name = "departure">
				<option value = "Kimpo">Kimpo</option>
				<option value = "Jeju">Jeju</option>
				<option value = "Busan">Busan</option>
			</select></td>
		</tr>
		<tr>
		<td>도착지</td>
		<td><select name = "arrival">
				<option value = "Kimpo">Kimpo</option>
				<option value = "Jeju">Jeju</option>
				<option value = "Busan">Busan</option>
			</select></td>
		</tr>
	</table>
</center>
</form>
</body>
</html>