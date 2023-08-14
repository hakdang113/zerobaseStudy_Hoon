package history;


public class HistoryList {
	private int historyID; // ID
	private double LAT; // X좌표
	private double LNT; // Y좌표
	private String SearchDate; // 조회 날짜 및 시간
	
	
	
	public int getHistoryID() {
		return historyID;
	}
	public void setHistoryID(int historyID) {
		this.historyID = historyID;
	}
	public double getLat() {
		return LAT;
	}
	public void setLat(double lat) {
		this.LAT = lat;
	}
	public double getLnt() {
		return LNT;
	}
	public void setLnt(double lnt) {
		this.LNT = lnt;
	}
	public String getSearchDate() {
		return SearchDate;
	}
	public void setSearchDate(String searchDate) {
		this.SearchDate = searchDate;
	}
	
}
