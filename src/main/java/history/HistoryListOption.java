package history;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// DAO
public class HistoryListOption {

	private Connection conn;
	private ResultSet rs;

	
	
	public HistoryListOption() {
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
		String sql = "select historyID from historylist order by historyID desc";
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

	
	// 위치 히스토리 추가 함수
	public int addHistory(double lat, double lnt) {
		String sql = " insert into historylist values (?, ?, ?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext());
			pstmt.setDouble(2, lat);
			pstmt.setDouble(3, lnt);
			pstmt.setString(4, getDate());

			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	
	
	// 북마크에 추가된 와이파이 목록을 보여주는 함수
	public ArrayList<HistoryList> getHistoryList(int pageNumber) {
		String sql = "select * from historylist where historyID < ? order by historyID desc limit 20";
		ArrayList<HistoryList> arrlist = new ArrayList<HistoryList>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				HistoryList htyList = new HistoryList();
				htyList.setHistoryID(rs.getInt(1));
				htyList.setLat(rs.getDouble(2));
				htyList.setLnt(rs.getDouble(3));
				htyList.setSearchDate(rs.getString(4));
				arrlist.add(htyList);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return arrlist;
	}
	
	
	
	// 특정 번호(historyID)의 북마크에 저장된 와이파이 정보를 삭제하는 함수
	public int delHistoryList(int historyID) {
		String sql = " delete from historylist where historyID = ? ";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, historyID);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

	
	public boolean isNextPage(int pageNumber) {
		String sql = "select * from bookmarkgroup where bookMarkId < ? And insertName_available = 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
			rs = pstmt.executeQuery();
			if (rs.next()) { // 결과가 존재한다면
				return true; // true로 리턴 => 다음 페이지로 넘어갈 수 있음
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return false; // 다음 페이지로 넘어갈 수 없음
	}
}
