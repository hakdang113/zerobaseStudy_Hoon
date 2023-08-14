<%@page import="Mission1DB.WifiInfo" %>
<%@page import="Mission1DB.WifiInfoOption" %>
<%@page import="bookMarkList.BookMarkList" %>
<%@page import="bookMarkList.BookMarkListOption" %>
<%@page import="java.io.PrintWriter" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>북마크 삭제</title>
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
      
      th:nth-child(2n+1), td:nth-child(2n+1) { 
    	background-color: #50C785;
    	color: white;
	  }
    
      th:nth-child(2n), td:nth-child(2n) {
      	background-color: #eeeeee;
  	  }

</style>
</head>
<body>
		<%	
			int listID = Integer.parseInt(request.getParameter("listID"));	
	 
			BookMarkListOption bmkListOpt = new BookMarkListOption();
			BookMarkList bmkList = bmkListOpt.getBmkL(listID);
		%>
		<h2><b>와이파이 정보 구하기</b></h2>
		<div>
			<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| 	<a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
			<br></br>
		</div>
	<form method="post" action="BookmarkList_delAction.jsp?listID=<%=listID %>"">
		<table >
			<colgroup>
				<col style="width: 45%;" />
				<col style="width: 55%;" />
			</colgroup>
			<tbody>
				<tr>
					<th>이름</th>
					<td><%=bmkList.getBmkName() %></td>
				</tr>
				<tr>
					<th>와이파이명</th>
					<td><%=bmkList.getWifiName() %></td>
				</tr>
				<tr>
					<th>등록일자</th>
					<td><%=bmkList.getRegistDate() %></td>
				<tr>
			
			</tbody>
		</table>
		<center>
			<a href="BookmarkList.jsp" style="text-decoration-line:underline">돌아가기</a>
			<button class="btn btn-primary" align="center">삭제</button>
		</center>
	</form>

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>