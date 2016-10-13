package NET.WUA.BOARD.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardModifyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		boarddata =boarddao.getDetail(num);
		if(boarddata == null){
			System.out.println("���� �󼼺��� ����");
			return null;
		}
		System.out.println("���� �󼼺��� ����");
		
		//key point
		//why qna_board_modify.jsp 
		// request.getAttribute("boarddata") �����͸� �޴´�
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/ascenter_qna_modify.jsp");
		return forward;
		
		
	}

}
