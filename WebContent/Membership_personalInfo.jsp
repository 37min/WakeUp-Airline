<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%@page import="NET.WUA.MEMBER.DB.MemberBean"%>

<%
		MemberBean sessionDTO = null;
		sessionDTO = (MemberBean) session.getAttribute("session_member");
		
		String sessionId = "";
		
		if( sessionDTO != null )
		{
			sessionId = sessionDTO.getmId();
		}
		else
			System.out.println("SessionDTO is null");
		
		System.out.println("sessionId is " + sessionId);
%>
</head>
<body>
<center>
<!-- Menu Area -->
<div style="width:1000px;"><jsp:include page="Menu.jsp" flush="true"/></div>
<!-- Contents Area -->
<div style="width:1000px;">
<div style="float:left; width:180px;padding:10px;border-right: 1px solid #d8d8d8;height: 600px;"><!-- left sub menu area -->
<%
		if( sessionId == null || sessionId.equals("") )
		{
%>
<jsp:include page="member/loginFormMini.jsp" flush="false"/>
<%
		}
		else
		{
%>
<jsp:include page="member/logonMini.jsp" flush="false"/>
<%			
		}
%>
<hr>
<jsp:include page="include/submenu/membership.jsp" flush="true"/>
</div>
<div style="float:left; width: 796px; height: 600px;padding:0 0 0 0px;">
<!-- right contents area -->

<table width="100%">
<tr align="right">
	<td><font color="gray" size="2">홈>회원안내>개인정보취급방침<hr></font></td>
