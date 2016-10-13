package NET.WUA.SCHEDULE.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.MEMBER.DB.*;

public class SchListByActionSchNo implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		ActionForward forward= new ActionForward();

		SchDao schdao = new SchDao();
		List schnolist = new ArrayList();
		
		int schNo = Integer.parseInt(request.getParameter("schNo")); 
		schnolist = schdao.getSchListBySchNo(schNo); //
		
   		request.setAttribute("schnolist", schnolist);
   		
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
   		forward.setPath("./SchListBySchno.jsp");
   		return forward;

	}//subend

}//end