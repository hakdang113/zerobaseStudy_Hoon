<%@page import="java.util.List"%>
<%@page import="Mission1DB.WifiInfo" %>
<%@page import="Mission1DB.WifiInfoOption" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- 디바이스 해상도에 맞게 설정되는 부분 --%>
<%-- <meta name="viewport" content="width=device-width", initial-scale="1">--%>
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
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
	
	<h2><b>와이파이 정보 구하기</b></h2>
	<div>
		<a href="Mission1_Home.jsp">홈</a> | <a href="History_List.jsp">위치 히스토리 목록</a> | <a href="WifiInfoLoad.jsp">Open API 와이파이 정보 가져오기</a>
		| <a href="BookmarkList.jsp">북마크 보기</a> | <a href="BookmarkGroup_Manage.jsp">북마크 그룹 관리</a>
		<br></br>
	</div>
	
	
	
	<div>
		<form method="post" action="NearWifiList?bookmarkID=<% %>.jsp"> 
 			LNT : <input type="text" class="form-control" placeholder= "X좌표" name= "LNT" maxlength="20" style="width:150px; height:25px;" > 
 			LAT : <input type="text" class="form-control" placeholder= "Y좌표" name= "LAT" maxlength="20" style="width:150px; height:25px;" >
 		
			<button>내 위치 가져오기</button>&nbsp;&nbsp; 
		</form>
		<script>
		function success(position) {
			let latitude = position.coords.latitude;
			let longitude = position.coords.longitude;
			
			for(let i=0; i<.length; i++) {
			}
		}
		
		function fail() {
			
		}
		
		function distance(lat1, lon1, lat2, lon2) {
			  const R = 6371; // 지구 반지름 (단위: km)
			  const dLat = deg2rad(lat2 - lat1);
			  const dLon = deg2rad(lon2 - lon1);
			  const a = Math.sin(dLat/2) * Math.sin(dLat/2) +
			            Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) *
			            Math.sin(dLon/2) * Math.sin(dLon/2);
			  const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
			  const distance = R * c; // 두 지점 간의 거리 (단위: km)
			  return distance;
			}

			function deg2rad(deg) {
			  return deg * (Math.PI/180);
			}

			// 예시: 서울과 부산 간의 거리를 계산합니다.
			const seoulLat = 37.5665;
			const seoulLon = 126.9780;
			const busanLat = 35.1796;
			const busanLon = 129.0756;
			const dist = distance(seoulLat, seoulLon, busanLat, busanLon);
			console.log(dist); // 출력: 325.4961911409085
		
		(function() {
			navigator.geolocation.getCurrentPosition(success, fail)
		})()
	</script>
		<form method="post" action="NearWifiList.jsp">
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