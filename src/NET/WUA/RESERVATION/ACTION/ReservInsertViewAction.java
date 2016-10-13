package NET.WUA.RESERVATION.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class ReservInsertViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		SchDao schdao = new SchDao();
		List superlist = new ArrayList();
		
		String memberID = request.getParameter("RMEMBER_ID");
		String schSuper1 = request.getParameter("date"); 
		String schSuper2 = request.getParameter("departure"); 
		String schSuper3 = request.getParameter("arrival"); 
		String schSuper4 = request.getParameter("departure"); 
		System.out.println(schSuper1);
		System.out.println(schSuper2);
		System.out.println(schSuper3);
		System.out.println(memberID);
		
		superlist = schdao.getSuperMan(schSuper1, schSuper2, schSuper3,schSuper4); //
			
   		request.setAttribute("superlist", superlist);
   		request.setAttribute("memberID", memberID);
   		
	   	forward.setRedirect(false);
   		forward.setPath("SuperManReserv.jsp");
   		return forward;

	}

}