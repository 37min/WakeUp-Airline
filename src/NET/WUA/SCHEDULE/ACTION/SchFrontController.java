package NET.WUA.SCHEDULE.ACTION;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.SCHEDULE.ACTION.ActionForward;
import NET.WUA.SCHEDULE.ACTION.Action;

import NET.WUA.SCHEDULE.DB.SchDao;
import NET.WUA.SCHEDULE.DB.SchBean;

public class SchFrontController  
extends javax.servlet.http.HttpServlet 
implements javax.servlet.Servlet {
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String requestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command = requestURI.substring(contextPath.length()).replace("/","");
		
		System.out.println("RequestURI :" + requestURI);
		System.out.println("ContextPath :" +contextPath);
		System.out.println("command : " + command);
		
		ActionForward forward = null;
		Action action = null;

		System.out.println("board2");

		HttpSession session = request.getSession(); //session
		SchDao schdao = new SchDao();

		if(command.equals("/schmng/SchList.action")){
			System.out.println("board3");
			forward = new ActionForward();
			action = new SchListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		

		else if(command.equals("/schmng/SchListBySchNo.action")){
			System.out.println("board4");
			action = new SchListByActionSchNo();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/schmng/SchListByDepartDate.action")){
			System.out.println("board5");
			action = new SchListByActionDepartDate();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/schmng/SchListByDeparture.action")){
			System.out.println("board6");
			action = new SchListByActionDeparture();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//SchListBySchArrival.action
		else if(command.equals("/schmng/SchListBySchArrival.action")){
			System.out.println("board6");
			action = new SchListByActionArrival();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("SuperMan.action")){
			System.out.println("SchFrontController::board7");
			action = new SuperManAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("SuperMan2.action")){
			System.out.println("SchFrontController::jqGrid");
			action = new SuperManAction2();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		
		else if(command.equals("AdminList.action")){
			System.out.println("SchFrontController AdminList.action");
			action = new SchListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		////////////////////////////////////////////////
		////////////////////////////////////////////////
		if(forward != null)
		{
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