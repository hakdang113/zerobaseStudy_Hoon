<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="history.HistoryList" %>
<%@page import="history.HistoryListOption" %>	
<%@page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); // 건너오는 데이터를 UTF-8로 받음%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>위치 히스토리 삭제</title>
</head>

<%-- 위치 히스토리 페이지에서 특정 번호(historyID)를 매개변수로 하여 데이터를 삭제하는 페이지 --%>
<body>
	<%
	int historyID = Integer.parseInt(request.getParameter("historyID"));	
	 
	HistoryListOption htyOption = new HistoryListOption();
	
	int result = htyOption.delHistoryList(historyID);

	
		if (result == -1) { // 삭제 실패
	%>	
		<script type="text/javascript">
			alert("위치 히스토리 삭제를 실패했습니다!");
			location.href="History_List.jsp";
		</script>
	<%		
		} else { // 삭제 성공
	%>
		<script type="text/javascript">
			alert("위치 히스토리 삭제하였습니다!");
			location.href="History_List.jsp";
		</script>
	<%
		}
	%>
	

</body>
</html>