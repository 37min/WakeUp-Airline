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
<form name="ReservcheckForm" action="./ReservCheckAction.re" method="post">
<center>
	<table border=1>
		<tr>
			<td colspan="2" align=center>���� �������� ��ȸ</td>
		</tr>
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="RMEMBER_ID"/>
			<input type="submit" value="Ȯ��"></td>
		</tr>
	</table>
</center>
</form>
</body>
</html>