package bookMarkList;

public class BookMarkList {

	private int listID; // ID
	private String bmkName; // 북마크 이름
	private String wifiName; // 와이파이 이름
	private String registDate; // 등록 날짜 및 시간
	
	
	public int getListID() {
		return listID;
	}
	public void setListID(int listID) {
		this.listID = listID;
	}
	public String getBmkName() {
		return bmkName;
	}
	public void setBmkName(String bmkName) {
		this.bmkName = bmkName;
	}
	public String getWifiName() {
		return wifiName;
	}
	public void setWifiName(String wifiName) {
		this.wifiName = wifiName;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	
}
