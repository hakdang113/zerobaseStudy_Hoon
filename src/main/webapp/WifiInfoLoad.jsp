<%@page import="Mission1DB.WifiInfo"%>
<%@page import="Mission1DB.WifiInfoOption"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.net.*"%>
<%@page import="java.io.*"%>
<%@page import="java.text.ParseException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request. setCharacterEncoding("UTF-8"); %>
<%response. setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		h1 {
			text-align : center;
		}
		a {
			text-align : center;
		}
	</style>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<%
		WifiInfoOption wfOpt = new WifiInfoOption();
		wfOpt.DelAllWifi();
	
		String totalCnt = "";
	
		for (int k = 1; k <= 23331; k++) {
	
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /* URL */
		urlBuilder.append(
				"/" + URLEncoder.encode("4c43644e4a68616b3430797346656d", "UTF-8")); /* 인증키 (sample사용시에는 호출시 제한됩니다.) */
		urlBuilder.append("/" + URLEncoder.encode("json", "UTF-8"));
		urlBuilder.append("/" + URLEncoder.encode("TbPublicWifiInfo", "UTF-8")); /* 서비스명 (대소문자 구분 필수입니다.) */
		urlBuilder.append("/" + URLEncoder.encode(Integer.toString(k), "UTF-8")); /* 요청시작위치 (sample인증키 사용시 5이내 숫자) */
		urlBuilder.append("/" + URLEncoder.encode(Integer.toString(k), "UTF-8")); /* 요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨) */
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.

		try {
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			conn.setDoOutput(true);
			StringBuilder sb = new StringBuilder();

		
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			while (br.ready()) {
				sb.append(br.readLine());
			}
			conn.disconnect();
		
			String sbResult = sb.toString();

			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(sbResult);
			JSONObject TbPublicWifiInfo = (JSONObject) obj.get("TbPublicWifiInfo");
			JSONArray row = (JSONArray) TbPublicWifiInfo.get("row");
		
			WifiInfo wifi; 
			WifiInfoOption wifiInfoOption;

		
			for (int i = 0; i < row.size(); i++) {
				wifi = new WifiInfo();
				wifiInfoOption = new WifiInfoOption();
				JSONObject Wifi = (JSONObject) row.get(i);
				String X_SWIFI_MGR_NO = String.valueOf(Wifi.get("X_SWIFI_MGR_NO")); // 관리번호
				String X_SWIFI_WRDOFC = String.valueOf(Wifi.get("X_SWIFI_WRDOFC")); // 자치구
				String X_SWIFI_MAIN_NM = String.valueOf(Wifi.get("X_SWIFI_MAIN_NM")); // 와이파이명
				String X_SWIFI_ADRES1 = String.valueOf(Wifi.get("X_SWIFI_ADRES1")); // 도로명주소
				String X_SWIFI_ADRES2 = String.valueOf(Wifi.get("X_SWIFI_ADRES2")); // 상세주소
				String X_SWIFI_INSTL_FLOOR = String.valueOf(Wifi.get("X_SWIFI_INSTL_FLOOR")); // 설치위치(층)
				String X_SWIFI_INSTL_TY = String.valueOf(Wifi.get("X_SWIFI_INSTL_TY")); // 설치유형
				String X_SWIFI_INSTL_MBY = String.valueOf(Wifi.get("X_SWIFI_INSTL_MBY")); // 설치기관
				String X_SWIFI_SVC_SE = String.valueOf(Wifi.get("X_SWIFI_SVC_SE")); // 서비스구분
				String X_SWIFI_CMCWR = String.valueOf(Wifi.get("X_SWIFI_CMCWR")); // 망종류
				String X_SWIFI_CNSTC_YEAR = String.valueOf(Wifi.get("X_SWIFI_CNSTC_YEAR")); // 설치년도
				String X_SWIFI_INOUT_DOOR = String.valueOf(Wifi.get("X_SWIFI_INOUT_DOOR")); // 실내외구분
				String X_SWIFI_REMARS3 = String.valueOf(Wifi.get("X_SWIFI_REMARS3")); // wifi접속환경
				String LAT = String.valueOf(Wifi.get("LNT")); // X좌표
				String LNT= String.valueOf(Wifi.get("LAT")); // Y좌표
				String WORK_DTTM = String.valueOf(Wifi.get("WORK_DTTM")); // 작업일자
				String list_totalCnt = String.valueOf(TbPublicWifiInfo.get("list_total_count"));
			
			
				wifi.setX_SWIFI_MGR_NO(X_SWIFI_MGR_NO);
				wifi.setX_SWIFI_WRDOFC(X_SWIFI_WRDOFC);
				wifi.setX_SWIFI_MAIN_NM(X_SWIFI_MAIN_NM);
				wifi.setX_SWIFI_ADRES1(X_SWIFI_ADRES1);
				wifi.setX_SWIFI_ADRES2(X_SWIFI_ADRES2);
				wifi.setX_SWIFI_INSTL_FLOOR(X_SWIFI_INSTL_FLOOR);
				wifi.setX_SWIFI_INSTL_TY(X_SWIFI_INSTL_TY);
				wifi.setX_SWIFI_INSTL_MBY(X_SWIFI_INSTL_MBY);
				wifi.setX_SWIFI_SVC_SE(X_SWIFI_SVC_SE);
				wifi.setX_SWIFI_CMCWR(X_SWIFI_CMCWR);
				wifi.setX_SWIFI_CNSTC_YEAR(X_SWIFI_CNSTC_YEAR);
				wifi.setX_SWIFI_INOUT_DOOR(X_SWIFI_INOUT_DOOR);
				wifi.setX_SWIFI_REMARS3(X_SWIFI_REMARS3);
				wifi.setLAT(LAT);
				wifi.setLNT(LNT);
				wifi.setWORK_DTTM(WORK_DTTM);
				wifi.setList_total_count(list_totalCnt);
			
			
				totalCnt = wifiInfoOption.LoadAllWifi(wifi);

				br.close();
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
	%>
	<div> 
		<h1> <%=totalCnt %>개의 와이파이 정보를 정상적으로 저장하였습니다!</h1>
		<center>
			<a href="Mission1_Home.jsp" style="text-decoration-line:underline">홈으로 돌아가기</a>
		</center>
	</div>

</body>
</html>