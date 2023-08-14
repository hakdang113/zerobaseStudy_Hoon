<%@page import="java.util.List"%>
<%@page import="bookMark.BookMarkGroup" %>
<%@page import="bookMark.BookMarkOption" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.ArrayList" %>

<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>북마크 그룹 관리</title>
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
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<% 
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
	<h2><b>북마크 그룹</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	<button onclick="window.location.href='BookmarkGroup_add.jsp'">북마크 그룹 이름 추가</button>
	</div>
 
    <table>
      	<thead>
				<tr>
					<th style=" text-align: center;">ID</th>
					<th style=" text-align: center;">북마크 이름</th>
					<th style=" text-align: center;">순서</th>
					<th style=" text-align: center;">등록일자</th>
					<th style=" text-align: center;">수정일자</th>
					<th style=" text-align: center;">비고</th>
				</tr>
		</thead>
				
		<tbody>
			<%
				BookMarkOption bmkOpt = new BookMarkOption();
				ArrayList<BookMarkGroup> bmkGroupList = bmkOpt.getBmkGroupList(pageNumber);
				for (int i=0; i < bmkGroupList.size(); i++) {
			%>	
			<tr>
				<td><%= bmkGroupList.get(i).getID() %></td>
				<td><%= bmkGroupList.get(i).getBookmarkName() %></a></td>
				<td><%= bmkGroupList.get(i).getRegisterNum() %></td>
				<td><%= bmkGroupList.get(i).getRegisterDate() %></td>
				<td><%= bmkGroupList.get(i).getEditDate() %></td>
				<td>
					<a href="BookmarkGroup_Edit.jsp?bookmarkID=<%=bmkGroupList.get(i).getID() %>" style=text-decoration-line:underline >수정</a>&nbsp;&nbsp;
					<a href="BookmarkGroup_delAction.jsp?bookmarkID=<%=bmkGroupList.get(i).getID() %>" style=text-decoration-line:underline >삭제</a>
				</td>					
			</tr>
			<%
				}			
			%>	
		</tbody>
	</table>

</body>
</html>