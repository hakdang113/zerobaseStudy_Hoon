package Mission1DB;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


// DB와 연결하여 CRUD 작업 DAO
public class WifiInfoOption {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// WifiDAO
	public WifiInfoOption() {
		try {
			String dbUrl = "jdbc:mariadb://192.168.219.102:3306/testdb3";
			String dbUserId = "testuser3";
			String dbPassword = "zerobase";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbUrl, dbUserId, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
		// 근처 와이파이 정보 보기 (20개 출력)
		public List<WifiInfo> wifiList() {
			
			List<WifiInfo> wifiInfoList = new ArrayList<>();
			
			String sql = " select distinct * " + " from wifiinfo_total " + " limit 20 "; 
			try {
			pstmt = conn.prepareStatement(sql); // prepareStatement는 sql을 받아서 사용하므로 sql의 뒤쪽에 위치
			rs = pstmt.executeQuery(); // 쿼리 수행

				while (rs.next()) { // 결과 수행
					
//					int wifiDistance = 0;
					String X_SWIFI_MGR_NO = rs.getString("X_SWIFI_MGR_NO");                // 관리번호
					String X_SWIFI_WRDOFC = rs.getString("X_SWIFI_WRDOFC");;               // 자치구
					String X_SWIFI_MAIN_NM = rs.getString("X_SWIFI_MAIN_NM");;             // 와이파이명
					String X_SWIFI_ADRES1 = rs.getString("X_SWIFI_ADRES1");;               // 도로명주소
					String X_SWIFI_ADRES2 = rs.getString("X_SWIFI_ADRES2");;               // 상세주소
					String X_SWIFI_INSTL_FLOOR = rs.getString("X_SWIFI_INSTL_FLOOR");;     // 설치위치(층)
					String X_SWIFI_INSTL_TY = rs.getString("X_SWIFI_INSTL_TY");;           // 설치유형
					String X_SWIFI_INSTL_MBY = rs.getString("X_SWIFI_INSTL_MBY");;         // 설치기관
					String X_SWIFI_SVC_SE = rs.getString("X_SWIFI_SVC_SE");;               // 서비스구분
					String X_SWIFI_CMCWR = rs.getString("X_SWIFI_CMCWR");;                 // 망종류
					String X_SWIFI_CNSTC_YEAR = rs.getString("X_SWIFI_CNSTC_YEAR");;       // 설치년도
					String X_SWIFI_INOUT_DOOR = rs.getString("X_SWIFI_INOUT_DOOR");;       // 실내외구분
					String X_SWIFI_REMARS3 = rs.getString("X_SWIFI_REMARS3");;             // wifi접속환경
					String LNT = rs.getString("LNT");;                                     // X좌표
					String LAT = rs.getString("LAT");;                                     // Y좌표
					String WORK_DTTM = rs.getString("WORK_DTTM");;    
					
					
					WifiInfo wifiInfo = new WifiInfo();
					wifiInfo.setX_SWIFI_MGR_NO(X_SWIFI_MGR_NO);
					wifiInfo.setX_SWIFI_WRDOFC(X_SWIFI_WRDOFC);
					wifiInfo.setX_SWIFI_MAIN_NM(X_SWIFI_MAIN_NM);
					wifiInfo.setX_SWIFI_ADRES1(X_SWIFI_ADRES1);
					wifiInfo.setX_SWIFI_ADRES2(X_SWIFI_ADRES2);
					wifiInfo.setX_SWIFI_INSTL_FLOOR(X_SWIFI_INSTL_FLOOR);
					wifiInfo.setX_SWIFI_INSTL_TY(X_SWIFI_INSTL_TY);
					wifiInfo.setX_SWIFI_INSTL_MBY(X_SWIFI_INSTL_MBY);
					wifiInfo.setX_SWIFI_SVC_SE(X_SWIFI_SVC_SE);
					wifiInfo.setX_SWIFI_CMCWR(X_SWIFI_CMCWR);
					wifiInfo.setX_SWIFI_CNSTC_YEAR(X_SWIFI_CNSTC_YEAR);
					wifiInfo.setX_SWIFI_INOUT_DOOR(X_SWIFI_INOUT_DOOR);
					wifiInfo.setX_SWIFI_REMARS3(X_SWIFI_REMARS3);
					wifiInfo.setLNT(LNT);
					wifiInfo.setLAT(LAT);
					wifiInfo.setWORK_DTTM(WORK_DTTM);
					
					wifiInfoList.add(wifiInfo);
					
				}


			} catch (Exception e) {
				e.printStackTrace();
			} 
			return wifiInfoList;
		}
		
		
		// 와이파이 정보 상세보기
		public WifiInfo wifiDetail(String X_SWIFI_MGR_NO) {
			String sql = " select * from wifiinfo_total where X_SWIFI_MGR_NO = ? ";
			
			WifiInfo wifiInfo = null;
			try {
				pstmt = conn.prepareStatement(sql); 
				pstmt.setString(1, X_SWIFI_MGR_NO);

				rs = pstmt.executeQuery(); // 쿼리 수행

				if (rs.next()) { // 결과 수행
					 
					wifiInfo = new WifiInfo();
					wifiInfo.setX_SWIFI_MGR_NO(rs.getString("X_SWIFI_MGR_NO"));         // 관리번호
					wifiInfo.setX_SWIFI_WRDOFC(rs.getString(2));         // 자치구
					wifiInfo.setX_SWIFI_MAIN_NM(rs.getString(3));        // 와이파이명
					wifiInfo.setX_SWIFI_ADRES1(rs.getString(4));         // 도로명주소
					wifiInfo.setX_SWIFI_ADRES2(rs.getString(5));         // 상세주소
					wifiInfo.setX_SWIFI_INSTL_FLOOR(rs.getString(6));    // 설치위치(층)
					wifiInfo.setX_SWIFI_INSTL_TY(rs.getString(7));       // 설치유형
					wifiInfo.setX_SWIFI_INSTL_MBY(rs.getString(8));      // 설치기관
					wifiInfo.setX_SWIFI_SVC_SE(rs.getString(9));         // 서비스구분
					wifiInfo.setX_SWIFI_CMCWR(rs.getString(10));         // 망종류
					wifiInfo.setX_SWIFI_CNSTC_YEAR(rs.getString(11));    // 설치년도
					wifiInfo.setX_SWIFI_INOUT_DOOR(rs.getString(12));    // 실내외구분
					wifiInfo.setX_SWIFI_REMARS3(rs.getString(13));       // wifi접속환경
					wifiInfo.setLNT(rs.getString(14));                   // X좌표
					wifiInfo.setLAT(rs.getString(15));                   // Y좌표
					wifiInfo.setWORK_DTTM(rs.getString(16));             // 작업일자 
					
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
			return wifiInfo;
		}
		
		

		// 전체 데이터 불러오기(DB 저장)
		public Long LoadAllWifi(WifiInfo wifi) {
			String sql = " insert into wifiinfo_total" + 
				     " (X_SWIFI_MGR_NO, X_SWIFI_WRDOFC, X_SWIFI_MAIN_NM, X_SWIFI_ADRES1, X_SWIFI_ADRES2," + 
					 " X_SWIFI_INSTL_FLOOR, X_SWIFI_INSTL_TY, X_SWIFI_INSTL_MBY, X_SWIFI_SVC_SE, X_SWIFI_CMCWR," +
					 " X_SWIFI_CNSTC_YEAR, X_SWIFI_INOUT_DOOR, X_SWIFI_REMARS3, LNT, LAT, WORK_DTTM, list_total_count) " + 
					 " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
			try {
				// 17열
				pstmt = conn.prepareStatement(sql); // prepareStatement는 sql을 받아서 사용하므로 sql의 뒤쪽에 위치
				pstmt.setString(1, wifi.getX_SWIFI_MGR_NO());
				pstmt.setString(2, wifi.getX_SWIFI_WRDOFC());
				pstmt.setString(3, wifi.getX_SWIFI_MAIN_NM());
				pstmt.setString(4, wifi.getX_SWIFI_ADRES1());
				pstmt.setString(5, wifi.getX_SWIFI_ADRES2());
				pstmt.setString(6, wifi.getX_SWIFI_INSTL_FLOOR());
				pstmt.setString(7, wifi.getX_SWIFI_INSTL_TY());
				pstmt.setString(8, wifi.getX_SWIFI_INSTL_MBY());
				pstmt.setString(9, wifi.getX_SWIFI_SVC_SE());
				pstmt.setString(10, wifi.getX_SWIFI_CMCWR());
				pstmt.setString(11, wifi.getX_SWIFI_CNSTC_YEAR());
				pstmt.setString(12, wifi.getX_SWIFI_INOUT_DOOR());
				pstmt.setString(13, wifi.getX_SWIFI_REMARS3());
				pstmt.setString(14, wifi.getLNT());
				pstmt.setString(15, wifi.getLAT());
				pstmt.setString(16, wifi.getWORK_DTTM());
				pstmt.setLong(17, wifi.getList_total_count());
				
				pstmt.addBatch();
				pstmt.clearParameters();
				
				pstmt.executeBatch();
				

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return wifi.getList_total_count();
		}
		
		
		public void DelAllWifi() {
			String sql = " delete from wifiinfo_total ";
			
			try {
				pstmt = conn.prepareStatement(sql); // prepareStatement는 sql을 받아서 사용하므로 sql의 뒤쪽에 위치
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
}
		
		
		

