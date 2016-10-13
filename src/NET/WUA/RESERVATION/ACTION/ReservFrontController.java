package NET.WUA.RESERVATION.ACTION;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse; 

import NET.WUA.RESERVATION.ACTION.ActionForward;
import NET.WUA.RESERVATION.ACTION.ReservCheckAction;
import NET.WUA.RESERVATION.ACTION.ReservCancelAction;
import NET.WUA.RESERVATION.ACTION.ReservInsertViewAction;
import NET.WUA.RESERVATION.ACTION.ReservSaveAction;

 public class ReservFrontController 
 	extends javax.servlet.http.HttpServlet 
 	implements javax.servlet.Servlet {
	 static final long serialVersionUID = 1L;
	 protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
	 	throws ServletException, IOException {
		 System.out.print("member");
		 
		 String RequestURI=request.getRequestURI();
		 String contextPath=request.getContextPath();
		 String command=RequestURI.substring(contextPath.length()).replace("/","");
		   
		 System.out.println("RequestURI :" + RequestURI);
	     System.out.println("ContextPath :" + contextPath);
	     System.out.println("command : " + command);
	     
	     ActionForward forward=null;
		 Action action=null;
		 
		   if(command.equals("ReservCheckAction.re")){
			   System.out.println("FontControll::ReservCheckAction.re ");
			   action = new ReservCheckAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   else  if(command.equals("ReservCheckAllAction.re")){
			   System.out.println("FontControll::ReservCheckAllAction.re ");
			   action = new ReservCheckAllAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   else if(command.equals("ReservCancelAction.re")){
			   System.out.println("FrontController2 ");
			   action = new ReservCancelAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   else if(command.equals("ReservInsertMemberAction.re")){
			   System.out.println("FrontController :: ReservInsertMemberAction.re");
			   action = new ReservationMemberAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }
		   else if(command.equals("ReservInsertViewAction.re")){
			   System.out.println("FrontController3");
			   action = new ReservInsertViewAction();
			   try{
				   forward=action.execute(request, response);
			   }catch(Exception e){
				   e.printStackTrace();
			   }
		   }else if(command.equals("ReservSaveAction.re")){
			   System.out.println("FrontController4");
			   action = new ReservSaveAction();
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