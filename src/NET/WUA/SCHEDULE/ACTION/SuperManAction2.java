package NET.WUA.SCHEDULE.ACTION;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class SuperManAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		
		SchDao schdao = new SchDao();
		List superlist = new ArrayList();
		
		String schSuper1 = request.getParameter("schDepartDate"); 
		String schSuper9 = request.getParameter("schDepartDate2"); 
		String schSuper2 = request.getParameter("schDeparture"); 
		String schSuper3 = request.getParameter("schArrival"); 

		
		superlist = schdao.getSuperMan(schSuper1, schSuper2, schSuper3 ,schSuper9); //
		
		//Todo. Change to JSON-Type
		StringBuffer jsonStr = new StringBuffer();
		
		jsonStr.append("{\"page\" : \"1\",");
		jsonStr.append("\"total\" : 2,");		
		jsonStr.append("\"records\" : \"11\",");
		jsonStr.append("\"user\" : [");
		
		jsonStr.append("{\"id\":1,\"invdate\":\"2007-10-01\",\"name\":\"test1\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":2,\"invdate\":\"2007-10-01\",\"name\":\"test2\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":3,\"invdate\":\"2007-10-01\",\"name\":\"test3\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":4,\"invdate\":\"2007-10-01\",\"name\":\"test4\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":5,\"invdate\":\"2007-10-01\",\"name\":\"test5\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":6,\"invdate\":\"2007-10-01\",\"name\":\"test6\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":7,\"invdate\":\"2007-10-01\",\"name\":\"test7\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":8,\"invdate\":\"2007-10-01\",\"name\":\"test8\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":9,\"invdate\":\"2007-10-01\",\"name\":\"test9\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":10,\"invdate\":\"2007-10-01\",\"name\":\"test10\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"},"); 
		jsonStr.append("{\"id\":11,\"invdate\":\"2007-10-01\",\"name\":\"test11\",\"note\":\"note\",\"amount\":\"200.00\",\"tax\":\"10.00\",\"total\":\"210.00\"}"); 
			
		jsonStr.append("]}");
		    	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter outer = response.getWriter();  	
		outer.print(jsonStr.toString());
		
		//return null;
		//Forward
	   	forward.setRedirect(true);
   		forward.setPath("Reservation_domestic_result_2.jsp");
   		return forward;

	}//subend

}//end