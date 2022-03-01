package gst;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class GstDAO {
	 
	private Connection conn;
	private ResultSet rs;
	
	public GstDAO() {
		try {
			String url="jdbc:oracle:thin:@//localhost:1521/xe";
			String user="system";
			String pwd="1234";
			
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public Date getDate() {
		String SQL="select SYSDATE FROM DUAL";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				return rs.getDate(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int getNext() {
		String SQL="select bbsID from gst order by bbsID desc";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우 반환
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	public int write(String bbsTitle, String userID, String bbsContent) {
		String SQL="insert into gst values(?,?,?,?,?,?)";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			System.out.println(bbsTitle+ "   "+bbsContent);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, userID);
			pstmt.setDate(4, getDate());
			pstmt.setString(5, bbsContent);
			pstmt.setInt(6, 1);
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	public ArrayList<Gst> getList(int pageNumber){
		String SQL="select * from gst order by BbsID desc";
		ArrayList<Gst> list = new ArrayList<Gst>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while (rs.next()) {
				Gst gst = new Gst();
				gst.setBbsID(rs.getInt(1));
				gst.setBbsTitle(rs.getString(2));
				gst.setUserID(rs.getString(3));
				gst.setBbsDate(rs.getDate(4));
				gst.setBbsContent(rs.getString(5));
				gst.setBbsAvailable(rs.getInt(6));
				list.add(gst);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean nextPage(int pageNumber) {
		String SQL="select * from gst where bbsID < ? AND BbsAvailable = 1";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 6);
			rs=pstmt.executeQuery();
			if (rs.next()) {
              return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;	
	}
	public Gst getGst (int bbsID) {
		String SQL="select * from Gst where bbsID=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			rs=pstmt.executeQuery();
			if (rs.next()) {
			Gst gst = new Gst();
gst.setBbsID(rs.getInt(1));
gst.setBbsTitle(rs.getString(2));
gst.setUserID(rs.getString(3));
gst.setBbsDate(rs.getDate(4));
gst.setBbsContent(rs.getString(5));
gst.setBbsAvailable(rs.getInt(6));
return gst;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int update(int bbsID, String bbsTitle, String bbsContent) {
		String SQL="UPDATE GST SET bbsTitle =?,bbsContent=? WHERE bbsID =?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			System.out.println(bbsTitle);
			pstmt.setString(1, bbsTitle);
			pstmt.setString(2, bbsContent);
			pstmt.setInt(3, bbsID);
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	public int delete(int bbsID) {
		String SQL="DELETE FROM GST WHERE bbsID =?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, bbsID);
			return pstmt.executeUpdate();

		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
}
