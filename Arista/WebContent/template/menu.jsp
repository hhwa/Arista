<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<style>
#menu_back{
width:150px;
height:8px;

}
#menu_list{
width:120px;
height:8px;
}
</style>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>menu</title>
</head>
<body>
<br><br><br>

	<table id="menu_back" align="center">
		<td align="center"><a href=mypage.action><h4><b>마이페이지</b></h4></a>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">내 정보</td></tr>
		<tr><td align="left">팀 검색<td></tr>
		<tr><td align="left">내가 쓴 매치글</td></tr>
		<tr><td align="left">내가 신청한 매치글</td></tr>
	</table><br><br>
	
	<table id="menu_back" align="center">
		<td align="center"><a href=selectMatch.action><h4><b>매치</b></h4></a>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">팀 매치</td></tr>
		<tr><td align="left"><a href=SoloList.action>솔로 매치</a><td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
		<td align="center"><h4><b>팀</b></h4>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">마이팀</td></tr>
		<tr><td align="left">팀 정보<td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
		<td align="center"><h4><b>경기장</b></h4>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">경기장 정보</td></tr>
	</table><br><br>

	<table id="menu_back" align="center">
		<td align="center"><h4><b>고객센터</b></h4>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">공지사항</td></tr>
		<tr><td align="left">Q&A<td></tr>
		<tr><td align="left">FAQ<td></tr>
	</table><br><br>

</body>
</html>