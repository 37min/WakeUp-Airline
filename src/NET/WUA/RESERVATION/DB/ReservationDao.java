package NET.WUA.RESERVATION.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import NET.WUA.RESERVATION.DB.ReservationBean;
import NET.WUA.RESERVATION.DB.ReservationResultBean;
import NET.WUA.SCHEDULE.DB.SchBean;


public class ReservationDao {

	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

		public ReservationDao()
		{
			try{ 
				
				Context init = new InitialContext();
				
				ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
				
			}catch(Exception e)
			{
				System.out.println("DB占쎄�猿�옙�쏙옙:" + e);
				return;
			}
		}

	
		public void insert(int schNo, String memberid, ReservationBean reservation){
		
			String sql = "INSERT INTO RESERVLIST" +
						 "(rno, rscheno, rmemberid, rstate)" +
						 "VALUES(SEQ_RNO.NEXTVAL, ?, ?, '占쏙옙占쏙옙占쎈┛')";
			
		try{
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schNo);
			pstmt.setString(2, memberid);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("INSERT Fail");
			e.printStackTrace();
		}finally
		{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}

	}
		
	public ArrayList<ReservationBean> getReservationListById(String rmemberID) {

		String sql = "SELECT rNo, rMemberId, rScheNo, rState FROM reservlist WHERE rmemberid = ?";	
		ArrayList<ReservationBean> reservlist = new ArrayList<ReservationBean>();
		
		
		try {
			 conn=ds.getConnection();
			 pstmt=conn.prepareStatement(sql);
			 pstmt.setString(1, rmemberID);
			 rs=pstmt.executeQuery();
		
			 while(rs.next()){
				ReservationBean reservation = new ReservationBean();
				 
				reservation.setrNo(rs.getInt(1));
				reservation.setrMemberId(rs.getString(2));
				reservation.setrScheNo(rs.getInt(3));
				reservation.setrState(rs.getString(4));
				
				reservlist.add(reservation);
			}
			
			 System.out.println(reservlist.toString());
			 return reservlist;
			 
		}catch(Exception e){
			System.out.println("getReservationListById 占쏙옙占� " + e);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
			return null;
	}
	
	public void updateReservationByRno(int rno, int schNo) {

		String sql = "UPDATE reservlist set rstate=2 where rno = ?";
		
		try {
			
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
			
			sql = "UPDATE flightschedule set schseatresv = schseatresv + 1 where schno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schNo);
			pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
		}finally
		{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}

	}


	public boolean ReserveTicket(String memberId, String schNo) {
		// TODO Auto-generated method stub
		
		String sql = "INSERT INTO RESERVLIST" +
				 "(rno, rscheno, rmemberid, rstate)" +
				 "VALUES(SEQ_RNO.NEXTVAL, ?, ?, 0)";
	
		try
		{
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(schNo));
			pstmt.setString(2, memberId);
			pstmt.executeUpdate();
			
			return true;
		}
		catch(Exception e)
		{
			System.out.println("INSERT  Failed");
			e.printStackTrace();
		}
		finally
		{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		
		return false;
	}


	public ArrayList<ReservationResultBean> getMyReservationInfoList(String rmemberID, boolean isAllList) {
		// TODO Auto-generated method stub
		
		ReservationResultBean reservResultBean = new ReservationResultBean();
		ArrayList<ReservationResultBean> reservlist = new ArrayList<ReservationResultBean>();
		
		String sql = "";
		
		if ( !isAllList )
		 {
			sql = " SELECT * " + 
					 " FROM RESERVLIST rl JOIN FLIGHTSCHEDULE fs " +
					 " ON rl.RSCHENO = fs.schno " + 
					 " WHERE  rl.RSTATE = ? and rl.rmemberid = ?";
		 }
		else
		{
			sql = " SELECT * " + 
					" FROM RESERVLIST rl JOIN FLIGHTSCHEDULE fs " +
					" ON rl.RSCHENO = fs.schno " + 
					" WHERE  rl.rmemberid = ?";
		}
					
		try {
			 conn=ds.getConnection();
			 pstmt=conn.prepareStatement(sql);
			 
			 if ( !isAllList )
			 {
				 pstmt.setString(1, "0");
				 pstmt.setString(2, rmemberID);
			 }
			 else
			 {
				 pstmt.setString(1, rmemberID);
			 }
			 rs=pstmt.executeQuery();
		
			 while(rs.next())
			 {
				 ReservationResultBean reservation = new ReservationResultBean();
				
//				RNO
//				RSCHENO
//				RMEMBERID
//				RSTATE
				 
				 reservation.setrNo(rs.getInt(1));
				 reservation.setrScheNo(rs.getInt(2));
				 reservation.setrMemberId(rs.getString(3)); 
				 reservation.setrState(rs.getString(4)); 
				
				 reservation.setSchNo(rs.getInt(5)); 
				 reservation.setSchApName(rs.getString(6));
				 reservation.setSchDepartDate(rs.getString(7)); 
				 reservation.setSchDepartTime(rs.getString(8));
				 reservation.setSchArrivalTime(rs.getString(9)); 
				 reservation.setSchFare(rs.getInt(10)); 
				
				//rs 12, 13��醫�� ��낫湲곕�臾몄� 類��.
				 reservation.setSchDeparture(rs.getString(13)); 
				 reservation.setSchArrival(rs.getString(14));
				
				reservlist.add(reservation);
			 }
			
			 return reservlist;
			 
		}catch(Exception e){
			System.out.println("getReservationListById 占쏙옙占� " + e);			
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		
		return null;
	}
		
}


