package NET.WUA.MEMBER.ACTION;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import NET.WUA.MEMBER.DB.*;

 public class MemberUpdAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 request.setCharacterEncoding("euc-kr");
		 ActionForward forward = new ActionForward();
		 boolean result = false;
		 
		 //int num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		 
		 MemberDao memberdao=new MemberDao();
		 MemberBean memberdata=new MemberBean();
		 
		 //boolean usercheck=memberdao.isBoardWriter(
		//		 				num, request.getParameter("BOARD_ID"));
		 //if(usercheck==false){
//		   		response.setContentType("text/html;charset=euc-kr");
//		   		PrintWriter out=response.getWriter();
//		   		out.println("<script>");
//		   		out.println("alert('������ ������ ����ϴ�.');");
//		   		out.println("location.href='./BoardList.bo';");
//		   		out.println("</script>");
//		   		out.close();
//		   		return null;
		 //}
		 
		 try{
			 
			 
			 
			 
			 System.out.println("mNo ~ TRY gogogogo");
			 System.out.println(request.getParameter("mNo"));
			 System.out.println(request.getParameter("mId"));
			 System.out.println(request.getParameter("mPw"));
			 System.out.println(request.getParameter("mAddress"));
			 System.out.println(request.getParameter("mMobilePhone"));
			 System.out.println(request.getParameter("mEmail"));
			 
			 memberdata.setmNo(Integer.parseInt(request.getParameter("mNo")));
			 memberdata.setmId(request.getParameter("mId"));
			 memberdata.setmPw(request.getParameter("mPw"));
			 //memberdata.setmEngLastName(request.getParameter("mEngLastName"));
			 //memberdata.setmEngMidName(request.getParameter("mEngMidName"));
			 //memberdata.setmSex(Integer.parseInt(request.getParameter("mSex")));
			 memberdata.setmAddress(request.getParameter("mAddress"));
			 memberdata.setmMobilePhone(request.getParameter("mMobilePhone"));
			 memberdata.setmEmail(request.getParameter("mEmail"));
				
			 
			result = memberdao.MemberUpdate(memberdata);
			System.out.println("MemberDATA mPw is "+memberdata.getmPw());
			System.out.println("MemberDATA mAddress is "+memberdata.getmAddress());
			MemberBean saveDTO = memberdao.saveSession(memberdata); //���ǰ� �����ϱ����� ����Ʈ �Լ�.
			System.out.println("saveDTO mPw is "+saveDTO.getmPw());
			System.out.println(saveDTO.getmAddress());
			
			HttpSession session=request.getSession();
			session.setAttribute("session_member", saveDTO);
			 if(result==false){
		   		System.out.println("�Խ��� ���� ����");
		   		return null;
		   	 }
		   	 System.out.println("�Խ��� ���� �Ϸ�");
		   	 
		   	 forward.setRedirect(true);
		   	forward.setPath("MemberInfo.me");
		   	 //return forward;
	   	 }catch(Exception ex){
	   			ex.printStackTrace();	 
		 }
		 
		 return forward;
	 }
}