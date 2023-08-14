<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookMark.BookMarkGroup" %>
<%@page import="bookMark.BookMarkOption" %>	
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); // 건너오는 데이터를 UTF-8로 받음%> 
<jsp:useBean id="bookMark" class="bookMark.BookMarkGroup" scope="page" />
<jsp:setProperty name="bookMark" property="bookmarkName" />
<jsp:setProperty name="bookMark" property="registerNum" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>북마크 그룹 수정</title>
</head>

<%-- 북마크 그룹 관리 페이지에서 특정 번호(bookmarkID), 수정 이름, 수정 순서 번호를 매개변수로 하여 수정하는 페이지 --%>
<body>
	<%
	
		int bookmarkID = Integer.parseInt(request.getParameter("bookmarkID"));

		BookMarkGroup updateGroup = new BookMarkGroup(bookmarkID, bookMark.getBookmarkName(), bookMark.getRegisterNum());
		BookMarkOption bookMarkOption = new BookMarkOption();
		
		int result = bookMarkOption.editBookMarkGroup(updateGroup);
		
		
		if (result == -1) { // 수정 실패
	%>	
		<script type="text/javascript">
			alert("북마크 수정을 실패했습니다!");
			location.href = "BookmarkGroup_Manage.jsp?=bookmarkID=<%=updateGroup.getID()%>";
		</script>
	<%		
		} else { // 수정 성공
	%>
		<script type="text/javascript">
			alert("북마크를 수정하였습니다!");
			location.href = "BookmarkGroup_Manage.jsp?=bookmarkID=<%=updateGroup.getID()%>";
		</script>
	<%
		}
	%>
	
</body>
</html>