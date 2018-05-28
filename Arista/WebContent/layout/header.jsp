<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>header</title>
<style>
.affix {
	top: 0;
	width: 100%;
}

.affix+.container-fluid {
	padding-top: 70px;
}
</style>
</head>
<body>
	<!-- 헤더 -->
	<div class="container-fluid"
		style="background-color: #FFF; color: #fff; height: 70px;">
		<a href="/main/main.action"><img src="/Arista/layout/image/logo.png" /></a>
	</div>

	<!-- 메뉴바 -->
	<nav class="navbar navbar-inverse" data-spy="affix"
		data-offset-top="197">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li class="active"><a href="main.action"><span
					class="glyphicon glyphicon-home"></span>&nbsp;메인</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="sboardList.action?sboard_cate=0">마이페이지<span
					class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="sboardList.action?sboard_cate=0">축구 게시판</a></li>
					<li><a href="recruitList.action?recruit_sport_no=0">축구
							회원모집 게시판</a></li>
					<li><a href="clubRegisterForm.action?club_sport_no=0">축구
							동호회 등록</a></li>
				</ul></li>
			

		</ul>
	</div>
	</nav>
</body>
</html>