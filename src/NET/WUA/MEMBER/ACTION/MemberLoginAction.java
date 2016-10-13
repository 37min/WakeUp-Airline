package NET.WUA.MEMBER.ACTION;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.MEMBER.ACTION.ActionForward;
import NET.WUA.MEMBER.DB.MemberBean;
import NET.WUA.MEMBER.DB.MemberDao;

public class MemberLoginAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	ActionForward forward = new ActionForward();
		 	
		 	HttpSession session=request.getSession();
			MemberDao memberdao=new MemberDao();
	   		MemberBean member=new MemberBean();
	   		
	   		int result=-1;
	   		
	   		member.setmId(request.getParameter("user_id"));
	   		member.setmPw(request.getParameter("user_pw"));
	   		result=memberdao.isMember(member);

	   		System.out.println(member.getmId());
	   		System.out.println(member.getmPw());
	   		
	   		
	   		if(result==0){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('패스워드가 일치하지 않습니다.');");
		   		out.println("location.href='./MemberLogin.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
	   		}else if(result==-1){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('가입되지 않은 아이디입니다.');");
		   		out.println("location.href='./MemberLogin.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
	   		
	   		MemberBean saveDTO = memberdao.saveSession(member); //세션값 저장하기위한 셀렉트 함수.
	   		session.setAttribute("session_member", saveDTO);
	   		
	   		//request.getSession().setAttribute("session_member", saveDTO);
	   		System.out.println("saveDTO's mID is " + saveDTO.getmId());
	   		
	   		//is멤버로 검증 하듯이
	   		//DAO에서 셀렉트 하고 세션 값에 저장.
	   		
	   		forward.setRedirect(true);
	   		//forward.setPath("logged.me");
	   		forward.setPath("loginSucess.me");
	   		return forward;
	}
}