<%@page import="java.util.List"%>
<%@page import="Mission1DB.WifiInfo" %>
<%@page import="Mission1DB.WifiInfoOption" %>
<%@page import="history.HistoryList" %>
<%@page import="history.HistoryListOption" %>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.css">
<title>와이파이 정보 구하기</title>
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
	
	<h2><b>와이파이 정보 구하기</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	</div>
	
	
	
	<div>
		<form method="post" action="History_addAction.jsp">>
			<label >LAT&nbsp;&nbsp;</label>
			<input type="text" name="lat" placeholder="0.0" maxlength="20" style="width:150px; height:25px;">&nbsp;&nbsp;&nbsp;&nbsp;
 			<label for="lNT">LNT&nbsp;&nbsp;</label>
 			<input type="text" name="lnt" placeholder="0.0" maxlength="20" style="width:150px; height:25px;">
			&nbsp;&nbsp; <input type="submit" value="내 위치 가져오기">&nbsp;&nbsp;
		</form>
	</div>
	
	<%
		HistoryList htyList = new HistoryList();	
	%>
	
	<div>
		<form method="post" action="NearWifiList.jsp">
			<input type="hidden" name="lat" value=<%=htyList.getLat() %>>
			<input type="hidden" name="lnt" value=<%=htyList.getLnt() %>>
			<button type="submit">근처 WIFI 정보 보기</button>&nbsp;&nbsp;
		</form>
	</div>
	
    <table>
    	<thead>
			<tr>
				<th style=" text-align: center;">거리(Km)</th>
				<th style=" text-align: center;">관리번호</th>
				<th style=" text-align: center;">자치구</th>
				<th style=" text-align: center;">와이파이명</th>
				<th style=" text-align: center;">도로명주소</th>
				<th style=" text-align: center;">상세주소</th>
				<th style=" text-align: center;">설치위치(층)</th>
				<th style=" text-align: center;">설치유형</th>
				<th style=" text-align: center;">설치기관</th>
				<th style=" text-align: center;">서비스구분</th>
				<th style=" text-align: center;">망종류</th>
				<th style=" text-align: center;">설치년도</th>
				<th style=" text-align: center;">실내외구분</th>
				<th style=" text-align: center;">WIFI 접속환경</th>
				<th style=" text-align: center;">X좌표</th>
				<th style=" text-align: center;">Y좌표</th>
				<th style=" text-align: center;">작업일자</th>
			</tr>
		</thead>	
	<tbody>
			<td colspan="17"> 위치 정보를 입력한 후에 조회해 주세요. </td>		
	</tbody>
	</table>
 		
</body>
</html>