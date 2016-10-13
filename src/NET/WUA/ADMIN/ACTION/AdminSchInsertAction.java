package NET.WUA.ADMIN.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.SCHEDULE.DB.SchBean;

import NET.WUA.ADMIN.DB.*;

public class AdminSchInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		
		AdminSchDao adminschdao=new AdminSchDao();
		System.out.println("AdminSchDao");
		AdminSchBean adminschbean=new AdminSchBean();
   		boolean result=false;
   		
   		
   		System.out.println("-------------------");
   		System.out.println(request.getParameter("apname")); //WAL063
   		System.out.println(request.getParameter("schDepartDate")); //2013-12-25
   		System.out.println(request.getParameter("schDepartTime")); //08:00
   		//도착시간
   		String ArrivalTime="";
   		if(request.getParameter("schDepartTime").equals("08:00"))
   		{
   			ArrivalTime="10:00";
   		}else if(request.getParameter("schDepartTime").equals("12:00"))
   		{
   			ArrivalTime="14:25";
   		}else if(request.getParameter("schDepartTime").equals("16:00"))
   		{
   			ArrivalTime="18:25";
   		}else
   		{
   			ArrivalTime="nulllll";
   		}

   		System.out.println(ArrivalTime);
   		System.out.println(request.getParameter("fare"));
   		System.out.println(request.getParameter("seat"));
   		System.out.println(request.getParameter("seatrsv"));
   		System.out.println(request.getParameter("schDeparture"));
   		System.out.println(request.getParameter("schArrival"));
////
   		
   		adminschbean.setpName(request.getParameter("apname"));
   		adminschbean.setpDepartDate(request.getParameter("schDepartDate"));
   		adminschbean.setpDepartTime(request.getParameter("schDepartTime"));
   		adminschbean.setpArrivalTime(ArrivalTime);
   		
   		adminschbean.setpFare(Integer.parseInt(request.getParameter("fare")));
   		adminschbean.setpSeat(Integer.parseInt(request.getParameter("seat")));
   		adminschbean.setpSeatRsv(Integer.parseInt(request.getParameter("seatrsv")));

   		adminschbean.setpDeparture(request.getParameter("schDeparture"));
   		adminschbean.setpArrival(request.getParameter("schArrival"));
   		
   		System.out.println("GOOD _"+adminschbean.getpArrivalTime());
		//insert dao
		

   		result=adminschdao.insFlightSch(adminschbean);

  		if(result==false){
	   		return null;
	   	}
   		
		//Forward
		forward.setRedirect(false);
		forward.setPath("AdminSchList.fp");
		return forward;

	}//subend

}//end
