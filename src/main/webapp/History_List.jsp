<%@page import="DBtest.Member"%>
<%@page import="java.util.List"%>
<%@page import="DBtest.MemberService"%>
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
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<a class="navbar-brand" href="Mission1_Home.jsp">와이파이 정보 구하기</a>
		</div>
		<div class="collapse navbar-collapse"
			id="wifi-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Histroy_List.jsp">위치 히스토리 목록</a></li>
				<li><a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a></li>
				<li><a href="BookmarkList.jsp">북마크 보기</a></li>
				<li><a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a></li>
			</ul>
		</div>
	</nav>

	<h2>
		<b>위치 히스토리 목록</b>
	</h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치
			히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a> | <a
			href="BookmarkList.jsp">북마크 보기</a> | <a
			href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a> <br></br>
	</div>
	
	<% 
			//String name = request.getParameter("name");	
	
			//MemberService memberService = new MemberService();
			//Member member = memberService.detail(name);

	%>

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

			for (int i=0; i < 5; i++) {
		%>
			<tr>
				<%-- 	<td><%= bmkList.get(i).getID() %></td>
				<td><%= bmkList.get(i).getBookmarkName() %></a></td>
				<td><%= bmkList.get(i).getRegisterNum() %></td>
				<td><%= bmkList.get(i).getRegisterDate() %></td>
				<td><%= bmkList.get(i).getEditDate() %></td> --%>
				<td>11</td> 
				<td>11</td> 
				<td>11</td> 
				<td>11</td> 
				<td><button onclick="window.location.href='History_delAction.jsp'">삭제</button></td>
			</tr>
		<%
			}			
		%>
		</tbody>
	</table>

</body>
</html>