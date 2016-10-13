package NET.WUA.RESERVATION.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.RESERVATION.DB.ReservationBean;
import NET.WUA.RESERVATION.DB.ReservationDao;
import NET.WUA.RESERVATION.ACTION.ActionForward;

public class ReservSaveAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 throws Exception{
			request.setCharacterEncoding("euc-kr");
			ActionForward forward = new ActionForward();
			 	
			 	HttpSession session=request.getSession();
			 	ReservationBean reservation = new ReservationBean();
			 	ReservationDao reservationdao = new ReservationDao();
			 	
			 	int schNo = Integer.parseInt(request.getParameter("SchNo"));
			 	String memberid = (String)(request.getParameter("memberID"));
		   		System.out.println(schNo);
		   		System.out.println(memberid);
		   		reservationdao.insert(schNo, memberid, reservation);
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("ReservCheckForm.jsp");
		   		return forward;

	}
}