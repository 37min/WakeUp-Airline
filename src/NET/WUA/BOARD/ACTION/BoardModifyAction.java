package NET.WUA.BOARD.ACTION;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("BOARD_NUM"));
		
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		userCheck = boarddao.isBoardWriter(num, request.getParameter("BOARD_PASS"));
		if(userCheck == false){
			response.setContentType("text/html;charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('�����Ҽ� ���');");
			out.print("location.href='boardList.bo';");
			out.print("</script>");
			out.close();
			return null;
			
		}

        //�Ǽ��� (������ , �۳���) => qna_board_Modify.jsp
		boarddata.setBoard_num(num);
		boarddata.setBoard_subject(request.getParameter("BOARD_SUBJECT"));
		boarddata.setBoard_content(request.getParameter("BOARD_CONTENT"));
		
		result = boarddao.boardModify(boarddata);
		
		if(result == false){
			System.out.println("�Խ��� ���� ����");
			return null;
		}
		System.out.println("�Խ��� ���� ����");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("BoardDetailAction.bo?num="+boarddata.getBoard_num());
		return forward;
	}

}
