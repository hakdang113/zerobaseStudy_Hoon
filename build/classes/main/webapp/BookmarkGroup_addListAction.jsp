<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bookMark.BookMarkOption" %>
<%@page import="bookMarkList.BookMarkListOption" %>		
<%@page import="Mission1DB.WifiInfo" %>
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); // 건너오는 데이터를 UTF-8로 받음%> 
<jsp:useBean id="bookMarkList" class="bookMarkList.BookMarkList" scope="page" />
<jsp:useBean id="Mission1DB" class="Mission1DB.WifiInfo" scope="page" />
<jsp:setProperty name="bookMarkList" property="bmkName" />
<jsp:setProperty name="Mission1DB" property="x_SWIFI_MAIN_NM" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>북마크 목록 추가</title>
</head>

<%-- 와이파이 정보 구하기(상세정보) 페이지에서 북마크 이름, 관리번호를 입력 받아 추가 처리하는 페이지 --%>
<body>
	<%
		BookMarkListOption bookMarkListOption = new BookMarkListOption();
		int result = bookMarkListOption.addBookMarkList(bookMarkList.getBmkName(), Mission1DB.getX_SWIFI_MAIN_NM());
		
		if (result == -1) { // 추가 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('북마크에 추가되지 못했습니다!')");
			script.println("location.href = 'Mission1_Home.jsp'");
			script.println("</script>");
		}
	
		else { // 추가 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('북마크에 추가하였습니다!')");
			script.println("location.href = 'Mission1_Home.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>