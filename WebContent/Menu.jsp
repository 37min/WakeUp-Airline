<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" href="include/css/nav.css"/>
<!--[if IE]>
	<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->

</head>

<body class="no-js">

	<div style="width: 1000px; padding: 0 0 0 0px;"> <!-- logo area --> 
		<table width="100%" style="background-image: url(include/images/bg03.jpg);">
			<tr>
				<td width="380px"></td>
				<td rowspan="2"><a href="Index.jsp"><img src="include/fallback/logo08.png"></a></td>
				<td rowspan="2" align="right" valign="top">
<%
				if( sessionId.equals("") || sessionId == null )
				{
%>
					<jsp:include page="include/NotLogonMenu.html" flush="false"/>
<%
				}
				else
				{
%>				
					<jsp:include page="include/LogonMenu.html" flush="false"/>
<%
				}
%>					
				</td>
			</tr>
			<tr>
				<td></td>
			</tr>
		</table>
	</div>
	
	<div style="width:1000px; padding:0 0 0 0px"> <!-- menu area --> 
		<script>
			var el = document.getElementsByTagName("body")[0];
			el.className = "";
		</script>
        <noscript>
        	<!--[if IE]>
            	<link rel="stylesheet" href="include/css/ie.css">
            <![endif]-->
        </noscript>
        <%
				if( sessionId.equals("admin") )
				{
%>
        
      <nav id="topNav">
             <ul>
                <li><a href="Index.jsp">WUA Airline</a></li>
        
            <li><a href="AirlineInfo.jsp">취항노선</a>
               <ul>
                  <li><a href="AirlineInfo.jsp">WUA 취항노선</a></li>
               </ul>
            </li>
            <li><a href="Reservation_domestic.jsp">항공권예매</a>
               <ul>
                  <li><a href="Reservation_domestic.jsp">국내선</a></li>
                  <li><a href="Reservation_domestic_jqgrid.jsp">국제선</a></li>
                 
               </ul>
            </li>
            <li><a href="Membership.jsp">멤버쉽안내</a>
               <ul>
                  <li><a href="Membership.jsp">회원등급안내</a></li>
                  <li><a href="Membership_agreement.jsp">이용약관</a></li>
                  <li><a href="Membership_personalInfo.jsp">개인정보약관</a></li>
               </ul>
            </li>
            <li><a href="ascenter_faq.jsp">고객센터</a>
               <ul>
                  <li><a href="ascenter_faq.jsp">FAQ</a></li>
                  <li><a href="ascenter_qna.jsp">Q&A</a></li>
               </ul>
            </li>
            <li><a href="Company_ceo.jsp">회사소개</a>
               <ul>
                  <li><a href="Company_ceo.jsp">CEO인사말</a></li>
                  <li><a href="Company_abstract.jsp">기업개요</a></li>
                  <li><a href="Company_vision.jsp">기업비전</a></li>
                  <li><a href="Company_apintroduce.jsp">기종소개</a></li>
               </ul>
            </li>
                <li><a href="Insert_Flight.jsp">관리자모드</a>
               <ul>
                  <li><a href="Insert_Flight.jsp">노선추가</a></li>
                  <li><a href="Insert_Flight_result2.jsp">노선조회</a></li>

               </ul>
            </li>
         </ul>
      </nav>
      
      <%
				}
				else
				{
%>	
            
      <nav id="topNav">
             <ul>
                <li><a href="Index.jsp">WUA Airline</a></li>
        
            <li><a href="AirlineInfo.jsp">취항노선</a>
               <ul>
                  <li><a href="AirlineInfo.jsp">WUA 취항노선</a></li>
               </ul>
            </li>
                <li><a href="Reservation_domestic.jsp">항공권예매</a>
               <ul>
                  <li><a href="Reservation_domestic.jsp">국내선</a></li>
                  <li><a href="Reservation_domestic_jqgrid.jsp">국제선</a></li>
               </ul>
            </li>
            <li><a href="Membership.jsp">멤버쉽안내</a>
               <ul>
                  <li><a href="Membership.jsp">회원등급안내</a></li>
                  <li><a href="Membership_agreement.jsp">이용약관</a></li>
                  <li><a href="Membership_personalInfo.jsp">개인정보약관</a></li>
               </ul>
            </li>
            <li><a href="ascenter_faq.jsp">고객센터</a>
               <ul>
                  <li><a href="ascenter_faq.jsp">FAQ</a></li>
                  <li><a href="ascenter_qna.jsp">Q&A</a></li>
               </ul>
            </li>
            <li><a href="Company_ceo.jsp">회사소개</a>
               <ul>
                  <li><a href="Company_ceo.jsp">CEO인사말</a></li>
                  <li><a href="Company_abstract.jsp">기업개요</a></li>
                  <li><a href="Company_vision.jsp">기업비전</a></li>
                  <li><a href="Company_apintroduce.jsp">기종소개</a></li>
               </ul>
            </li>
         </ul>
      </nav>
     <%
				}
%>					
		 
      
	</div>
	<script src="include/js/jquery.js"></script>
        <script src="include/js/modernizr.js"></script>
		<script>
			(function($){
				
				//cache nav
				var nav = $("#topNav");
				
				//add indicator and hovers to submenu parents
				nav.find("li").each(function() {
					if ($(this).find("ul").length > 0) {
						$("<span>").text("^").appendTo($(this).children(":first"));

						//show subnav on hover
						$(this).mouseenter(function() {
							$(this).find("ul").stop(true, true).slideDown();
						});
						
						//hide submenus on exit
						$(this).mouseleave(function() {
							$(this).find("ul").stop(true, true).slideUp();
						});
					}
				});
			})(jQuery);
		</script>
</body>
</html>