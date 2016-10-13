package NET.WUA.BOARD.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		//view �� ����
		//�۹�ȣ�� ������ �ͼ� 
		int num =Integer.parseInt(request.getParameter("num"));
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		
		boarddao.setReadCountUpdate(num);//��ȸ�� ����
		boarddata =boarddao.getDetail(num);
		
		if(boarddata == null){
			System.out.println("Null Data ó��");
			return null;
		}
		System.out.println("boardbean Data �Ϸ�");
		//������ ������ ...
		//view ���������� ó���Ǵ� bean ��ü
		request.setAttribute("boarddata",boarddata);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/ascenter_qna_detail.jsp");
		return forward;
	
	}

}
