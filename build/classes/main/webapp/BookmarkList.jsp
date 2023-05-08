<%@page import="DBtest.Member"%>
<%@page import="DBtest.MemberService"%>
<%@page import="java.util.List"%>
<%@page import="Mission1DB.WifiInfo" %>
<%@page import="Mission1DB.WifiInfoOption" %>

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
			<a class= "navbar-brand" href="Mission1_Home.jsp">와이파이 정보 구하기</a>
		</div>
		<div class="collapse navbar-collapse" id="wifi-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="Histroy_List.jsp">위치 히스토리 목록</a></li>
				<li><a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a></li>
				<li><a href="BookmarkList.jsp">북마크 보기</a></li>
				<li><a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a></li>
			</ul>
		</div>
	</nav>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

	<% 
	
			// MemberService memberService = new MemberService();
			// List<Member> memberList = memberService.list();

			// WifiInfoOption wifiInfoOption = new WifiInfoOption();
			// List<WifiInfo> wifiList = wifiInfoOption.wifiList();
	%>
	<h2><b>북마크 목록</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	</div>
 
    <table>
      <thead>
					<tr>
						<th style=" text-align: center;">ID</th>
						<th style=" text-align: center;">북마크 이름</th>
						<th style=" text-align: center;">와이파이명</th>
						<th style=" text-align: center;">등록일자</th>
						<th style=" text-align: center;">비고</th>
					</tr>
		</thead>
				
		<tbody>
			<tr>
				<td>11</td>
				<td>11</td>
				<td>11</td>
				<td>11</td>
				<td><a href="BookmarkList_Del.jsp" style="text-decoration-line:underline">삭제</a></td>
				
		</tbody>
	</table>
	</div>
	</div>
		<% 
			//for(WifiInfo item : wifiList) {
		%>
			<%--
			<tr>
				<td>
					<a href="WifiDetail.jsp?name=<%=item.getX_SWIFI_MGR_NO()%>">
						<%=item.getX_SWIFI_MGR_NO()%>
					</a>
				</td>
				<td><%=item.getX_SWIFI_WRDOFC()%></td>
				<td><%=item.getX_SWIFI_MAIN_NM()%></td>
				<td><%=item.getX_SWIFI_ADRES1()%></td>
				<td><%=item.getX_SWIFI_ADRES2()%></td>
				<td><%=item.getX_SWIFI_INSTL_FLOOR()%></td>
				<td><%=item.getX_SWIFI_INSTL_TY()%></td>
				<td><%=item.getX_SWIFI_INSTL_MBY()%></td>
				<td><%=item.getX_SWIFI_SVC_SE()%></td>
				<td><%=item.getX_SWIFI_CMCWR()%></td>
				<td><%=item.getX_SWIFI_CNSTC_YEAR()%></td>
				<td><%=item.getX_SWIFI_INOUT_DOOR()%></td>
				<td><%=item.getX_SWIFI_REMARS3()%></td>
				<td><%=item.getLNT()%></td>
				<td><%=item.getLAT()%></td>
				<td><%=item.getWORK_DTTM()%></td>
				
			</tr>
			 --%>
		<% 		
			//}
	   	%>

		</tbody>
	</table>


</body>
</html>