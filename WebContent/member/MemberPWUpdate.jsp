<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="NET.WUA.MEMBER.DB.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="jss/jquery.validate.js"></script>
<script type="text/javascript">

	$(document).ready(function() {

		$('#updatePWform').validate({
			rules : {
				mPw : {
					required : true
				},
				mPwConfirm : {
					required : true,
					equalTo : '#mPw'
				}
			},
			messages : {
				mPw : {
					required : "비밀번호를 입력하세요"
				},
				mPwConfirm : {
					required : "새비밀번호를 입력하세요",
					equalTo : "비밀번호가 일치하지 않습니다"
				}
			},
			submitHandler : function(frm) {
				frm.submit();
			},
			success : function(e) {
			}
		});
	});
</script>
</head>
<body>

	<%
		MemberBean sessionDTO = null;
		sessionDTO = (MemberBean) session.getAttribute("session_member");

		String sessionId = "";

		if (sessionDTO != null) {
			sessionId = sessionDTO.getmId();
		} else {
			System.out.println("SessionDTO is null");
	%>
	<script>
		location.href = './Index.jsp';
	</script>
	<%
		}
	%>


	<form name="updatePWform" id="updatePWform" action="MemberUpdAction.me"
		method="post">
		<table
			style="width: 500px; border: 1px solid #98bf21; border-collapse: collapse; text-align: center; font-family: 'Trebuchet MS';">
			<tr
				style="font-size: 10pt; border: 1px solid #98bf21; height: 30px; background-color: #EAF2D3;">
				<td colspan="2" align="center"><h3>Change Password</h3></td>
			</tr>
			<tr style="font-size: 10pt; height: 30px; background-color: #ffffff;">
				<td style="border: 1px solid #98bf21;" width="25%" align="right">새
					비밀번호</td>
				<td align="left" style="border: 1px solid #98bf21;" width="75%"><input
					name="mPw" id="mPw" type="text" /></td>
			</tr>
			<tr style="font-size: 10pt; height: 30px; background-color: #EAF2D3;">
				<td style="border: 1px solid #98bf21;" width="25%" align="right">새
					비밀번호 확인</td>
				<td align="left" style="border: 1px solid #98bf21;" width="75%">
				<input
					name="mPwConfirm" id="mPwConfirm" type="text" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정하기"> <input
					type="reset" value="다시입력"></td>
			</tr>
		</table>
		<input name="mNo" type="hidden" value="<%=sessionDTO.getmNo()%>" /> <input
			name="mId" type="hidden" value="<%=sessionDTO.getmId()%>" /> <input
			name="mAddress" type="hidden" value="<%=sessionDTO.getmAddress()%>" />
		<input name="mMobilePhone" type="hidden"
			value="<%=sessionDTO.getmMobilePhone()%>" /> <input name="mEmail"
			type="hidden" value="<%=sessionDTO.getmEmail()%>" />

	</form>
</body>
</html>