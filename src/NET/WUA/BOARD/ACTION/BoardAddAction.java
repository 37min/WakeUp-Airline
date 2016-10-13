//������ �۾��ߴ� ���� ����
//���� ���� ���� 
//Action ��Ű�� �ȿ� ����

package NET.WUA.BOARD.ACTION;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import NET.WUA.BOARD.DB.BoardDao;
import NET.WUA.BOARD.DB.BoardBean;

public class BoardAddAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		BoardDao boarddao = new BoardDao();
		BoardBean boarddata = new BoardBean();
		//////////////////////////////////////////////
		ActionForward forward = new ActionForward();
		/////////////////////////////////////////////
		String realFolder ="";
		String saveFolder = "boardUpload";
		int filesize = 10*1024*1024; //10M
		realFolder =  request.getSession().getServletContext().getRealPath(saveFolder);
		// realFolder = request.getRealPath(saveFolder);
		 boolean result=false;
		 try{
		    	//MultipartRequest type�� mult ��ü �ʱ�ȭ ����
		    	 MultipartRequest multi = null;
		    	 multi = new MultipartRequest(
		    			 request,    //��û ��ü (Mulitpart �� ����)
		    			 realFolder, //������ (������ ���� ���)
		    			 filesize,   //���� ũ�� (10M)(�ѹ� ���ε��� �ִ� ���� ũ��)
		    			 "euc-kr",   //�ѱ� ���ڵ�
		                 new  DefaultFileRenamePolicy() //���� �ߺ� ó�� ��ü    			              
		    			 );

		    	 boarddata.setBoard_pass(multi.getParameter("BOARD_PASS"));
		    	 boarddata.setBoard_subject(multi.getParameter("BOARD_SUBJECT"));
		    	 boarddata.setBoard_content(multi.getParameter("BOARD_CONTENT").replace("\r\n", "<br>"));
		    	 // boarddata.setBoard_file(multi.getFilesystemName((String)multi.getFileNames().nextElement()));
		    	 boarddata.setBoard_name(multi.getParameter("BOARD_NAME"));
		    	 //ct +sh +x (�빮��)
		    	 //insert �� ��ü�� ����
		    	 result = boarddao.boardInsert(boarddata);
		    	if(result == false){
		    		System.out.println("Insert Fail");
		    		return null;
		    	} 
		    	System.out.println("Insert success");
		    	////////���� ����//////////////////////////////
		    	forward.setRedirect(true);
		    	forward.setPath("boardList.bo");
		    	return forward;
		    	////////////////////////////////////
		    	 
		 }catch(Exception e){
			 e.printStackTrace();
		 }
		
		
		return null;
	}

}
