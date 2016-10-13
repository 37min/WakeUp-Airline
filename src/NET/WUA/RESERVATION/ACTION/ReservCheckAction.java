package NET.WUA.RESERVATION.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.MEMBER.DB.MemberBean;
import NET.WUA.RESERVATION.DB.ReservationDao;
import NET.WUA.RESERVATION.DB.ReservationResultBean;
import NET.WUA.RESERVATION.ACTION.ActionForward;

public class ReservCheckAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
		 throws Exception{
			request.setCharacterEncoding("euc-kr");
			ActionForward forward = new ActionForward();
			 	
			 	HttpSession session=request.getSession();
				
			 	ReservationDao reservationdao = new ReservationDao();
			 	ArrayList<ReservationResultBean> reservlist = new ArrayList<ReservationResultBean>();
		   	
				MemberBean sessionDTO = null;
				sessionDTO = (MemberBean) session.getAttribute("session_member");
				
				String rmemberID = "";
				
				if( sessionDTO != null )
				{
					rmemberID = sessionDTO.getmId();
				}
				
				reservlist = reservationdao.getMyReservationInfoList(rmemberID, false);
				
		   		session.setAttribute("myReservationList", reservlist);
		   		
		   		forward.setRedirect(false);
		   		forward.setPath("Mypage_reservationlist_result.jsp");
		   		
		   		return forward;
		}
}
