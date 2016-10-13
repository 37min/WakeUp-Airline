package NET.WUA.BOARD.ACTION;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;

public class BoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		BoardDao boarddao=new BoardDao();
	    //DB占쏙옙占쏙옙 ,,,, select 占쏙옙占쏙옙占쏙옙 占쌍댐옙 占쏙옙체 
		List boardlist=new ArrayList();
		//占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싶몌옙 처占쏙옙占싹깍옙 占쏙옙占싹울옙 占썼열
		
		int page=1;
		int limit=10;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		//占쏙옙占쏙옙微占�占쏙옙청占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙호 처占쏙옙
		//占썩본 1占쏙옙 : View
		//占쌓뤄옙占쏙옙 占십다몌옙 : 占쏙옙청占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙호 
		
		int listcount=boarddao.getListCount(); //占쏙옙 占쏙옙占쏙옙트 占쏙옙占쏙옙 占쌨아울옙
		boardlist = boarddao.getBoardList(page,limit); //占쏙옙占쏙옙트占쏙옙 占쌨아울옙
		//page =2 , limit =10 (占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙)
	
		
		
		//占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
		//listcount =12/10
 		int maxpage=(int)((double)listcount/limit+0.95); 
 		//0.95占쏙옙 占쏙옙占쌔쇽옙 占시몌옙 처占쏙옙
 		
 		
 		//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙(1, 11, 21 占쏙옙...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		//占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙(10, 20, 30 占쏙옙...)
		int endpage = startpage+10-1;

 		if (endpage> maxpage){endpage= maxpage;}

 		
 		request.setAttribute("page", page); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
 		request.setAttribute("maxpage", maxpage); //占쌍댐옙 占쏙옙占쏙옙占쏙옙 占쏙옙
 		request.setAttribute("startpage", startpage); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 표占쏙옙占쏙옙 첫 占쏙옙占쏙옙占쏙옙 占쏙옙
 		request.setAttribute("endpage", endpage); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 표占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙
		request.setAttribute("listcount",listcount); //占쏙옙 占쏙옙
		request.setAttribute("boardlist", boardlist);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(true);
 		forward.setPath("/WUASystem/ascenter_qna_result.jsp");
 		return forward;
	 }
 }