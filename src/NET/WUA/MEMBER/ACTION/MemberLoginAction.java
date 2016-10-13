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
		   		out.println("alert('�н����尡 ��ġ���� �ʽ��ϴ�.');");
		   		out.println("location.href='./MemberLogin.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
	   		}else if(result==-1){
	   			response.setContentType("text/html;charset=euc-kr");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('���Ե��� ���� ���̵��Դϴ�.');");
		   		out.println("location.href='./MemberLogin.me';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
		   	}
	   		
	   		MemberBean saveDTO = memberdao.saveSession(member); //���ǰ� �����ϱ����� ����Ʈ �Լ�.
	   		session.setAttribute("session_member", saveDTO);
	   		
	   		//request.getSession().setAttribute("session_member", saveDTO);
	   		System.out.println("saveDTO's mID is " + saveDTO.getmId());
	   		
	   		//is����� ���� �ϵ���
	   		//DAO���� ����Ʈ �ϰ� ���� ���� ����.
	   		
	   		forward.setRedirect(true);
	   		//forward.setPath("logged.me");
	   		forward.setPath("loginSucess.me");
	   		return forward;
	}
}