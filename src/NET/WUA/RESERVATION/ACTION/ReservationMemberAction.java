package NET.WUA.RESERVATION.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.RESERVATION.DB.ReservationDao;
import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class ReservationMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		ReservationDao reservationDao	= new ReservationDao();
		
		boolean isReservationSuccess = false;
		
		String memberId 	= request.getParameter("reservation_memberId");
		String schNo 		= request.getParameter("reservation_schNo"); 
		
		isReservationSuccess = reservationDao.ReserveTicket(memberId, schNo); //
		
		if( isReservationSuccess )
		{
			//isReservationSuccess : true
			//Todo : FlightSchedule table has to be modify. 
			SchDao schDao = new SchDao();
			boolean isUpdateScheduleSuccess = false;
			
			isUpdateScheduleSuccess = schDao.updateScheduleSeatNumber(schNo);
			
			if( isUpdateScheduleSuccess )
			{
				forward.setRedirect(false);
		   		forward.setPath("Mypage_reservationlist.jsp");
			}
			else
			{
				//예약 실패
				forward.setRedirect(false);
		   		forward.setPath("Reservation_domestic.jsp");
			}
		}
		else
		{
			//isReservationSuccess : false
			//예약 실패
			forward.setRedirect(false);
	   		forward.setPath("Reservation_domestic.jsp");
		}
		
   		return forward;
	}

}