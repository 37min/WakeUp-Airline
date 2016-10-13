package NET.WUA.MEMBER.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.MEMBER.ACTION.ActionForward;
import NET.WUA.MEMBER.DB.MemberBean;
import NET.WUA.MEMBER.DB.MemberDao;

public class MemberJoinAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	request.setCharacterEncoding("euc-kr");
		 	ActionForward forward = new ActionForward();
		 	
			MemberDao memberdao=new MemberDao();
			System.out.println("DAO");
	   		MemberBean member=new MemberBean();
	   		boolean result=false;
	   		System.out.println(request.getParameter("MEMBER_ID"));
	   		
	   		member.setmId(request.getParameter("MEMBER_ID"));
	   		member.setmPw(request.getParameter("MEMBER_PW"));
	   		member.setmKorName(request.getParameter("MEMBER_NAME"));
	   		member.setmEngLastName(request.getParameter("MEMBER_ENGLAST"));
	   		member.setmEngMidName(request.getParameter("MEMBER_ENGMID"));
	   		
	   		member.setmSex(Integer.parseInt(request.getParameter("MEMBER_SEX")));
	   		member.setmAddress(request.getParameter("MEMBER_ADDR"));
	   		member.setmMobilePhone(request.getParameter("MEMBER_PHONE"));
	   		member.setmEmail(request.getParameter("MEMBER_EMAIL"));
	   		//member.setmMileage(10000);
	   		
	   		
	   		result=memberdao.joinMember(member);
	   		
	   		if(result==false){
		   		return null;
		   	}
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("MemberLogin.me");
	   		return forward;
	}
}