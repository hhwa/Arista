<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
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
		<s:if test="#session.session_adminYN==1">
		<td align="center"><a href="adminMemList.action"><h4><b>������������</b></h4></a>
		</s:if>	
		<s:else>
		<td align="center"><a href="mypage.action"><h4><b>����������</b></h4></a>
		</s:else>	
	</table>
	
	<table id="menu_list" align="center">
		<s:if test="#session.session_adminYN==1">
			<tr><td align="left"><a href="adminMemList.action">ȸ������</a></td>
			<tr><td align="left"><a href="soloMatchList.action">���θ�ġ����</a></td></tr>
		</s:if>
		<s:else>
		<tr><td align="left"><a href="mypage.action">�� ����</a></td></tr>
		<tr><td align="left"><a href="MyTeam.action">���� ��</a><td></tr>
		<tr><td align="left"><a href="teamMatchInfo.action">���� �� ��ġ��</a></td></tr>
		<tr><td align="left"><a href="myMatchInfo.action">���� ��û�� ��ġ��</a></td></tr>
		</s:else>
	</table><br><br>
		
	<table id="menu_back" align="center">
		<tr>
			<td align="center"><h4><a href="selectMatch.action"><b>��ġ</b></a></h4></td>
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
			<td align="center"><h4><a href="StadiumList.action"><b>�����</b></a></h4></td>
			</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="StadiumList.action">����� ���</a></td></tr>
	</table><br><br>

	<table id="menu_back" align="center">
	<tr>
		<td align="center"><h4><a href="FAQList.action"><b>������</b></a></h4></td>
	</tr>
	</table>
	
	<table id="menu_list" align="center">
		<tr><td align="left"><a href="noticeList.action">��������</a></td></tr>
		<tr><td align="left"><a href="QNAList.action">Q&A</a></td></tr>
		<tr><td align="left"><a href="FAQList.action">FAQ</a></td></tr>
	</table><br><br>
</body>
</html>