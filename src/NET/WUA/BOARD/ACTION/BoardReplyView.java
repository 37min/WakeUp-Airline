package NET.WUA.BOARD.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardReplyView implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		// �۹�ȣ�� �޾Ƽ�
		//BoardDao ��ü  getDetail �޼��带 ���
		//���� ���� �ۿ� ���� ������ ������ �´�
		//request��ü�� ����ؼ� getDetail�� ���� ����
		//boardBean ��ü�� ����(forward �� ������ ������ �������)
		//forward => qna_board_reply.jsp)
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		int num = Integer.parseInt(request.getParameter("num"));
		
		boarddata = boarddao.getDetail(num);
		if(boarddata == null){
			System.out.println("�亯�ϱ� �� ������ �ε� ����");
			return null;
		}
		System.out.println("�亯�ϱ� �� ������ �ε�");
		
		//�� ������ ���
		request.setAttribute("boarddata", boarddata);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/ascenter_qna_reply.jsp");
		return forward;
	}

}
