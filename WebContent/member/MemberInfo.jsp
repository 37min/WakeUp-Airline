<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="NET.WUA.MEMBER.DB.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

</head>
<body>

<%
		MemberBean sessionDTO = null;
		sessionDTO = (MemberBean) session.getAttribute("session_member");
		
		String sessionId = "";
		
		if( sessionDTO != null )
		{
			sessionId = sessionDTO.getmId();
		}
		else
		{
			System.out.println("SessionDTO is null");
%>
		<script>
			location.href='./Index.jsp';
		</script>
<%			
		}
%>

<table style="width: 500px;border: 1px solid #98bf21;border-collapse: collapse;text-align: center;font-family: 'Trebuchet MS';">
  <tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
    <td colspan="2" align="center"><h3>My Informations</h3></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;" width="25%" align="right">mNO</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmNo() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">mID  </td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmId() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">mPW</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmPw() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">KOR NAME</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmKorName() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">LAST NAME</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmEngLastName() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MID NAME</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmEngMidName() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">SEX</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmSex() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">ADDR</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmAddress() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">Moblie</td>	
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmMobilePhone() %></td>
  </tr> 
  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MAIL</td>
    <td style="border: 1px solid #98bf21;"  width="75%"><%=sessionDTO.getmEmail() %></td>
  </tr>
  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MILEAGE</td>
    <td  style="border: 1px solid #98bf21;" width="75%"><%=sessionDTO.getmMileage() %></td>
  </tr>
</table>

</body>
</html>