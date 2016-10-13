<!doctype html>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>jQuery UI Accordion - Default functionality</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css">
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<link rel="stylesheet" href="/resources/demos/style.css">
<script>
  $(function() {
    $( "#accordion" ).accordion();
  });
  </script>
</head>
<body>

<% request.setCharacterEncoding("euc-kr"); %>
	<% request.setCharacterEncoding("euc-kr"); %>
	<div id="accordion">
		<h3>보너스 마일리지가 조금 부족합니다. 부족한 마일리지를 현금으로 구입할 수 있나요?</h3>
		<div>
			<p>마일리지는 현금으로 구입할 수 없습니다. 마일리지는 회원이 항공운임을 지불하고 항공기에 탑승한 경우에 대한
				사은의 뜻으로 항공사가 회원에게 무상으로 제공하는 것 입니다. 따라서 마일리지는 경제적 대가성이 없는 무상의 보너스로 금전
				적으로 환산할 수 없습니다.</p>
		</div>
		<h3>가족합산제도를 신청하면 특정인의 계좌로 마일리지가 합해지나요?</h3>
		<div>
			<p>가족합산제도 즉, "가족 마일리지 합산 보너스제도(Family Plan)"는 보너스 사용 시점에 적립한
				마일리지가 부족한 경우, 부족분의 마일리지를 사전에 등록된 가족 으로부터 제공 받아 보너스를 사용할 수 있는 제도 입니다.
				따라서, "가족 마일리지합산 보너스제도"를 위해 가족등록을 하더라도 각 회원의 탑승 마일리지는 회원 각자의 계좌에 따로
				적립됩니다. 어떠한 경우라도 마일리지는 탑승객 본인의 계좌로만 적립됨을 알려드립니다.</p>
		</div>
		<h3>스카이패스란 무엇인가요?</h3>
		<div>
			<p>스카이패스는 항공여행을 자주하시는 고객분들에게 대한항공 및 제휴사 이용에 대한 사은의 뜻으로 무상으로 마일리지를
				적립해드리고, 항공기의 여유좌석을 이용하여 보너스 혜택을 드리는 상용고객우대제도(Frequent Flyer
				Program)입니다.</p>
		</div>
		<h3>가족 등록사항은 어디서 확인하나요?</h3>
		<div>
			<p>대한항공 영업소나 대한항공 홈페이지에서 고객님의 가족 등록사항을 확인 하실 수 있습니다. 홈페이지에서는 로그인
				후, [스카이패스] - [마이스카이패스] - [가족등록]의 '가족등록 현황' 에서 확인하실 수 있습니다. 등록된 가족의
				잔여마일리지의 조회는 해당 가족이 로그인 후, '마일리지 합산에 동의하기' 메뉴에서 고객님께 합산과 정보 공개에 동의를
				하신 후에 조회해보실 수 있습니다. 자세한 사항은 [스카이패스] - [마이스카이패스] - [가족마일리지 합산] 을
				참고하시기 바랍니다.
			</p>
		</div>
	
</body>
</html>