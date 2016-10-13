<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="NET.WUA.SCHEDULE.DB.SchDao" %>
<%@ page import="NET.WUA.SCHEDULE.DB.SchBean" %>
<%@ page import="java.util.ArrayList" %>  

<%
		//schDepartDate=2013-12-02&schDepartDate2=2013-12-03&schDeparture=Kimpo&schArrival=Jeju
		
		System.out.println(request.getRequestURI());
		
		String dateFrom		 = (String) session.getAttribute("dateFrom"); 
		String dateTo			 = (String) session.getAttribute("dateTo"); 
		String departure		 = (String) session.getAttribute("departure");
		String arrival				 = (String) session.getAttribute("arrival");

		System.out.println("[DebugLog] "+ dateFrom + "/" +dateTo + "/" +departure + "/" +arrival );
		
		SchDao schdao = new SchDao();
		ArrayList<SchBean> scheduleList = new ArrayList<SchBean>();
		
		scheduleList = schdao.getSuperMan(dateFrom, departure, arrival ,dateTo);
		
		StringBuffer jsonStr = new StringBuffer();
		
		jsonStr.append("{\"page\" : \"1\",");
		jsonStr.append("\"total\" : 2,");		
		jsonStr.append("\"records\" : \"11\",");
		jsonStr.append("\"user\" : [");
		
		//Change to JSON Type.
		int listLength = scheduleList.size();
		System.out.println("listLength is " + listLength);
		
		int loopIndex = 1;
		
		String rowData = "";
		
		for( SchBean sb : scheduleList )
		{
			System.out.println("current loopIndex is " + loopIndex);
			
			rowData += "{\"SCHNO\":" + sb.getSchNo() + 
							 ",\"SCHAPNAME\":\"" + sb.getSchApName() + 
							 "\",\"SCHDEPARTDATE\":\"" + sb.getSchDepartDate() +
							 "\",\"SCHDEPARTTIME\":\"" + sb.getSchDepartTime() +
							 "\",\"SCHARRIVALTIME\":\"" + sb.getSchArrivalTime() +
 							 "\",\"SCHFARE\":\"" + sb.getSchFare() +
 							 "\",\"SCHSEATRESV\":\"" + sb.getSchSeatResv() +
 							 "\",\"SCHDEPARTURE\":\"" + sb.getSchDeparture() +
 							 "\",\"SCHARRIVAL\":\"" + sb.getSchArrival() + "\"}";
			
			if( loopIndex != listLength )
				rowData += ",";
			
			System.out.println("[rowData][Index " + loopIndex + "]" + rowData);
			
			loopIndex++;
			
		}
		
		System.out.println("[rowData][LastIndex=" + loopIndex + "]" + rowData);
		
		jsonStr.append(rowData);
		
		jsonStr.append("]}");
		    	
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter outer = response.getWriter();  	
		outer.print(jsonStr.toString());
%>