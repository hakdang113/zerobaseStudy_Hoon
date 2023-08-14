<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="history.HistoryListOption" %>	
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); // 건너오는 데이터를 UTF-8로 받음%> 
<jsp:useBean id="history" class="history.HistoryList" scope="page" />
<jsp:setProperty name="history" property="lat" />
<jsp:setProperty name="history" property="lnt" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>위치 히스토리 추가</title>
</head>

<%-- 메인페이지에서 X좌표, Y좌표를 입력 받아 추가하는 페이지 --%>
<body>
	<%
		HistoryListOption historyOption = new HistoryListOption();
		int result = historyOption.addHistory(history.getLat(), history.getLnt());
		
		if (result == -1) { // 추가 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 위치 히스토리가 추가되지 못했습니다!')");
			script.println("location.href = 'Mission1_Home.jsp'");
			script.println("</script>");
		}
	
		else { // 추가 성공
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('새로운 위치 히스토리를 추가하였습니다!')");
			script.println("location.href = 'Mission1_Home.jsp'");
			script.println("</script>");
		}
	%>
</body>
</html>