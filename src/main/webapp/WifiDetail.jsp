<%@page import="Mission1DB.WifiInfo" %>
<%@page import="Mission1DB.WifiInfoOption" %>
<%@page import="bookMark.BookMarkGroup" %>
<%@page import="bookMark.BookMarkOption" %>
<%@page import="java.io.PrintWriter" %>
<%@page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
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
			String X_SWIFI_MGR_NO = request.getParameter("X_SWIFI_MGR_NO");
			WifiInfoOption wifiInfoOpt = new WifiInfoOption();
			WifiInfo wfInfo = wifiInfoOpt.wifiDetail(X_SWIFI_MGR_NO);
			BookMarkOption bmkOption = new BookMarkOption();
			ArrayList<BookMarkGroup> bmkList = bmkOption.getBmkNameList();
		%>
	<h2><b>와이파이 정보 구하기</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	</div>
	
	<div>
		<form method="post" action="BookmarkGroup_addListAction.jsp">
			<select name="bmkName">
				<option>북마크 그룹 이름 선택</option>
				<% 
					for(int i=0; i < bmkList.size(); i++){
				%>			 
  					<option value=<%=bmkList.get(i).getBookmarkName() %>><%=bmkList.get(i).getBookmarkName() %></option>
  				<% 
					}
				%>		 
			</select>&nbsp;&nbsp; 
			<input type="hidden" name="x_SWIFI_MAIN_NM" value=<%=wfInfo.getX_SWIFI_MAIN_NM() %>>
			<input type="submit" value="북마크 추가하기" >&nbsp;&nbsp;
		</form>
	</div>
	
	<table>
		<colgroup>
			<col style="width: 45%;" />
			<col style="width: 55%;" />
		</colgroup>
		<tbody>
			<tr>
				<th>거리(Km)</th>
				<td>

				</td>
			</tr>
			<tr>
				<th>관리번호</th>
				<td><%=wfInfo.getX_SWIFI_MGR_NO() %></td>
			</tr>
			<tr>
				<th>자치구</th>
				<td><%=wfInfo.getX_SWIFI_WRDOFC() %></td>
			</tr>
			<tr>
				<th>와이파이명</th>
				<td><%=wfInfo.getX_SWIFI_MAIN_NM() %></td>
			</tr>
			<tr>
				<th>도로명주소</th>
				<td><%=wfInfo.getX_SWIFI_ADRES1() %></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><%=wfInfo.getX_SWIFI_ADRES2() %></td>
			</tr>
			<tr>
				<th>설치위치(층)</th>
				<td><%=wfInfo.getX_SWIFI_INSTL_FLOOR() %></td>
			</tr>
			<tr>
				<th>설치유형</th>
				<td><%=wfInfo.getX_SWIFI_INSTL_TY() %></td>
			</tr>
			<tr>
				<th>설치기관</th>
				<td><%=wfInfo.getX_SWIFI_INSTL_MBY() %></td>
			</tr>
			<tr>
				<th>서비스구분</th>
				<td><%=wfInfo.getX_SWIFI_SVC_SE() %></td>
			</tr>
			<tr>
				<th>망종류</th>
				<td><%=wfInfo.getX_SWIFI_CMCWR() %></td>
			</tr>
			<tr>
				<th>설치년도</th>
				<td><%=wfInfo.getX_SWIFI_CNSTC_YEAR() %></td>
			</tr>
			<tr>
				<th>실내외구분</th>
				<td><%=wfInfo.getX_SWIFI_INOUT_DOOR() %></td>
			</tr>
			<tr>
				<th>WIFI 접속환경</th>
				<td><%=wfInfo.getX_SWIFI_REMARS3() %></td>
			</tr>
			<tr>
				<th>X좌표</th>
				<td><%=wfInfo.getLAT() %></td>
			</tr>
			<tr>
				<th>Y좌표</th>
				<td><%=wfInfo.getLNT() %></td>
			</tr>
			<tr>
				<th>작업일자</th>
				<td><%=wfInfo.getWORK_DTTM() %></td>
			</tr>
			
		</tbody>
	</table>
	<center>
		<a href="NearWifiList.jsp" class="btn btn-primary">목록</a>
	</center>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>