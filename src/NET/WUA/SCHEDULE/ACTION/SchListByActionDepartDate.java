package NET.WUA.SCHEDULE.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class SchListByActionDepartDate implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
System.out.println("111");

		ActionForward forward= new ActionForward();
		
System.out.println("222");

		SchDao schdao = new SchDao();
		List departdatelist = new ArrayList();
		
System.out.println("333");

		String schDepartDate = request.getParameter("schDepartDate"); 
		System.out.println("355");
		departdatelist = schdao.getSchListByDepartDate(schDepartDate); //
		
System.out.println("444");		
   		request.setAttribute("departdatelist", departdatelist);
   		
   		//Session
		MemberDao memberdao=new MemberDao();
		MemberBean memberdata=new MemberBean();
		boolean result = false;
		
		result = memberdao.MemberUpdate(memberdata);
		MemberBean saveDTO = memberdao.saveSession(memberdata);
		HttpSession session=request.getSession();
		session.setAttribute("session_member", saveDTO);
   		
		//Forward
	   	forward.setRedirect(false);
   		forward.setPath("./SchListByDepartDate.jsp");
   		return forward;

	}//subend

}//end