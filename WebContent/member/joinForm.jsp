<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ������</title>

  <script src="http://code.jquery.com/jquery-1.3.2.min.js" ></script>
   <!-- jQuery.validate �÷����� ���� -->
   <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.0/jquery.validate.min.js" ></script>
   <script type="text/javascript">
                   
      $(document).ready(function () {          
        // validate the comment form when it is submitted
        // �⺻�ɼ�
        $('#joinform').validate(); //��ȿ�� �˻縦 ����
   
      }); //end ready()
 
    </script>
 

<style type="text/css">
#joinTb {
	font-family: "����", "Dotum";
	font-size: 12px;
}

#grd {
	background-image: -moz-linear-gradient(0% 22px 90deg, #555, #999);
	background-image: -webkit-gradient(linear, 0% 0%, 0% 70%, from(#999),
		to(#5b9f9e));
	color: #FFFFFF;
	/*font-family: "����", "Dotum";*/
	font-size: 17px;
}
</style>
</head>
<body>
	<form name="joinform" id="joinform" action="MemberJoinAction.me" method="post">
		<center>
			<div id="joinTb">
				<table width="456" height="392" border=1 cellpadding="5"
					cellspacing="0">
					<tr>
						<td colspan="2" align=center id="grd"><b>ȸ������ ������</b></td>
					</tr>
					<tr>
						<td width="79">ȸ��ID :</td>
						<td width="351"><input type="text" name="MEMBER_ID" id="MEMBER_ID" class="required" /></td>
					</tr>
					<tr>
						<td>��й�ȣ :</td>
						<td><input type="password" name="MEMBER_PW" id="MEMBER_PW" class="required"/></td>
					</tr>

					<tr>
						<td>�ѱ��̸� :</td>
						<td><input type="text" name="MEMBER_NAME" id="MEMBER_NAME" class="required"/></td>
					</tr>
					<tr>
						<td>�����̸� :</td>
						<td><input name="MEMBER_ENGLAST" type="text" value="Last Name" size="14" /> 
							<input name="MEMBER_ENGMID" type="text" value="First Name" size="14" /></td>
					</tr>

					<tr>
						<td>���� :</td>
						<td><input type="radio" name="MEMBER_SEX" value="0" checked />����
							<input type="radio" name="MEMBER_SEX" value="1" />����</td>
					</tr>

					<tr>
						<td>�ּ� :</td>
						<td><input type="text" name="MEMBER_ADDR" size=30 class="required"/></td>
					</tr>
					<tr>
						<td>����ȣ�ּ� :</td>
						<td><input type="text" name="MEMBER_PHONE" id="MEMBER_PHONE" size=15 class="required"/></td>
					</tr>
					<tr>
						<td>�̸��� �ּ� :</td>
						<td><input type="text" name="MEMBER_EMAIL" size=30 class="required"/></td>
					</tr>
					<tr>
						<td colspan="2">
						<input type="submit" value="ȸ������">
						<input type="reset" value="�ٽ��Է�">
						</td>
						
						<!-- <a href="javascript:joinform.submit()"> 
						<img src="./include/images/bt1.gif" /></a>
						&nbsp;&nbsp; 
							
						<a href="javascript:joinform.reset()">
						<img src="./include/images/bt2.gif" /></a>-->
					</tr>

				</table>
			</div>
		</center>
	</form>
</body>
</html>