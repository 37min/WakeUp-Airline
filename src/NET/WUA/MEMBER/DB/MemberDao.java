package NET.WUA.MEMBER.DB;

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

import NET.WUA.MEMBER.DB.MemberBean;

public class MemberDao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;

		public MemberDao()
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
	

		public int isMember(MemberBean member)
		{
			String sql = "SELECT mPw FROM members WHERE mId=?";
			int result = -1;
			
			try
			{
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getmId());
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					if(rs.getString("mPw").equals(member.getmPw()))
					{
						result=1; 
					}else {
						result=0;
					}
				}else{
					result=-1;
				}
				
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("isMember asdasd");
			}finally
			{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(conn!=null) try{conn.close();}catch(SQLException ex){}
			}
			
			return result;
		}
		
		public MemberBean saveSession(MemberBean member)
		{
			String sql = "SELECT mNo,mId,mPw,mKorName,mEngLastName,mEngMidName," +
					"mSex,mAddress,mMobilePhone,mEmail,mMileage FROM members WHERE mId=?";
			int result = -1;
			
			try
			{
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, member.getmId());
				rs=pstmt.executeQuery();
				
				if(rs.next())
				{
					MemberBean mDTO = new MemberBean();
					
					mDTO.setmNo(rs.getInt(1));
					mDTO.setmId(rs.getString("mId"));
					mDTO.setmPw(rs.getString("mPw"));
					mDTO.setmKorName(rs.getString("mKorName"));
					mDTO.setmEngLastName(rs.getString("mEngLastName"));
					mDTO.setmEngMidName(rs.getString("mEngMidName"));
					mDTO.setmSex(rs.getInt("mSex"));
					mDTO.setmAddress(rs.getString("mAddress"));
					mDTO.setmMobilePhone(rs.getString("mMobilePhone"));
					mDTO.setmEmail(rs.getString("mEmail"));
					mDTO.setmMileage(rs.getInt("mMileage"));

					return mDTO;
					
				}
				
				//memberdao.saveSession(member);
				/*
				 mNo NUMBER, 
				mId VARCHAR2(20) UNIQUE, --
				mPw VARCHAR2(20) NOT NULL, 
				mKorName VARCHAR2(20) NOT NULL, -
				mEngLastName VARCHAR2(20) NOT NULL, -
				mEngMidName VARCHAR2(20) NOT NULL, --(
				mSex NUMBER(1) NOT NULL, -
				mAddress VARCHAR2(20) NOT NULL, --
				mMobilePhone VARCHAR2(20) NOT NULL, -
				mEmail VARCHAR2(20) NOT NULL, -
				  */
				
				
			}catch(Exception e)
			{
				e.printStackTrace();
				System.out.println("SaveSession stucked");
			}finally
			{
				if(rs!=null) try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
				if(conn!=null) try{conn.close();}catch(SQLException ex){}
			}
			
			return null;
		}
		
		public boolean joinMember(MemberBean member)
		{	
			String sql = "INSERT INTO members(mNo, mId, mPw, mKorName," +
					" mEngLastName, mEngMidName, mSex, mAddress," +
					" mMobilePhone, mEmail) VALUES(SEQ_MNO.NEXTVAL,?,?,?,?,?,?,?,?,?)";
			int result = 0;
			
			try
			{
				System.out.println("join MEM tr!");
				conn=ds.getConnection();
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, member.getmId());
				pstmt.setString(2, member.getmPw());
				pstmt.setString(3, member.getmKorName());
				pstmt.setString(4, member.getmEngLastName());
				pstmt.setString(5, member.getmEngMidName());
				
			     	pstmt.setInt(6, member.getmSex());
				pstmt.setString(7, member.getmAddress());
				pstmt.setString(8, member.getmMobilePhone());
				pstmt.setString(9,member.getmEmail());
				
				
				//pstmt.setInt(10, member.getmMileage());
				
				result=pstmt.executeUpdate();
				
				/*
				 mNo NUMBER, 
				mId VARCHAR2(20) UNIQUE, --
				mPw VARCHAR2(20) NOT NULL, 
				mKorName VARCHAR2(20) NOT NULL, -
				mEngLastName VARCHAR2(20) NOT NULL, -
				mEngMidName VARCHAR2(20) NOT NULL, --(
				mSex NUMBER(1) NOT NULL, -
				mAddress VARCHAR2(20) NOT NULL, --
				mMobilePhone VARCHAR2(20) NOT NULL, -
				mEmail VARCHAR2(20) NOT NULL, -
				  */
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
		
		
		
		
		public boolean MemberUpdate(MemberBean mUPD) throws Exception{
			String sql="update members set mAddress=?, mMobilePhone=?, mEmail=?, mPw=? where mId=?";
			
			try{
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mUPD.getmAddress());
				pstmt.setString(2, mUPD.getmMobilePhone());
				pstmt.setString(3, mUPD.getmEmail());
				pstmt.setString(4, mUPD.getmPw());
				pstmt.setString(5, mUPD.getmId());
				pstmt.executeUpdate();
				System.out.println("ADDDDRRRRR Modify Query");
				return true;
			}catch(Exception ex){
				System.out.println("ADDDDRRRRR Modify ���� : " + ex);
			}finally{
				if(rs!=null)try{rs.close();}catch(SQLException ex){}
				if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
				if(conn!=null)try{conn.close();}catch(SQLException ex){}
				}
			return false;
		}
	
		
		
		
		
		
		
}














