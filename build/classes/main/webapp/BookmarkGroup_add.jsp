<%@page import="java.util.List"%>
<%@page import="bookMark.BookMarkOption" %>
<%@page import="java.io.PrintWriter" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
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
      
      th:nth-child(2n+1), td:nth-child(2n+1) { 
    	background-color: #50C785;
    	color: white;
	  }
    
      th:nth-child(2n), td:nth-child(2n) { 
     	background-color: #d2d2d2;
  	  }

</style>
</head>

<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<h2><b>북마크 그룹 추가</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	</div>
	

	<form method="post" action="BookmarkGroup_addAction.jsp">
		<table>
		<colgroup>
			<col style="width: 30%;"/>
			<col style="width: 70%;"/>
		</colgroup>
				<tbody>
					<tr>
						<th>북마크 이름</th>
						<td>
							<input type="text" class="form-control" placeholder="북마크 이름" name="bookmarkName" maxlength="20" required>
						</td>
					</tr>
					<tr>	
						<th>순서</th>
						<td>
							<input type="text" class="form-control" placeholder="순서" name="registerNum" maxlength="2" required>
						</td>
					</tr>
				</tbody>
		</table>
		<center>
			<button class="btn btn-primary" align="center" >추가</button>
		</center>
	</form>

</body>
</html>