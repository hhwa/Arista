<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기장 정보</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=OzF4ASqUVlimy_abhPsf&submodules=geocoder"></script>
<link rel="stylesheet" href="/css/css.css" type="text/css">


</head>

<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>경기장 정보</h2></td>
		</tr>
		<tr>
			<td height="20"></td>
		</tr>
	</table>

	<table width="600" border="0" cellspacing="0" cellpadding="0">

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td bgcolor="#F4F4F4">번호</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="resultClass.stadium_no" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 이름</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property
					value="resultClass.stadium_name" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 이미지</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<img
				src="<%=request.getContextPath()%>/upload/<s:property value="resultClass.stadium_main_img_save" />" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">등록일</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_regdate" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 전화번호</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 주소</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_addr" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 우편번호</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_zipcode" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">예약가능날짜</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_day" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">이용가능 시간</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 전화번호</td>
			<td bgcolor="#FFFFFF">&nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
			</td>
		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>

		<tr>
			<td align="right" colspan="2">
		<tr>
			<td width="100" bgcolor="F4F4F4">경기장 지도</td>
			<td bgcolor="#FFFFFF">
				<div id="map" style="width: 100%; height: 300px;"></div> <script>
					var map = new naver.maps.Map('map');
					var myaddress = '${resultClass.stadium_addr}';

					naver.maps.Service
							.geocode(
									{
										address : myaddress
									},
									function(status, response) {
										if (status !== naver.maps.Service.Status.OK) {
											return alert(myaddress
													+ '의 검색 결과가 없거나 기타 네트워크 에러');
										}
										var result = response.result;

										var myaddr = new naver.maps.Point(
												result.items[0].point.x,
												result.items[0].point.y);
										map.setCenter(myaddr);

										var marker = new naver.maps.Marker({
											position : myaddr,
											map : map
										});

										naver.maps.Event.addListener(marker,
												"click", function(e) {
													if (infowindow.getMap()) {
														infowindow.close();
													} else {
														infowindow.open(map,
																marker);
													}
												});

										var infowindow = new naver.maps.InfoWindow(
												{
													content : '<h4> [네이버 개발자센터]</h4><a href="https://developers.naver.com" target="_blank"><img src="https://developers.naver.com/inc/devcenter/images/nd_img.png"></a>'
												});
									});
				</script>
			</td>


		</tr>

		<tr bgcolor="#777777">
			<td height="1" colspan="2"></td>
		</tr>



		<tr>
			<td align="right" colspan="2">
			<s:if test="#session.session_adminYN == 1">
				<input name="list" type="button" value="수정" class="inputb" onClick="javascript:location.href='StadiumModifyForm.action?stadium_no=<s:property value="stadium_no"/>&currentPage=<s:property value="currentPage"/>'">
				<input name="list" type="button" value="삭제" class="inputb"	onClick="javascript:location.href='StadiumDelete.action?stadium_no=<s:property value="stadium_no"/>&currentPage=<s:property value="currentPage"/>'">
			</s:if>
				<input name="list" type="button" value="목록" class="inputb"	onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'">
			<s:if test="teamInfoParam.team_admin != 0">
				<input name="list" type="button" value="경기장 신청" class="inputb"	onClick="javascript:location.href='StadiumApplyForm.action?stadium_no=<s:property value="stadium_no"/>&currentPage=<s:property value="currentPage"/>'">
			</s:if>
			</td>
		</tr>
	</table>



</body>
</html>
