package NET.WUA.SCHEDULE.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class SuperManAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
System.out.println("111");

		ActionForward forward= new ActionForward();
		
System.out.println("222");

		SchDao schdao = new SchDao();
		List superlist = new ArrayList();
		
System.out.println("333");

		String schSuper1 = request.getParameter("schDepartDate"); 
		String schSuper2 = request.getParameter("schDeparture"); 
		String schSuper3 = request.getParameter("schArrival"); 

		String schSuper9 = request.getParameter("schDepartDate2"); 
		
		superlist = schdao.getSuperMan(schSuper1, schSuper2, schSuper3 ,schSuper9); //
		
		System.out.println("execute()::Date/Departure/Arrival = " + schSuper1 +"/" + schSuper2 +"/" + schSuper3+"/" + schSuper9);
		System.out.println("superlist.size() = " + superlist.size());
   		//request.setAttribute("superlist", superlist);
   		
   		HttpSession session=request.getSession();
		session.setAttribute("schList", superlist);
		
		System.out.println("session schList check = " + session.getAttribute("schList"));
   		
//   		//Session
//		MemberDao memberdao=new MemberDao();
//		MemberBean memberdata=new MemberBean();
//		boolean result = false;
//		
//		result = memberdao.MemberUpdate(memberdata);
//		MemberBean saveDTO = memberdao.saveSession(memberdata);
//		HttpSession session=request.getSession();
//		session.setAttribute("session_member", saveDTO);
   			
		//Forward
	   	forward.setRedirect(true);
   		forward.setPath("Reservation_domestic_result.jsp");
   		return forward;

	}//subend

}//end