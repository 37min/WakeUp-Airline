package NET.WUA.RESERVATION.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.RESERVATION.DB.ReservationDao;
import NET.WUA.RESERVATION.ACTION.ActionForward;

public class ReservCancelAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 throws Exception{
			request.setCharacterEncoding("euc-kr");
			ActionForward forward = new ActionForward();
			 	System.out.println("ReservCancelAction");
			 	HttpSession session=request.getSession();
				
			 	ReservationDao reservationdao = new ReservationDao();
				List reservlist = new ArrayList();
				
		   		int RNO = Integer.parseInt(request.getParameter("reservation_reservNo"));
		   		int schNo = Integer.parseInt(request.getParameter("reservation_schNo"));
		   		
		   		reservationdao.updateReservationByRno(RNO, schNo);
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("Mypage_reservationlist.jsp");
		   		return forward;
		}
}
