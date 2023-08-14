package bookMark;


// DTO
public class BookMarkGroup {
	private int bookmarkID; // ID
	private String BookmarkName; // 북마크 이름
	private int RegisterNum; // 등록 순서
	private String RegisterDate; // 추가 날짜 및 시간
	private String EditDate; // 수정 날짜 및 시간
	
	
	public BookMarkGroup() {
		super();
	}
	
	// editAction.jsp에서 사용할 생성자
	public BookMarkGroup(int bookmarkID, String BookmarkName, int RegisterNum) {
		super();
		this.bookmarkID = bookmarkID;
		this.BookmarkName = BookmarkName;
		this.RegisterNum = RegisterNum;
	}
	
	public BookMarkGroup(int bookmarkID) {
		super();
		this.bookmarkID = bookmarkID;
	}
	
	
	
	public int getID() {
		return bookmarkID;
	}
	public void setID(int bookmarkID) {
		this.bookmarkID = bookmarkID;
	}
	public String getBookmarkName() {
		return BookmarkName;
	}
	public void setBookmarkName(String bookmarkName) {
		this.BookmarkName = bookmarkName;
	}
	public int getRegisterNum() {
		return RegisterNum;
	}
	public void setRegisterNum(int registerNum) {
		this.RegisterNum = registerNum;
	}
	public String getRegisterDate() {
		return RegisterDate;
	}
	public void setRegisterDate(String registerDate) {
		this.RegisterDate = registerDate;
	}
	public String getEditDate() {
		return EditDate;
	}
	public void setEditDate(String editDate) {
		this.EditDate = editDate;
	}
	
}
