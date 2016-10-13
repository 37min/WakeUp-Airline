package NET.WUA.BOARD.ACTION;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;

public class BoardDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		boolean result = false;
		boolean userCheck = false;
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDao boarddao = new BoardDao();
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
		result = boarddao.boardDelete(num);
		if(result == false){
			System.out.println("�Խù� ���� ����");
			return null;
		}
		System.out.println("�Խù� ���� ����");
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("boardList.bo");
		return forward;
		
		
	}

}
