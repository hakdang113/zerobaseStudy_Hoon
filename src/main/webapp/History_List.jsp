<%@page import="java.util.List"%>
<%@page import="history.HistoryList" %>
<%@page import="history.HistoryListOption" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #444444;
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	border-color: #F9FFFF;
}

thead tr {
	background-color: #50C785;
	color: white;
}

tbody tr:nth-child(2n) {
	background-color: #dcdcdc;
}

tbody tr:nth-child(2n+1) {
	background-color: #EFEFEF;
}
</style>
</head>
<body>

	<h2>
		<b>위치 히스토리 목록</b>
	</h2>
	
	<% 
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치
			히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a> | <a
			href="BookmarkList.jsp">북마크 보기</a> | <a
			href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a> <br></br>
	</div>
	

	<table>
		<thead>
			<tr>
				<th style="text-align: center;">ID</th>
				<th style="text-align: center;">X좌표</th>
				<th style="text-align: center;">Y좌표</th>
				<th style="text-align: center;">조회일자</th>
				<th style="text-align: center;">비고</th>
			</tr>
		</thead>

		<tbody>
		<%
			HistoryListOption HistoryListOpt = new HistoryListOption();
			ArrayList<HistoryList> historyList = HistoryListOpt.getHistoryList(pageNumber);
			for (int i=0; i < historyList.size(); i++) {
		%>
			<tr>
				<td><%= historyList.get(i).getHistoryID() %></td>
				<td><%= historyList.get(i).getLat() %></a></td>
				<td><%= historyList.get(i).getLnt() %></td>
				<td><%= historyList.get(i).getSearchDate() %></td>
				<td>
					<a href="History_delAction.jsp?historyID=<%=historyList.get(i).getHistoryID() %>" style="text-decoration-line:underline">삭제</a>
				</td>			
			</tr>
		<%
			}			
		%>
		</tbody>
	</table>

</body>
</html>