package NET.WUA.BOARD.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//BOARD_NUM
		//BOARD_RE_REF
		//BOARD_RE_LEV
		//BOARD_RE_SEQ
		
		//BOARD_NAME
		//BOARD_PASS
		//BOARD_SUBJECT
		//BOARD_CONTENT
		
		//boardBean b = boardBean();
		//b.set.... (request.getParameter("BOARD_NAME");
		
		//boardReply()�� boardBean ��ü�� parameter
		//boardDao.boardReply(b)�� ȣ���ؼ� ����
		//update ->  insert ó��
		//ó���� �Ϸ� �Ǹ� �����ϰ� �����ϰ� �� forward
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		int result = 0;
		
		boarddata.setBoard_num(Integer.parseInt(request.getParameter("BOARD_NUM")));
		boarddata.setBoard_name(request.getParameter("BOARD_NAME"));
		boarddata.setBoard_pass(request.getParameter("BOARD_PASS"));
		boarddata.setBoard_subject(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBoard_content(request.getParameter("BOARD_CONTENT"));
		boarddata.setBoard_re_ref(Integer.parseInt(request.getParameter("BOARD_RE_REF")));
		boarddata.setBoard_re_seq(Integer.parseInt(request.getParameter("BOARD_RE_SEQ")));
		boarddata.setBoard_re_lev(Integer.parseInt(request.getParameter("BOARD_RE_LEV")));
	
		result = boarddao.boardReply(boarddata);
		//�亯�۹�ȣ�� return
		if(result == 0){
			System.out.println("�亯�ϱ� ����");
			return null;
		}
		System.out.println("�亯�ϱ� ����");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("BoardDetailAction.bo?num=" +result );
		return forward;
	}

}
