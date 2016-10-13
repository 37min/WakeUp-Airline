package NET.WUA.ADMIN.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.SCHEDULE.DB.SchBean;

import NET.WUA.MEMBER.DB.*;

public class AdminSchListAction2 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();
		
		SchDao schdao = new SchDao();
		ArrayList<SchBean> schlist = new ArrayList();
		
		schlist = schdao.getSchList();
		
		//받은 결과를 schlist에 답기
		request.setAttribute("schlist", schlist); 
		
		//Forward
		forward.setRedirect(false);
		forward.setPath("Insert_Flight_result3.jsp");
		return forward;

	}//subend

}//end
