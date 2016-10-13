package NET.WUA.SCHEDULE.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import NET.WUA.SCHEDULE.DB.SchBean;

public class SchDao 
{
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public SchDao()
	{
		try
		{ 
			Context init = new InitialContext();
			ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			//寃쎈� ��� ��
		}
		catch(Exception e)
		{
			System.out.println("DB�곌껐�ㅽ�:" + e);
			return;
		}
	}

		//////////////////////////////////////
		//Show All
		public ArrayList<SchBean> getSchList() 
		{
			String sql = "SELECT * FROM FLIGHTSCHEDULE ORDER BY schno DESC";
			ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
								
				while (rs.next()) {
					SchBean schbean = new SchBean();
					
					schbean.setSchNo(rs.getInt("SchNo"));
					schbean.setSchApName(rs.getString("SchApName"));				
					schbean.setSchDepartDate(rs.getString("SchDepartDate"));
					schbean.setSchDepartTime(rs.getString("SchDepartTime"));
					schbean.setSchArrivalTime(rs.getString("SchArrivalTime"));
					schbean.setSchFare(rs.getInt("SchFare"));
					schbean.setShcSeat(rs.getInt("ShcSeat"));
					schbean.setSchSeatResv(rs.getInt("SchSeatResv"));
					schbean.setSchDeparture(rs.getString("schDeparture"));
					schbean.setSchArrival(rs.getString("scharrival"));
					arraysch.add(schbean);
				}
				return arraysch;
				
			} catch (Exception ex) {
				ex.printStackTrace();
			} finally {
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(conn!=null) try{conn.close();}catch(SQLException ex){}
			}
			return null;	
		}
		
	
	/////////////////////////
	//SchNo �ㅼ�伊������寃��
	/*public ArrayList<SchBean> getSchListBySchNo(int id) //諛�� 蹂��?
	{
		String sql = 
				"SELECT " +
						"SchNo, SchApName, " +
						"SchDepartDate, SchDepartTime, " +
						"SchArrivalTime, SchFare, " +
						"ShcSeat, SchSeatResv, " +
						"schDeparture, scharrival " +
						"FROM FlightSchedule " +
						"WHERE SchNo = ?";
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
			}
			System.out.println("444");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}*/
	
	public ArrayList<SchBean> getSchListBySchNo(int id) //諛�� 蹂��?
	{
		String sql = 
				"SELECT " +
						"SchNo, SchApName, " +
						"SchDepartDate, SchDepartTime, " +
						"SchArrivalTime, SchFare, " +
						"ShcSeat, SchSeatResv, " +
						"schDeparture, scharrival " +
						"FROM FlightSchedule " +
						"WHERE SchNo LIKE '%" + id  + "%'";
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("getSchListBySchNo333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
			}
			System.out.println("444");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}
	
	//DepartDate �ㅼ�伊������寃��
	public ArrayList<SchBean> getSchListByDepartDate(String id) //諛�� 蹂��?
	{
		String sql = 
				"SELECT " +
						"SchNo, SchApName, " +
						"SchDepartDate, SchDepartTime, " +
						"SchArrivalTime, SchFare, " +
						"ShcSeat, SchSeatResv, " +
						"schDeparture, scharrival " +
						"FROM FlightSchedule " +
						"WHERE SchDepartDate LIKE '%" + id  + "%'";
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("getSchListByDepartDate 333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
			}
			System.out.println("444");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}
	
	//DepartDate �ㅼ�伊������寃��
	public ArrayList<SchBean> getSchListByDeparture(String id) //諛�� 蹂��?
	{
		String sql = 
				"SELECT " +
						"SchNo, SchApName, " +
						"SchDepartDate, SchDepartTime, " +
						"SchArrivalTime, SchFare, " +
						"ShcSeat, SchSeatResv, " +
						"schDeparture, scharrival " +
						"FROM FlightSchedule " +
						"WHERE SchDeparture LIKE '%" + id  + "%'";
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("getSchListByDeparture 333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
			}
			System.out.println("getSchListByDeparture 444");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}
	
	
	//DepartDate �ㅼ�伊������寃��
	public ArrayList<SchBean> getSchListByArrival(String id) //諛�� 蹂��?
	{
		String sql = 
				"SELECT " +
						"SchNo, SchApName, " +
						"SchDepartDate, SchDepartTime, " +
						"SchArrivalTime, SchFare, " +
						"ShcSeat, SchSeatResv, " +
						"schDeparture, scharrival " +
						"FROM FlightSchedule " +
						"WHERE SchArrival LIKE '%" + id  + "%'";
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("getSchListByArrival 333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
			}
			System.out.println(" getSchListByArrival 444");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}
	
	
	public ArrayList<SchBean> getSuperMan(String id1, String id2, String id3,String id4) //諛�� 蹂��?
	{
		System.out.println("쿼리execute()::Date/Departure/Arrival = " + id1 +"/" + id2 +"/" + id3+"/" + id4);
		String sql = 
				"SELECT SchNo, SchApName,SchDepartDate, SchDepartTime,SchArrivalTime, " +
				" SchFare,  ShcSeat, SchSeatResv, schDeparture, scharrival" +
				" FROM FlightSchedule WHERE SchDeparture =  ? AND SchArrival = ? AND " +
				" SchDepartDate BETWEEN ? AND ? ";
			   
	
		System.out.println("arraysch");
		ArrayList<SchBean> arraysch = new ArrayList<SchBean>();
		
		try {System.out.println("tryBTWQR");
		System.out.println(sql);
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id2);	
			pstmt.setString(2, id3);
			pstmt.setString(3, id1);//date1
			pstmt.setString(4, id4);//date2
			rs=pstmt.executeQuery();
			int i = 1;
			while (rs.next()) {
				SchBean schbean = new SchBean();
				
				System.out.println("getSuperMan 333");
				
				schbean.setSchNo(rs.getInt(1));
				schbean.setSchApName(rs.getString(2));				
				schbean.setSchDepartDate(rs.getString(3));
				schbean.setSchDepartTime(rs.getString(4));
				schbean.setSchArrivalTime(rs.getString(5));
				schbean.setSchFare(rs.getInt(6));
				schbean.setShcSeat(rs.getInt(7));
				schbean.setSchSeatResv(rs.getInt(8));
				schbean.setSchDeparture(rs.getString(9));
				schbean.setSchArrival(rs.getString(10));
				arraysch.add(schbean);
				
				System.out.println("SearchResult Log : (Index " + i + ") SchNo is " + rs.getInt(1) );
			}
			System.out.println("End getSuperMan().....");
			return arraysch;
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return null;	
	}

	public boolean updateScheduleSeatNumber(String schNo) {
		// TODO Auto-generated method stub
		String sql = "UPDATE flightschedule set schseatresv = schseatresv-1 where schno=" + schNo;
	
		try{
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
			return true;
			
		}catch(Exception e){
			System.out.println("Update Failed");
			e.printStackTrace();
		}finally
		{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return false;
	}

	
	
	//Admin Insert SchInsert
	
		
}//end
