package NET.WUA.MEMBER.ACTION;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import NET.WUA.MEMBER.ACTION.MemberLoginAction;
import NET.WUA.MEMBER.ACTION.MemberJoinAction;

 public class MemberFrontController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 static final long serialVersionUID = 1L;
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 //
		 	System.out.println("member_FrontPAGE");
		 //

		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 
		 System.out.println("RequestURI is " + RequestURI);
		 System.out.println("contextPath is " + contextPath);
		 
		 String command=RequestURI.substring(contextPath.length()).replace("/","");
		 
		 if( command.matches("member/"));
		 {
			 command.replace("member/", "");
		 }
		 
		 System.out.println("command is " + command);
		 
		ActionForward forward=null;
		Action action=null;
		   
		   if(command.equals("MemberLogin.me")){
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("Index.jsp");
			   
		   }else if(command.equals("MemberJoin.me")){
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("joinForm.jsp");
			   
		   }else if(command.equals("MemberJoinAction.me")){
			   action = new MemberJoinAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("MemberLoginAction.me")){
			   action = new MemberLoginAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("logged.me")){
			   System.out.println("logggggggggggggggggggggged ctrl");
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("logged.jsp");
		   }
		   else if(command.equals("loginSucess.me")){
			   System.out.println("login sucess. will be redirect to index page.");
			   forward=new ActionForward();
			   forward.setRedirect(true);
			   forward.setPath("Index.jsp");
		   }
		   else if(command.equals("MemberInfo.me")){
			   System.out.println("MEMBER InFO ctrl");
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("Mypage_memberview.jsp");
		   }
		   else if(command.equals("MemberUpd.me")){
			   System.out.println("MEMBER upd ctrl");
			   forward=new ActionForward();
			   forward.setRedirect(false);
			   forward.setPath("/member/MemberUpdate.jsp");
		   }
		   else if(command.equals("MemberUpdAction.me")){
			   action = new MemberUpdAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   
		   if(forward != null){
		   if(forward.isRedirect()){
			   response.sendRedirect(forward.getPath());
		   }else{
			   RequestDispatcher dispatcher=
				   request.getRequestDispatcher(forward.getPath());
			   System.out.println(forward.getPath());
			   System.out.println(" request.getRequestDispatcher(forward.getPath()) is" +  request.getRequestDispatcher(forward.getPath()) );
			   dispatcher.forward(request, response);
		   }
		   }
	 }
	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		System.out.println("get");
		doProcess(request,response);
	}  	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		doProcess(request,response);
	}   	  	      	    
}