</tr>
<tr align="left">
	<td>
		<table width="680" border="0" cellspacing="0" cellpadding="0">
    <tbody><tr>
        <td>
            본 개인정보처리방침은 ㈜진에어(이하 ‘진에어’라 합니다)이 운영하는 인터넷 웹사이트(www.jinair.com) 및
            <br>
            고객서비스센터를 이용하는 회원 및 비회원(이하“이용자”)의 개인정보보호 및 정보통신망 안정성확보에 대하여 규정하고
            <br>
            있습니다.<br>
            진에어는 수집된 이용자의 개인정보를 보호하고, 불법적인 개인정보유출 및 손해발생을 방지함에 최선의 노력을
            <br>
            다하겠습니다.<br>
            진에어의 개인정보처리방침은 법률의 개정 및 정부지침의 변경 또는 진에어 내부방침의 변경에 따라 바뀔 수 있으므로
            <br>
            이용자께서는 수시로 확인하여 주시기 바랍니다.<br>
            <br>
        </td>
    </tr>
    <tr>
        <td>
            <table width="100%" border="0" cellspacing="0" cellpadding="3">
                <tbody><tr>
                    <td width="4%" height="27" align="center">
                        <img src="/images/Body_sub_bul01.gif" width="15" height="15"></td>
                    <td width="96%" class="Mpurple">
                        개인정보의 보호
                    </td>
                </tr>
                <tr>
                    <td height="50" align="right" valign="top">
                        <strong>가</strong>.</td>
                    <td>
                        <strong>수집하는 개인정보 항목</strong>
                        <br>
                        수집하는 개인정보는 다음과 같습니다.</td>
                </tr>
                <tr>
                    <td height="52">
                    </td>
                    <td>
                        &lt; 회원가입 시 &gt;<br>
                        필수정보<br>
                        아이디(ID), 비밀번호, 성명(한글 및 영어), 생년월일, 성별, 휴대전화번호, 이메일, 이메일 수신여부, SMS 수신여부<br>
                        <br>
                        선택정보<br>
                        주소, 유선전화번호, 기업우대프로그램 회원가입여부</td>
                </tr>
                <tr>
                    <td height="89">
                        &nbsp;</td>
                    <td>
                        &lt; 항공권 구매 시 &gt;<br>
                        항공권 구매 등 당사의 유상 상품 및 서비스에 대한 대금결제 시에는 다음과 같은 추가정보가 필요합니다.<br>
                        i) 카드결제의 경우 : 카드번호, 유효기간, 카드비밀번호 등<br>
                        ii) 계좌이체의 경우 : 입금자명, 환불시 입금 계좌번호<br><br>
                        또한 국제선 항공권의 경우 여권번호, 여권유효기간 및 여권발행국가 등의 추가정보가 수집될 수 있습니다.</td>
                </tr>
                <tr>
                    <td height="58">
                        &nbsp;</td>
                    <td>
                        &lt; 기타 설문조사, 이벤트 참가 시 &gt;<br>
                        아이디, 성명, 주소, 연락처(전화번호 혹은 e-mail)</td>
                </tr>
                <tr>
                    <td height="76">
                        &nbsp;</td>
                    <td>
                        &lt; 자동으로 생성되는 개인정보 &gt;<br>
                        또한 서비스 이용과정이나 정보처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.<br>
                        - 서비스 이용기록, 접속 로그, 쿠키, 접속 IP 정보, 결제기록 등</td>
                </tr>
                <tr>
                    <td height="49" align="right" valign="top">
                        <strong>나</strong>.</td>
                    <td>
                        <strong>개인정보 수집 방법</strong><br>
                        진에어는 다음과 같은 방법으로 개인정보를 수집합니다.</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        i) 홈페이지
                        <br>
                        ii) 생성정보 수집 툴을 통한 수집
                        <br>
                        iii) 고객서비스센터를 통해 항공권 예약 및 구매하는 경우</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>다</strong>.</td>
                    <td>
                        <strong>개인정보의 수집 및 이용목적 </strong>
                    </td>
                </tr>
                <tr>
                    <td height="56">
                        &nbsp;</td>
                    <td>
                        진에어는 이용자의 동의가 있거나 법령의 규정에 의한 경우를 제외하고는 본조에서 고지한 범위를 넘어 이용자의 개인정보를 이용하지 않습니다.</td>
                </tr>
                <tr>
                    <td height="57">
                        &nbsp;</td>
                    <td>
                        &lt; 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 &gt;<br>
                        콘텐츠 제공, 항공편 예약ㆍ구매, 결제, 금융거래 본인 인증 및 금융 서비스, 요금추심</td>
                </tr>
                <tr>
                    <td height="72">
                        &nbsp;</td>
                    <td>
                        &lt; 회원관리 &gt;<br>
                        회원제 서비스 이용에 따른 본인확인, 개인식별, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 가입 및 가입횟수 제한, 분쟁
                        조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달</td>
                </tr>
                
                <tr>
                    <td align="right" valign="top">
                        <strong>라</strong>.</td>
                    <td>
                        <strong>개인정보 수집 동의거부 사항 </strong>
                    </td>
                </tr>
                <tr>
                    <td height="72">
                        &nbsp;</td>
                    <td>
                        진에어는 보다 원활한 서비스 제공을 위해 필수정보 이외의 선택정보(주소, 유선전화번호, 기업우대프로그램 가입여부)를 수집하고 있습니다. 선택정보는
                        서비스 제공시 활용되는 정보로 제공을 원하지 않을 경우 수집하지 않으며, 미동의(미입력)로 인해 이용상의 불이익도 발생하지 않습니다.
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>마</strong>.</td>
                    <td>
                        <strong>개인정보 제3자 제공</strong>
                    </td>
                </tr>
                <tr>
                    <td height="118">
                        &nbsp;</td>
                    <td>
                        진에어는 법령에 근거가 있는 등의 예외적인 경우를 제외하고 이용자의 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만 제휴사, 후원사 등에
                        이용자의 개인정보를 제공할 수 있으나, 이는 이용자 개개인께 최적/양질의 서비스를 제공하기 위한 목적으로만 행해지는 것이고, 그 경우에도 제공받는
                        자, 제공받는 자의 이용 목적, 제공할 정보의 내용, 제공받는 자의 개인정보보유 및 이용기간을 전자우편이나 서면으로 개별 통지하거나, 또는 인터넷
                        사이트에 명시하여 이용자의 동의 (예:마우스 클릭)를 받도록 하겠습니다.</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>바</strong>.</td>
                    <td>
                        <strong>수집한 개인정보 취급위탁 </strong>
                    </td>
                </tr>
                <tr>
                    <td height="37">
                        &nbsp;</td>
                    <td>
                        진에어는 계약의 이행 및 서비스 제공을 위해 다음과 같이 개인정보 취급 업무를 위탁하여 운영하고 있습니다.</td>
                </tr>
                <tr>
                    <td height="141">
                        &nbsp;</td>
                    <td>
                        - 한진정보통신㈜ : 웹 서버 및 데이터베이스 등 전산 자원과 홈페이지 프로그램 개발 및 유지ㆍ보수 아웃소싱
                        <br>
                        - KICC(한국정보통신주식회사), KSNET(케이에스넷) : 항공권 구매 등 당사의 유상 상품 및 서비스에 대한 대금결제 업무
                        <br>
                        - 서울신용평가㈜ : 아이핀
                        <br>
                        - 한국모바일인증㈜ : 휴대전화 인증 
                        <br>
                        - 에이메일(주) : EMAIL, SMS 전송업무
                        <br>
                        - 유니컨버스, 효성 ITX : 고객서비스센터
                        <br>
                        - AK코리아 : 공항 수속 업무
                        <br>
                        - Amadeus IT Group S.A. : 국제선 예약발권 서비스
                        <br>
                        - 우체국택배, 한진택배 등 택배사 : 물품, 경품 배송 업무
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>사</strong>.</td>
                    <td>
                        <strong>개인정보의 보유 및 이용기간 </strong>
                    </td>
                </tr>
                <tr>
                    <td height="60">
                        &nbsp;</td>
                    <td>
                        이용자의 동의 하에 수집된 개인정보는 이용자가 진에어 인터넷 웹사이트상의 서비스를 이용하는 동안 보유ㆍ이용됩니다. 당사는 아래와 같이 개인정보의
                        수집 및 이용 목적이 달성된 때 수집된 개인정보를 지체 없이 파기하겠습니다.</td>
                </tr>
                <tr>
                    <td height="175">
                        &nbsp;</td>
                    <td>
                        - 회원 가입 정보의 경우 : 회원 탈퇴 요청이 있거나 회원 자격을 상실한 때
                        <br>
                        - 설문조사, 이벤트 등 일시적 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등이 종료한 때
                        <br>
                        - 사업을 폐지하는 경우
                        <br>
                        다만, 개인정보의 수집 및 이용 목적이 달성된 경우에도 상법, 전자상거래 등에서의 소비자 보호에 관한 법률 등 관계법령의 규정에 의하여 보존할
                        필요성이 있는 경우 및 사전에 보유기간을 이용자에게 고지하거나 명시한 경우 등은
                        <br>
                        그에 따라 개인정보를 보관할 수 있습니다.<br>
                        - 계약 또는 청약철회 등에 관한 기록, 대금 결제 및 재화 등의 공급에 관한 기록
                        <br>
                        &nbsp; 보존 사유 : 전자상거래 등에서의 소비자 보호에 관한 법률 보존 기간 : 5년<br>
                        - 소비자의 불만 또는 분쟁 처리 기록
                        <br>
                        &nbsp; 보존 사유 : 전자상거래 등에서의 소비자 보호에 관한 법률
                        <br>
                        &nbsp; 보존 기간 : 3년
                        <br>
                        개인정보를 보존하려고 하는 경우 사전에 그 보존근거 및 보존하는 개인정보 항목을 전자우편이나 서면으로 개별통지하거나 인터넷 사이트에 명시하여 이용자의
                        동의(예: 마우스클릭)를 받도록 하겠습니다.</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>아</strong>.</td>
                    <td>
                        <strong>개인정보의 파기절차</strong>
                    </td>
                </tr>
                <tr>
                    <td height="60">
                        &nbsp;</td>
                    <td>
                        진에어는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다.<br>
                        파기절차 및 방법은 다음과 같습니다.</td>
                </tr>
                <tr>
                    <td height="140">
                        &nbsp;</td>
                    <td>
                        - 파기절차
                        <br>
                        회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(개인정보의 보유 및 이용기간
                        참조) 일정 기간 저장된 후 파기되어집니다.<br>
                        - 파기방법
                        <br>
                        종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기하고, 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을
                        사용하여 삭제합니다.</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>자</strong>.</td>
                    <td>
                        <strong>이용자 권리와 그 행사방법</strong>
                    </td>
                </tr>
                <tr>
                    <td height="122">
                        &nbsp;</td>
                    <td>
                        이용자는 언제든지 진에어이 수집ㆍ보관 중인 개인정보의 열람을 요구하거나 개인정보에 오류가 있는 경우 그 정정을 요구할 수 있으며, 개인정보의 수집,
                        이용, 제공 등에 대한 동의를 철회할 수 있습니다.<br>
                        이용자는 당사 인터넷 웹사이트(www.jinair.com)상에서 직접 본인의 개인정보를 열람ㆍ정정하거나 개인정보수집 및 이용에 대한 동의를 철회할
                        수 있으며 서면ㆍ전화ㆍQ&amp;A를 이용하여 개인정보의 열람ㆍ정정 또는 동의철회를 요청할 수 있습니다. 이 경우 당사는 본인여부 확인 후 필요한
                        조치를 취해드리겠습니다.</td>
                </tr>
                <tr>
                    <td height="73">
                        &nbsp;</td>
                    <td>
                        &lt;개인정보 조회, 수정 및 철회 방법&gt;<br>
                        당사 인터넷 웹사이트에 로그인 후 ‘회원정보변경’을 클릭하여 정보조회가 가능하며, 해당 페이지의 ‘회원정보변경’, ‘회원탈퇴’ 버튼을 클릭하여
                        정보의 수정 및 철회(가입해지)가 가능합니다.</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>차</strong>.</td>
                    <td>
                        <strong>이용자의 의무</strong></td>
                </tr>
                <tr>
                    <td height="205">
                        &nbsp;</td>
                    <td>
                        - 이용자는 개인정보를 최신의 상태로 정확하게 입력하여 불의의 사고를 예방해 주시기 바랍니다. 이용자가 입력한 부정확한 정보로 인해 발생하는 사고의
                        책임은 이용자 자신에게 있으며 타인 정보의 도용 등 허위정보를 입력할 경우 회원자격이 상실될 수 있습니다.
                        <br>
                        - 이용자는 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 비밀번호를 포함한 본인의 개인정보가
                        유출되지않도록 조심하시고 타인의 개인정보를 훼손하지 않도록 유의해 주십시오. 만약 이 같은 책임을 다하지 못하고 타인의 정보를 훼손할 시에는 『정보통신망이용촉진및정보보호등에관한법률』등에
                        의해 처벌받을 수 있습니다.
                        <br>
                        - 이용자가 타인의 개인정보를 도용하여 회원가입등을 하였음을 알게 된 때에는 지체 없이 해당 아이디에 대해 필요한 조치를
                        취합니다.
                    </td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>카</strong>.</td>
                    <td>
                        <strong>개인정보 자동 수집 장치의 설치, 운영 및 그 거부에 관한 사항</strong>
                    </td>
                </tr>
                <tr>
                    <td height="99">
                        &nbsp;</td>
                    <td>
                        진에어는 귀하의 정보를 수시로 저장하고 찾아내는 ‘쿠키(Cookie)’ 를 사용하여 개인정보를 자동으로 수집하는 장치를 설치, 운용합니다. 쿠키란
                        진에어의 웹사이트를 운영하는데 이용되는 서버가 귀하의 브라우저에 보내는 아주 작은 텍스트 파일로서 귀하의 컴퓨터 하드디스크에 저장됩니다.<br>
                        쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다.</td>
                </tr>
                <tr>
                    <td height="140">
                        &nbsp;</td>
                    <td>
                        진에어는 다음과 같은 목적을 위해 쿠키를 사용합니다.<br>
                        i) 회원 인증
                        <br>
                        ii) 접속 빈도나 방문 시간 분석, 자취 추적 및 방문 회수 파악 등을 통한 홈페이지 사용성 개선 및 마케팅 활용
                        <br>
                        귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 웹브라우저 상단의 도구 &gt; 인터넷옵션 탭에서 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다
                        확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다. 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수
                        있습니다.</td>
                </tr>
                <tr>
                    <td align="right" valign="top">
                        <strong>타</strong>.</td>
                    <td>
                        <strong>개인정보 보호책임자</strong></td>
                </tr>
                <tr>
                    <td height="94">
                        &nbsp;</td>
                    <td>
                        진에어의 개인정보 보호책임자는 아래와 같습니다.<br>
                        - 소속 : 온라인마케팅팀
                        <br>
                        - 성명 : 김진옥 팀장
                        <br>
                        - 일반 문의 : ☎ 1600-6200 / help@jinair.com (근무시간: 월-금요일 09:00~17:00 주말/공휴일 휴무)</td>
                </tr>
                <tr>
                    <td height="60">
                        &nbsp;</td>
                    <td>
                        상기 책임자는 회원님의 개인정보보호에 만전을 기하여 회원님께서 진에어 인터넷사이트를 마음 놓고 이용하실 수 있도록 최선을 다하겠습니다.</td>
                </tr>
                <tr>
                    <td align="center">
                        <img src="/images/Body_sub_bul01.gif" width="15" height="15"></td>
                    <td>
                        <strong>개인정보관련 불만 처리에 관한 사항</strong></td>
                </tr>
                <tr>
                    <td height="79">
                        &nbsp;</td>
                    <td>
                        이용자는 개인정보와 관련하여 아래의 방법으로 문의 및 불만 처리의 요구를 하실 수 있으며, 진에어는 접수 즉시 조치하고 그 처리 결과를 통보해
                        드리겠습니다.<br>
                        인터넷 : 홈페이지 내의 "Q&amp;A(1:1 고객문의)"을 통하여 접수<br>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <img src="/images/Body_sub_bul01.gif" width="15" height="15"></td>
                    <td>
                        <strong>기술적, 관리적 대책</strong></td>
                </tr>
                <tr>
                    <td height="137">
                        &nbsp;</td>
                    <td>
                        진에어는 이용자의 개인정보보호를 위한 기술적 대책으로서 여러 보안장치를 마련하고 있습니다. 이용자께서 보내시는 모든 정보는 이중방화벽장치에 의해
                        보호되는 보안시스템에 안전하게 보관/관리되고 있으며 중요 데이터는
                        <br>
                        암호화하는 별도의 보안기능으로 보호하고 있습니다.
                        <br>
                        또한 진에어는 이용자의 개인정보보호를 위한 관리적 대책으로서 이용자의 개인정보에 대한 접근 및 관리에 필요한 절차를 마련하고, 이용자의 개인정보를
                        취급하는 인원을 최소한으로 제한하여 지속적인 보안교육을 실시하고 있습니다. 또한 개인정보를 처리하는 시스템의 사용자를 지정하여 사용자 비밀번호를
                        부여하고 이를 정기적으로 갱신하겠습니다.</td>
                </tr>
                <tr>
                    <td align="center">
                        <img src="/images/Body_sub_bul01.gif" width="15" height="15"></td>
                    <td>
                        <strong>개인정보 처리방침의 시행 및 개정 관련 사항</strong></td>
                </tr>
                <tr>
                    <td height="102">
                        &nbsp;</td>
                    <td>
                        진에어는 대한민국의 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 신용정보의 이용 및 보호에 관한 법률, 전자거래기본법, 전자거래소비자보호지침
                        등 개인정보보호 관련법규를 준수합니다. 따라서 진에어의 개인정보처리방침은 대한민국 관련법규개정 및 정부지침의 변경으로 인하여 그 내용이 변경될
                        수 있습니다.<br>
                        개인정보처리방침 개정시에는 개정일자, 개정이유, 개정내용 등을 인터넷 웹사이트에 공시하겠습니다.</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        - 진에어의 인터넷 회원 개인정보처리방침은 2008년 6월 15일부터 시행합니다.<br>
                        - 개인정보처리방침 버전 번호 : v2.2<br>
                        - 개인정보처리방침 시행 일자 : 2008.06.15<br>
                        - 2010년 7월 14일 개정 : 수집 목적, 방법 및 보호에 대한 최신 내용 업데이트<br>
                        - 2011년 9월 30일 개정 : 개인정보보호법 제정에 따른 ‘개인정보처리방침’ 및 ‘개인정보 보호책임자’의 명칭 변경,&nbsp;<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;수집하는
                        개인정보 항목 분류, 개인정보 수집 동의거부 사항 조항 추가,&nbsp;<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;개인정보
                        취급업체 추가<br>
                        - 2013년 1월 11일 개정 : 개인정보 보호책임자 변경<br>
                        - 2013년 2월 13일 개정 : 수집 항목 및 취급업체 수정, 개인정보 보호책임자 변경</td>
                </tr>
            </tbody></table>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</tbody></table>
    </td>
</tr>
</table>
</div>
</div>
</center>
</body>
</html>