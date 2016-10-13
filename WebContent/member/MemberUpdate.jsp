<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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


	<form name="updateform" action="MemberUpdAction.me" method="post">
		<table style="width: 500px;border: 1px solid #98bf21;border-collapse: collapse;text-align: center;font-family: 'Trebuchet MS';">
		  <tr style="font-size: 10pt;border: 1px solid #98bf21;height: 30px;background-color:#EAF2D3;">
		    <td colspan="2" align="center"><h3>My Informations</h3></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;" width="25%" align="right">mNO</td>
		    <td align="left" style="border: 1px solid #98bf21;"  width="75%"><input name ="mNo" type="text" value="<%=sessionDTO.getmNo() %>" readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">mID  </td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mId" type="text" value="<%=sessionDTO.getmId() %>" readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">mPW</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mPw" type="hidden" value="<%=sessionDTO.getmPw() %>" readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">KOR NAME</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mKorName" type="text" value="<%=sessionDTO.getmKorName() %>" readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">LAST NAME</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mEngLastName" type="text" value="<%=sessionDTO.getmEngLastName() %> "readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MID NAME</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mEngMidName" type="text" value="<%=sessionDTO.getmEngMidName() %>"readonly /></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">SEX</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mSex" type="text" value="<%=sessionDTO.getmSex() %>"readonly/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">ADDR</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mAddress" type="text" value="<%=sessionDTO.getmAddress() %>"/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">Moblie</td>	
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mMobilePhone" type="text" value="<%=sessionDTO.getmMobilePhone() %>"/></td>
		  </tr> 
		  <tr style="font-size: 10pt;height: 30px;background-color:#EAF2D3;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MAIL</td>
		    <td align="left"  style="border: 1px solid #98bf21;"  width="75%"><input name="mEmail" type="text" value="<%=sessionDTO.getmEmail() %>"/></td>
		  </tr>
		  <tr style="font-size: 10pt;height: 30px;background-color:#ffffff;">
		    <td style="border: 1px solid #98bf21;"  width="25%" align="right">MILEAGE</td>
		    <td align="left"   style="border: 1px solid #98bf21;" width="75%"><input name="mMileage" type="text" value="<%=sessionDTO.getmMileage() %>" readonly/></td>
		  </tr>
		  <tr>
		  	<td colspan="2">
		  	<input type="submit" value="수정하기">
		  	<input type="reset" value="초기화">
		  	</td>
		  </tr>
		</table>
	</form>
</body>
</html>