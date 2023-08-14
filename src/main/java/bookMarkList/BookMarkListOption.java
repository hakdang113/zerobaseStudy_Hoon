package bookMarkList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// DAO
public class BookMarkListOption {

	private Connection conn;
	private ResultSet rs;

	
	
	public BookMarkListOption() {
		try {
			String dbUrl = "jdbc:mariadb://192.168.219.100:3306/testdb3";
			String dbUserId = "testuser3";
			String dbPassword = "zerobase";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUserId, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 추가 또는 수정 시 현재 시간을 가져오는 함수
	public String getDate() {
		String sql = "select now()";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ""; // 데이터베이스 오류
	}

	
	// 새롭게 추가될 북마크 ID 번호를 조정하기 위한 함수
	public int getNext() {
		String sql = "select listID from bookmarklist order by listID desc";
		// 내림차순으로 가장 마지막에 등록된 북마크의 ID 번호를 가져옴

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; // 첫번째 북마크인 경우
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	
	// 북마크 그룹 추가 함수
	public int addBookMarkList(String bmkName, String wifiName) {
		String sql = " insert into bookmarklist values (?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, bmkName);
			pstmt.setString(3, wifiName);
			pstmt.setString(4, getDate());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	// 북마크에 추가된 와이파이 목록을 보여주는 함수
	public ArrayList<BookMarkList> getBmkList(int pageNumber) {
		String sql = "select * from bookmarklist where listId < ? order by listId desc limit 20";
		ArrayList<BookMarkList> arrlist = new ArrayList<BookMarkList>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookMarkList bmarkList = new BookMarkList();
				bmarkList.setListID(rs.getInt(1));
				bmarkList.setBmkName(rs.getString(2));
				bmarkList.setWifiName(rs.getString(3));
				bmarkList.setRegistDate(rs.getString(4));
				arrlist.add(bmarkList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrlist;
	}
	
	
	
	// 특정 번호(bookmarkID) 북마크의 와아파이 정보 데이터를 가져오는 함수
	public BookMarkList getBmkL(int listID) {
		String sql = " select * from bookmarklist where listID = ? ";
		BookMarkList bmkList = null;

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, listID);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bmkList = new BookMarkList();
				bmkList.setListID(rs.getInt(1));
				bmkList.setBmkName(rs.getString(2));
				bmkList.setWifiName(rs.getString(3));
				bmkList.setRegistDate(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null && !rs.isClosed()) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bmkList;
	}
	
	

	// 특정 번호(listID)의 북마크에 저장된 와이파이 정보를 삭제하는 함수
	public int delBookmarkList(int listID) {
		String sql = " delete from bookmarklist where listID = ? ";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, listID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
}
