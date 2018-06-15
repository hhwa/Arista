<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" href="/Arista/css/style.css?ver=1" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#Team_img{
   background-image: url('/Arista/template/image/Team.jpg');
   background-size:100%;
   padding: 100px
}
#Solo_img{
   background-image: url('/Arista/template/image/Solo.jpg');
   background-size:100%;
   padding: 100px
}
</style>
</head>
<body>
<table>
<tr><td height="40"></td></tr>
</table>

<div style="margin:auto;">
<table align="center" width="600">
   <tr><td height="40"></td></tr>
   <tr>
      <td align="center"><h1><a href="SoloMatchList.action"><img id="Solo_img"><br/><b>Solo</b></a></h1></td>
      <td align="center"><h1><a href="TeamMatchList.action"><img id="Team_img"><br/><b>Team</b></a></h1></td>
   </tr>
</table>
</div>
</body>
</html>