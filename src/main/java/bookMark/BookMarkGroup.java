package bookMark;


// DTO
public class BookMarkGroup {
	private int bookmarkID;
	private String BookmarkName;
	private int RegisterNum;
	private String RegisterDate;
	private String EditDate;
	
	
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
