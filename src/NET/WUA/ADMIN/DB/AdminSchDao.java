package NET.WUA.ADMIN.DB;

import java.sql.SQLException;

import NET.WUA.ADMIN.DB.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import NET.WUA.MEMBER.DB.MemberBean;

public class AdminSchDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public AdminSchDao()
	{
		try{ 
			
			Context init = new InitialContext();
			
			ds=(DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			
		}catch(Exception e)
		{
			System.out.println("asdsda:" + e);
			return;
		}
	}
	
	public boolean insFlightSch(AdminSchBean adminschbean)
	{	
		String sql = "INSERT INTO FLIGHTSCHEDULE(schno,schapname,schdepartdate,schdeparttime,scharrivaltime,schfare,shcseat,schseatresv,schdeparture,scharrival) " +
				"VALUES(SEQ_MNO.NEXTVAL," +
				"?,?,?,?,?,?,?,?,?)";
		int result = 0;
		
		try
		{
			System.out.println("insinsinsisnsinsinsflight!");
			System.out.println(sql);
			conn=ds.getConnection();
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			System.out.println(sql);
			pstmt.setString(1, adminschbean.getpName());
			pstmt.setString(2, adminschbean.getpDepartDate());
			pstmt.setString(3, adminschbean.getpDepartTime());
			pstmt.setString(4, adminschbean.getpArrivalTime());
			pstmt.setInt(5, adminschbean.getpFare());
			pstmt.setInt(6, adminschbean.getpSeat());
			pstmt.setInt(7, adminschbean.getpSeatRsv());
			pstmt.setString(8, adminschbean.getpDeparture());
			pstmt.setString(9, adminschbean.getpArrival());
			
			
			result=pstmt.executeUpdate();
			
			if(result!=0)
			{
				return true;
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally
		{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return false;
	}
	
	
	
}
