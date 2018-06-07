<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
		<tr>
			<td align="center"><h4><a href=selectMatch.action><b>매치</b></a></h4></td>
		</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="SoloMatchList.action">솔로 매치</a><td></tr>
		<tr><td align="left"><a href="TeamMatchList.action">팀 매치</a></td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
		<tr>
		<td align="center"><h4><a href="MyTeam.action"><b>팀</b></a></h4></td>
		</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="MyTeam.action">마이팀</a></td></tr>
		<tr><td align="left"><a href="TeamList.action">팀 목록</a><td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
			<tr>
			<td align="center"><h4><a href="stadiumList.action"><b>경기장</b></a></h4></td>
			</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="stadiumList.action">경기장 목록</a></td></tr>
	</table><br><br>

	<table id="menu_back" align="center">
	<tr>
		<td align="center"><h4><a href="QNAList.action"><b>고객센터</b></a></h4></td>
	</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">공지사항</td></tr>
		<tr><td align="left"><a href="QNAList.action">Q&A</a></td></tr>
		<tr><td align="left">FAQ</td></tr>
	</table><br><br>
</body>
</html>