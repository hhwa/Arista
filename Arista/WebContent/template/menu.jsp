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
		<td align="center"><a href=mypage.action><h4><b>����������</b></h4></a>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">�� ����</td></tr>
		<tr><td align="left">�� �˻�<td></tr>
		<tr><td align="left">���� �� ��ġ��</td></tr>
		<tr><td align="left">���� ��û�� ��ġ��</td></tr>
	</table><br><br>
	
	<table id="menu_back" align="center">
		<tr>
			<td align="center"><h4><a href=selectMatch.action><b>��ġ</b></a></h4></td>
		</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="SoloMatchList.action">�ַ� ��ġ</a><td></tr>
		<tr><td align="left"><a href="TeamMatchList.action">�� ��ġ</a></td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
		<tr>
		<td align="center"><h4><a href="MyTeam.action"><b>��</b></a></h4></td>
		</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="MyTeam.action">������</a></td></tr>
		<tr><td align="left"><a href="TeamList.action">�� ���</a><td></tr>
	</table><br><br>
	
		<table id="menu_back" align="center">
			<tr>
			<td align="center"><h4><a href="stadiumList.action"><b>�����</b></a></h4></td>
			</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="stadiumList.action">����� ���</a></td></tr>
	</table><br><br>

	<table id="menu_back" align="center">
	<tr>
		<td align="center"><h4><a href="QNAList.action"><b>������</b></a></h4></td>
	</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left">��������</td></tr>
		<tr><td align="left"><a href="QNAList.action">Q&A</a></td></tr>
		<tr><td align="left">FAQ</td></tr>
	</table><br><br>
</body>
</html>