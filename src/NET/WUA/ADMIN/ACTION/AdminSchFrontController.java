package NET.WUA.ADMIN.ACTION;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.ADMIN.ACTION.ActionForward;
import NET.WUA.ADMIN.ACTION.Action;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.SCHEDULE.DB.SchBean;

public class AdminSchFrontController  
extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command = requestURI.substring(contextPath.length()).replace("/","");
		command = command.replace("/", "");
		
		System.out.println("RequestURI :" + requestURI);
		System.out.println("ContextPath :" +contextPath);
		System.out.println("command : " + command);
		
		ActionForward forward = null;
		Action action = null;


		HttpSession session = request.getSession(); //session
		SchDao schdao = new SchDao();

		if(command.equals("AdminSchInsert.fp")){
			forward = new ActionForward();
			action = new AdminSchInsertAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("AdminSchList.fp")){
			System.out.println("inside AdminSchList.fp");
			forward = new ActionForward();
			action = new AdminSchListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("AdminSchList2.fp")){
			System.out.println("inside AdminSchList2.fp");
			forward = new ActionForward();
			action = new AdminSchListAction2();
			try{
				forward = action.execute(request, response);
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
		System.out.println("board1");
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   	  	    
}