package NET.WUA.BOARD.ACTION;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.RequestDispatcher;

/**
 * Servlet implementation class BoardFrontController
 */
//@WebServlet("/BoardFrontController")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
       String RequestURI =request.getRequestURI();
       String ContextPath =request.getContextPath();
       //   /Web_JSP_MVCboard/*.bo
       //   /Web_JSP_MVCboard
       String command = RequestURI.substring(ContextPath.length());
       System.out.println("RequestURI :" + RequestURI);
       System.out.println("ContextPath :" +ContextPath);
       System.out.println("command : " + command);
       
       ActionForward forward = null;
       Action action = null;
       
       if(command.equals("/BoardWrite.bo")){
    	   System.out.println("board Write");
    	   forward = new ActionForward();
    	   forward.setRedirect(false);
    	   forward.setPath("/ascenter_qna_write.jsp");
    	   System.out.println("Process");
       }else if(command.equals("/BoardReplyAction.bo")){
    	   action = new BoardReplyAction();
    	   try{
    		 forward = action.execute(request, response);
    	   }catch(Exception e){
    		   e.printStackTrace();
    	   }
       }else if(command.equals("/BoardDelete.bo")){
    	   //占쏙옙占쏙옙占쏙옙占�占쏙옙청占쏙옙 占쏙옙占쏙옙占쏙옙
    	   forward = new ActionForward();
    	   forward.setRedirect(false);
    	   forward.setPath("/ascenter_qna_delete.jsp");
       }else if(command.equals("/BoardAddAction.bo")){
    	   System.out.println("Insert");
    	   action = new BoardAddAction();
    	   System.out.println("Insert After");
    	   try{
    		   forward = action.execute(request, response);
    	   }catch(Exception e){
    		   e.printStackTrace();
    	   }
       }else if(command.equals("/boardList.bo")){
    	   System.out.println("boardList Display");
    	   action = new BoardListAction();
    	    try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
       }else if(command.equals("/BoardDetailAction.bo")){
    	   System.out.println("BoardDetailAction Display");
    	   System.out.println(request.getParameter("num"));
    	   //占쏙옙占쏙옙 (占쏙옙 占쏙옙占�, 占쏙옙회占쏙옙 占쏙옙占쏙옙占쏙옙트)
    	   action = new BoardDetailAction();
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
    	   
       }else if(command.equals("/BoardDeleteAction.bo")){
    	   System.out.println("占쏙옙占쏙옙 占쏙옙占쏙옙 처占쏙옙");
    	   action = new  BoardDeleteAction();
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
 	   
       }else if(command.equals("/BoardModify.bo")){
    	   System.out.println("占쏙옙占쏙옙占쏙옙 화占쏙옙 처占쏙옙");
    	   action = new BoardModifyView();  
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
 	   
       }else if(command.equals("/BoardModifyAction.bo")){
    	   System.out.println("占쏙옙占쏙옙 占쏙옙占쏙옙(update) 처占쏙옙");
    	   action = new  BoardModifyAction();
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
 	   
       }else if(command.equals("/BoardReplyView.bo")){
    	   System.out.println("占썰변 화占쏙옙 처占쏙옙");
    	   action = new  BoardReplyView();   
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
 	   
       }else if(command.equals("/BoardReplyAction.bo")){
    	   System.out.println("占쏙옙占쏙옙 占썰변 처占쏙옙");
    	   action = new  BoardReplyAction();   
    	   try{
     		   forward = action.execute(request, response);
     	   }catch(Exception e){
     		   e.printStackTrace();
     	   }
 	   
       }
       
     
       
      // BoardReplyView
       if(forward != null){
    	   if(forward.isRedirect()){
    		   System.out.println("response.sendRedirect(" + forward.getPath() + ")");
    		   response.sendRedirect(forward.getPath());
    	   }else{
    		   RequestDispatcher dispatcher = 
    		   request.getRequestDispatcher(forward.getPath());
    		   dispatcher.forward(request, response);
    	   }
       }
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request,response);
	}

}
