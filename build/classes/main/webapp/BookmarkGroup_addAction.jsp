<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>북마크 그룹 추가</title>
</head>

<%-- 북마크 그룹 추가 페이지에서 북마크 이름, 순서 번호를 입력 받아 추가 처리하는 페이지 --%>
<body>
	<%
		BookMarkOption bookMarkOption = new BookMarkOption();
		int result = bookMarkOption.addBookMarkGroup(bookMark.getBookmarkName(), bookMark.getRegisterNum());
		
		if (result == -1) { // 추가 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 북마크가 추가되지 못했습니다!')");
			script.println("location.href = 'BookmarkGroup_add.jsp'");
			script.println("</script>");
		}
	
		else { // 추가 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 북마크를 추가하였습니다!')");
			script.println("location.href = 'BookmarkGroup_Manage.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>