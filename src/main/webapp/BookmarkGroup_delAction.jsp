<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookMark.BookMarkGroup" %>
<%@page import="bookMark.BookMarkOption" %>	
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); // 건너오는 데이터를 UTF-8로 받음%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크 그룹 삭제</title>
</head>

<%-- 북마크 그룹 관리 페이지에서 특정 번호(bookmarkID)를 매개변수로 하여 데이터를 삭제하는 페이지 --%>
<body>
	<%
	int bookmarkID = Integer.parseInt(request.getParameter("bookmarkID"));	
	 
	BookMarkOption bookmarkOption = new BookMarkOption();
	
	int result = bookmarkOption.delBookmarkGroup(bookmarkID);

	
		if (result == -1) { // 삭제 실패
	%>	
		<script type="text/javascript">
			alert("북마크 삭제를 실패했습니다!");
			location.href="BookmarkGroup_Manage.jsp";
		</script>
	<%		
		} else { // 삭제 성공
	%>
		<script type="text/javascript">
			alert("북마크를 삭제하였습니다!");
			location.href="BookmarkGroup_Manage.jsp";
		</script>
	<%
		}
	%>
	
</body>
</html>