<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>menu</title>
</head>
<body>
<br><br><br>
   <table class="myTable" align="center">
      <s:if test="#session.session_adminYN==1">
      <td><a href="adminMemList.action">������������</a>
      </s:if>   
      <s:else>
      <td><a href="mypage.action">MY PAGE</a>
      </s:else>   
   </table>
   
   <table class="myTable_List" align="center">
      <s:if test="#session.session_adminYN==1">
         <tr><td><a href="adminMemList.action">ȸ������</a></td>
         <tr><td><a href="soloMatchList.action">���θ�ġ����</a></td></tr>
      </s:if>
      <s:else>
      <tr height="8"><td></td></tr>
      <tr><td><a href="mypage.action">�� ����</a></td></tr>
      <tr><td><a href="MyTeam.action">���� ��</a><td></tr>
      <tr><td><a href="teamMatchInfo.action">���� �� ��ġ��</a></td></tr>
      <tr><td><a href="myMatchInfo.action">���� ��û�� ��ġ��</a></td></tr>
      <tr height="12"><td></td></tr>
      </s:else>
   </table>
      
   <table class="myTable" align="center">
      <tr><td><a href="selectMatch.action">MATCH</a></td></tr>
   </table>
   
   <table class="myTable_List" align="center">
      <tr height="8"><td></td></tr>
      <tr><td><a href="SoloMatchList.action">�ַ� ��ġ</a><td></tr>
      <tr><td><a href="TeamMatchList.action">�� ��ġ</a></td></tr>
      <tr height="12"><td></td></tr>
   </table>
   
   <table class="myTable" align="center">
      <tr><td><a href="MyTeam.action">TEAM</a></td></tr>
   </table>
   
   <table class="myTable_List" align="center">
      <tr height="8"><td></td></tr>
      <tr><td><a href="TeamList.action">�� ���</a><td></tr>
      <tr height="12"><td></td></tr>
   </table>
   
   <table class="myTable" align="center">
      <tr><td><a href="StadiumList.action">STADIUM</a></td></tr>
   </table>
   
   <table class="myTable_List" align="center">
      <tr height="8"><td></td></tr>
      <tr><td><a href="StadiumList.action">����� ���</a></td></tr>
      <tr height="12"><td></td></tr>
   </table>

   <table class="myTable" align="center">
      <tr><td><a href="FAQList.action">ABOUT</a></td>
   </tr>
   </table>
   
   <table class="myTable_List" align="center">
      <tr height="8"><td></td></tr>
      <tr><td><a href="noticeList.action">��������</a></td></tr>
      <tr><td><a href="QNAList.action">Q&A</a></td></tr>
      <tr><td><a href="FAQList.action">FAQ</a></td></tr>
      <tr height="12"><td></td></tr>
   </table><br><br>
</body>
</html>