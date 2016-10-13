package NET.WUA.BOARD.DB;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import NET.WUA.BOARD.DB.BoardBean;


//BoardDao d = new BoardDao();
//int result = d.getListCount();
public class BoardDao {
	 DataSource ds;
	 Connection conn;
	 PreparedStatement pstmt;
	 ResultSet rs;
	/*
	 Statement stmt=null;
	 ResultSet rs = null;
	 Context context = new InitialContext();
	 DataSource datasource= (DataSource)context.lookup("java:comp/env/jdbc/OracleDB");
	 Connection conn = datasource.getConnection();
	*/
	public BoardDao(){
		try{
			Context context = new InitialContext();
			ds= (DataSource)context.lookup("java:comp/env/jdbc/OracleDB");
		}catch(Exception e){
			System.out.println("DB���� ����:" + e);
			return;
		}
	}
//���� ������ ���ϴ� �Լ�
//List.jsp	
public int getListCount(){
	 //select count(*) from board
	   int rowcount =0;
	   try{
		   conn = ds.getConnection();
		   pstmt =conn.prepareStatement("select count(*) from board");
		   rs = pstmt.executeQuery();
		   if(rs.next()){
			  rowcount = rs.getInt(1); 
		   }
	   }catch(Exception e){
		   
		   
	   }finally{
		   try{rs.close();}catch(SQLException s){s.printStackTrace();}
		   try{pstmt.close();}catch(SQLException s){s.printStackTrace();}
		   try{conn.close();}catch(SQLException s){s.printStackTrace();}
	   }
	   return rowcount;
   }	

//���� ����Ʈ ����
//List.jsp

public List getBoardList(int page,int limit){
	//�� ��� ����
	 	/*
	 	 18��  
	 	pagesize = 5
	 	pagelist  =  4��          1~5 , 5~10 , 11~15 , 16~18
	 	pageindex = 3           11~15���� ������
	 	
	 	BoardBean page = new BoardBean();
	 	=>Table Row �Ѱ� 
	 	�������� ������ �迭 
	 	 */
	   //List.jsp
 	     //page =2  , limit =10(pagesize)
 		String board_list_sql="select * from "+
 		"(select rownum rnum,BOARD_NUM,BOARD_NAME,BOARD_SUBJECT,"+
 		"BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,BOARD_RE_LEV,"+
 		"BOARD_RE_SEQ,BOARD_READCOUNT,BOARD_DATE from "+
 		"(select * from board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc)) "+
 		"where rnum>=? and rnum<=?";
 		
 		List list = new ArrayList();
 		//List<Article> articleList = new ArrayList<Article>();
 		//������ generic ���
 		int startrow = (page -1)*10+1;
 		//Code                        //�б� ������ row ��ȣ.
 		//(2-1)*10+1  (1)*10+1  10 +1  11
 		//page ��� : 1
 		int endrow = startrow+limit-1;  //���� ������ row ��ȣ.	
 		//11 +10 => 21-1 => 20
 		//page ��� : 10
 		try{
 			conn = ds.getConnection();
 			pstmt = conn.prepareStatement(board_list_sql);
 			pstmt.setInt(1, startrow); //11   21   code
 			pstmt.setInt(2, endrow); //20  30   code
 			rs = pstmt.executeQuery();
 			
 			while(rs.next()){
 				BoardBean board = new BoardBean(); //�� ����
 				board.setBoard_num(rs.getInt("BOARD_NUM"));
 				board.setBoard_name(rs.getString("BOARD_NAME"));
 				board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
 				board.setBoard_content(rs.getString("BOARD_CONTENT"));
 				board.setBoard_file(rs.getString("BOARD_FILE"));
 				board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
 				board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
 				board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
 				board.setBoard_readcount(rs.getInt("BOARD_READCOUNT"));
 				board.setBoard_date(rs.getDate("BOARD_DATE"));
 				list.add(board); //key point (�������� ������ collection���)
 			}
 			
 			return list;
 		}catch(Exception ex){
 			System.out.println("getBoardList ���� : " + ex);
 		}finally{
 			if(rs!=null) try{rs.close();}catch(SQLException ex){}
 			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
 			if(conn!=null) try{conn.close();}catch(SQLException ex){}
 		}
 		return null;
 	}

//�� ���� ����.
//view.jsp
public BoardBean getDetail(int num) throws Exception{

 		BoardBean board = null;
 		try{
 			conn = ds.getConnection();
 			pstmt = conn.prepareStatement(
 					"select * from board where BOARD_NUM = ?");
 			pstmt.setInt(1, num);
 			
 			rs= pstmt.executeQuery();
 			
 			if(rs.next()){
 				board = new BoardBean();
 				board.setBoard_num(rs.getInt("BOARD_NUM"));
 				board.setBoard_name(rs.getString("BOARD_NAME"));
 				board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
 				board.setBoard_content(rs.getString("BOARD_CONTENT"));
 				board.setBoard_file(rs.getString("BOARD_FILE"));
 				board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
 				board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
 				board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
 				board.setBoard_readcount(rs.getInt("BOARD_READCOUNT"));
 				board.setBoard_date(rs.getDate("BOARD_DATE"));
 			}
 			return board;
 		}catch(Exception ex){
 			System.out.println("getDetail ���� : " + ex);
 		}finally{
 			if(rs!=null)try{rs.close();}catch(SQLException ex){}
 			if(pstmt !=null)try{pstmt.close();}catch(SQLException ex){}
 			if(conn!=null) try{conn.close();}catch(SQLException ex){}
 		}
 		return null;
 	}
 	
//�� ���
//write.jsp
public boolean boardInsert(BoardBean board){
		
		int num =0;
		String sql="";
		
		int result=0;
		
		try{
			conn = ds.getConnection();
			pstmt=conn.prepareStatement("select max(board_num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next())
				num =rs.getInt(1)+1;
			else
				num=1;
			
			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
			sql+="BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
				"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
				"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, board.getBoard_name());
			pstmt.setString(3, board.getBoard_pass());
			pstmt.setString(4, board.getBoard_subject());
			pstmt.setString(5, board.getBoard_content());
			pstmt.setString(6, board.getBoard_file());
			pstmt.setInt(7, num);
			pstmt.setInt(8, 0);
			pstmt.setInt(9, 0);
			pstmt.setInt(10, 0);
			
			result=pstmt.executeUpdate();
			if(result==0)return false;
			
			return true;
		}catch(Exception ex){
			System.out.println("boardInsert ���� : "+ex);
		}finally{
			if(rs!=null) try{rs.close();}catch(SQLException ex){}
			if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null) try{conn.close();}catch(SQLException ex){}
		}
		return false;
	}
 	
//�� �亯 (key point)
//���� �а� �� �ۿ� ���� �亯(�Խñ�)
//board_reply.jsp
public int boardReply(BoardBean board){
//�亯 2���� ����
//1, update ...  ���� �ڸ����� ��ġ board_re_seq 
//2, insert  ... �� ������ ó��
//�ڵ� ����
String board_max_sql = "select max(board_num) from board";
String sql = "";
int num = 0;
int result = 0;

//���� ���� �а� �亯�� �Ϸ��� ����� ����
int re_ref= board.getBoard_re_ref();
int re_lev = board.getBoard_re_lev();
int re_seq = board.getBoard_re_seq();

try{
	conn = ds.getConnection();
	pstmt =conn.prepareStatement(board_max_sql);
	rs = pstmt.executeQuery();
	if(rs.next()){
		num = rs.getInt(1)+1;
	}else{
		num =1;
	}
	//update �� (��ġ Ȯ��)
	sql = " UPDATE board SET board_re_seq = board_re_seq +1 " +
	      " WHERE board_re_ref = ? AND board_re_seq > ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,re_ref);
	pstmt.setInt(2,re_seq);
	
	result = pstmt.executeUpdate();

	//insert board :(key point)
	re_seq = re_seq +1; //���� ���� �� + 1
	re_lev = re_lev + 1; // ���� ���� �� + 1
	
	sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
	sql+=" BOARD_CONTENT, BOARD_FILE, BOARD_RE_REF,"+
		 " BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+
		 " BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,sysdate)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	pstmt.setString(2, board.getBoard_name());
	pstmt.setString(3, board.getBoard_pass());
	pstmt.setString(4, board.getBoard_subject());
	pstmt.setString(5, board.getBoard_content());
	pstmt.setString(6, "");
	pstmt.setInt(7, re_ref); // �亯 ������ȣ
	pstmt.setInt(8, re_lev); // �亯 �鿩���� 
	pstmt.setInt(9, re_seq); // �亯 ��
	pstmt.setInt(10, 0);
	pstmt.executeUpdate();
	return num;
}catch(SQLException e){
	System.out.println("Reply Error : " + e.getMessage());
}finally{
	if(rs!=null) try{rs.close();}catch(SQLException ex){}
	if(pstmt!=null) try{pstmt.close();}catch(SQLException ex){}
	if(conn!=null) try{conn.close();}catch(SQLException ex){}
}
 return 0;
}

//�� ����
//modify.jsp
public boolean boardModify(BoardBean modifyboard) throws Exception{
 		
 		String sql="update board set BOARD_SUBJECT=?,BOARD_CONTENT=? where BOARD_NUM=?";
 		
 		try{
 			conn = ds.getConnection();
 			pstmt = conn.prepareStatement(sql);
 			pstmt.setString(1, modifyboard.getBoard_subject());
 			pstmt.setString(2, modifyboard.getBoard_content());
 			pstmt.setInt(3, modifyboard.getBoard_num());
 			pstmt.executeUpdate();
 			return true;
 		}catch(Exception ex){
 			System.out.println("boardModify ���� : " + ex);
 		}finally{
 			if(rs!=null)try{rs.close();}catch(SQLException ex){}
 			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
 			if(conn!=null) try{conn.close();}catch(SQLException ex){}
 			}
 		return false;
 	}
 	
//�� ����
//delete.jsp
public boolean boardDelete(int num){
 		//������
 		//��Ģ : ����� �����Ǹ� �� ���� (ref = 1 ) .....
	
 		//��Ģ : state �÷� : T , F ���� �����ϴ� ���� �ƴ϶� ����
	    //     : update set state = F where num=1
	    //     : F (������ ��) ���ڸ� 
	
 		//��Ģ : ��� �亯 �������� �ʰ� �亯 �� ������ ���� ����
 	 	//     : �亯 1���� ������ ���(����) 
	    //     : �亯�� �亯�� 1���� �ִٸ� ��������
	
	
	
	
	
 		//Table column : state : t , f
 		//���
 		//    ->�亯  ���� (x) �亯
 		//        ->�亯_1
 		String board_delete_sql="delete from board where BOARD_num=?";
 		
 		int result=0;
 		
 		try{
 			conn = ds.getConnection();
 			pstmt=conn.prepareStatement(board_delete_sql);
 			pstmt.setInt(1, num);
 			result=pstmt.executeUpdate();
 			if(result==0)return false;
 			
 			return true;
 		}catch(Exception ex){
 			System.out.println("boardDelete ���� : "+ex);
 		}	finally{
 			try{
 				if(pstmt!=null)pstmt.close();
 				if(conn!=null) conn.close();
 				}
 				catch(Exception ex){}
 			
 		}
 		
 		return false;
 	}
 	
//��ȸ�� ������Ʈ
//view.jsp
public void setReadCountUpdate(int num) throws Exception{
 		
 		String sql="update board set BOARD_READCOUNT = "+
 			"BOARD_READCOUNT+1 where BOARD_NUM = "+num;
 		
 		try{
 			conn = ds.getConnection();
 			pstmt=conn.prepareStatement(sql);
 			pstmt.executeUpdate();
 		}catch(SQLException ex){
 			System.out.println("setReadCountUpdate ���� : "+ex);
 		}
 		finally{
 			try{
 			if(pstmt!=null)pstmt.close();
 			if(conn!=null) conn.close();
 			}
 			catch(Exception ex){}
 		
 	}
 	}
 	
//�۾������� Ȯ��
//������ �Խ��� (�α���) (�۾��� = �α����� �����)
//�������� �Խ���(�Ϲ� �����) : ���� ���� , ���� => ���
//���� �����Ϸ��� �ۿ� Ȯ���۾� (���)
//Modify.jsp , Delete.jsp
public boolean isBoardWriter(int num,String pass){
 		String board_sql="select * from board where BOARD_NUM=?";
 		try{
 			conn = ds.getConnection();
 			pstmt=conn.prepareStatement(board_sql);
 			pstmt.setInt(1, num);
 			rs=pstmt.executeQuery();
 			rs.next();
 			
 			if(pass.equals(rs.getString("BOARD_PASS"))){
 				return true;
 			}
 		}catch(SQLException ex){
 			System.out.println("isBoardWriter ���� : "+ex);
 		}
 	finally{
 			try{
 			if(pstmt!=null)pstmt.close();
 			if(conn!=null) conn.close();
 			}
 			catch(Exception ex){}
 		
 	}
 		return false;
 	}

 }
 	