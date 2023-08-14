package Mission1DB;

// DTO
public class WifiInfo {
	// 데이터를 저장하는 wifi 정보에 대한 클래스
		
	// 18개
	
		// 거리(Km)
		private double DISTANCE;
		// 관리번호
		private  String X_SWIFI_MGR_NO;
		// 자치구
		private  String X_SWIFI_WRDOFC;
		// 와이파이명
		private  String X_SWIFI_MAIN_NM;
		// 도로명주소
		private  String X_SWIFI_ADRES1;
		// 상세주소
		private  String X_SWIFI_ADRES2;
		// 설치위치(층)
		private  String X_SWIFI_INSTL_FLOOR;
		// 설치유형
		private  String X_SWIFI_INSTL_TY;
		// 설치기관
		private  String X_SWIFI_INSTL_MBY;
		// 서비스구분
		private  String X_SWIFI_SVC_SE;
		// 망종류
		private  String X_SWIFI_CMCWR;
		// 설치년도
		private  String X_SWIFI_CNSTC_YEAR;
		// 실내외구분
		private  String X_SWIFI_INOUT_DOOR;
		// wifi접속환경
		private  String X_SWIFI_REMARS3;
		// X좌표
		private  String LAT;
		// Y좌표
		private  String LNT;
		// 작업일자
		private  String WORK_DTTM;
		// 총 개수
		private  String list_total_count;
	
		


	// Getter & Setter
	// 외부에서 데이터에 접근하기 위해서는 Getter & Setter를 통해 접근

		public double getDistance() {
			 return DISTANCE;
		 }
		public void setDistance(double distance) {
			 this.DISTANCE = distance;
		}
		public String getX_SWIFI_MGR_NO() {
			return X_SWIFI_MGR_NO;
		}
		public void setX_SWIFI_MGR_NO(String x_SWIFI_MGR_NO) {
			this.X_SWIFI_MGR_NO = x_SWIFI_MGR_NO;
		}
		public String getX_SWIFI_WRDOFC() {
			return X_SWIFI_WRDOFC;
		}
		public void setX_SWIFI_WRDOFC(String x_SWIFI_WRDOFC) {
			this.X_SWIFI_WRDOFC = x_SWIFI_WRDOFC;
		}
		public String getX_SWIFI_MAIN_NM() {
			return X_SWIFI_MAIN_NM;
		}
		public void setX_SWIFI_MAIN_NM(String x_SWIFI_MAIN_NM) {
			this.X_SWIFI_MAIN_NM = x_SWIFI_MAIN_NM;
		}
		public String getX_SWIFI_ADRES1() {
			return X_SWIFI_ADRES1;
		}
		public void setX_SWIFI_ADRES1(String x_SWIFI_ADRES1) {
			this.X_SWIFI_ADRES1 = x_SWIFI_ADRES1;
		}
		public String getX_SWIFI_ADRES2() {
			return X_SWIFI_ADRES2;
		}
		public void setX_SWIFI_ADRES2(String x_SWIFI_ADRES2) {
			this.X_SWIFI_ADRES2 = x_SWIFI_ADRES2;
		}
		public String getX_SWIFI_INSTL_FLOOR() {
			return X_SWIFI_INSTL_FLOOR;
		}
		public void setX_SWIFI_INSTL_FLOOR(String x_SWIFI_INSTL_FLOOR) {
			this.X_SWIFI_INSTL_FLOOR = x_SWIFI_INSTL_FLOOR;
		}
		public String getX_SWIFI_INSTL_TY() {
			return X_SWIFI_INSTL_TY;
		}
		public void setX_SWIFI_INSTL_TY(String x_SWIFI_INSTL_TY) {
			this.X_SWIFI_INSTL_TY = x_SWIFI_INSTL_TY;
		}
		public String getX_SWIFI_INSTL_MBY() {
			return X_SWIFI_INSTL_MBY;
		}
		public void setX_SWIFI_INSTL_MBY(String x_SWIFI_INSTL_MBY) {
			this.X_SWIFI_INSTL_MBY = x_SWIFI_INSTL_MBY;
		}
		public String getX_SWIFI_SVC_SE() {
			return X_SWIFI_SVC_SE;
		}
		public void setX_SWIFI_SVC_SE(String x_SWIFI_SVC_SE) {
			this.X_SWIFI_SVC_SE = x_SWIFI_SVC_SE;
		}
		public String getX_SWIFI_CMCWR() {
			return X_SWIFI_CMCWR;
		}
		public void setX_SWIFI_CMCWR(String x_SWIFI_CMCWR) {
			this.X_SWIFI_CMCWR = x_SWIFI_CMCWR;
		}
		public String getX_SWIFI_CNSTC_YEAR() {
			return X_SWIFI_CNSTC_YEAR;
		}
		public void setX_SWIFI_CNSTC_YEAR(String x_SWIFI_CNSTC_YEAR) {
			this.X_SWIFI_CNSTC_YEAR = x_SWIFI_CNSTC_YEAR;
		}
		public String getX_SWIFI_INOUT_DOOR() {
			return X_SWIFI_INOUT_DOOR;
		}
		public void setX_SWIFI_INOUT_DOOR(String x_SWIFI_INOUT_DOOR) {
			this.X_SWIFI_INOUT_DOOR = x_SWIFI_INOUT_DOOR;
		}
		public String getX_SWIFI_REMARS3() {
			return X_SWIFI_REMARS3;
		}
		public void setX_SWIFI_REMARS3(String x_SWIFI_REMARS3) {
			this.X_SWIFI_REMARS3 = x_SWIFI_REMARS3;
		}
		public String getLAT() {
			return LAT;
		}
		public void setLAT(String lAT) {
			this.LAT = lAT;
		}		
		public String getLNT() {
			return LNT;
		}
		public void setLNT(String lNT) {
			this.LNT = lNT;
		}		
		public String getWORK_DTTM() {
			return WORK_DTTM;
		}
		public void setWORK_DTTM(String wORK_DTTM) {
			this.WORK_DTTM = wORK_DTTM;
		}
		public String getList_total_count() {
			 return list_total_count;
		 }
		public void setList_total_count(String list_total_count) {
			 this.list_total_count = list_total_count;
		}
		
}

		
