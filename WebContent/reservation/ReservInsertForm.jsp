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
			<td colspan="2" align=center>�����ϱ�</td>
		</tr>
		<tr>
			<td>���̵�</td>
			<td><input type="text" name="RMEMBER_ID"/>
			<input type="submit" value="Ȯ��"></td>
		</tr>
		<tr>
		<td>�ⱹ ��¥</td>
		<td><select name = "date">
				<option value = "2011-01-01">11�� 1�� 1��</option>
				<option value = "2012-02-02">12�� 2�� 2��</option>
				<option value = "2013-03-03">13�� 3�� 3��</option>
			</select></td>
		</tr>
		<tr>
		<td>�����</td>
		<td><select name = "departure">
				<option value = "Kimpo">Kimpo</option>
				<option value = "Jeju">Jeju</option>
				<option value = "Busan">Busan</option>
			</select></td>
		</tr>
		<tr>
		<td>������</td>
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