<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"></td>
  </tr>
  <tr>
    <td height="100"></td>
  </tr>
</table>
<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr align="center" class="bu_2">
    <td height="25" width="70">NO</td>
    <td align="center">제목</td>
    <td width="80">작성자</td>
    <td width="100">작성일</td>
    <td width="70">조회수</td>
  </tr>
  
<s:iterator value="list" status="stat">
  <s:url id="viewURL" action="noticeView">
    
    <s:param name="notice_no">
      <s:property value="notice_no"/>
    </s:param>
    
    <s:param name="currentPage">
      <s:property value="currentPage"/>
    </s:param>
    
  </s:url> 
<tr>
  <td height="5"></td>
</tr> 
<tr align="center">
  <td height="25"><s:property value="notice_no"/></td>
  <td align="left" style="padding:0px 0px 0px 25px;"><s:a href="%{viewURL}"><s:property value="notice_subject" /></s:a></td>
  <td align="center"><s:property value="notice_id" /></td>
  <td align="center"><s:property value="notice_regdate" /></td>
  <td><s:property value="readhit" /></td>
</tr>  
<tr>
  <td height="5"></td>
</tr>
<tr style="background-color: #2d2d30;"><td height="1" colspan="5"></td></tr>
  
</s:iterator>  
  
<s:if test="list.size() <= 0">
  
  <tr align="center">
    <td colspan="5">등록된 게시물이 없습니다.</td>
  </tr>
  
</s:if>  
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
<tr><td height="50"></td></tr>


<tr align="right">
  <td colspan="5">
  <s:if test="#session.session_adminYN eq 1">
  <input class="bu_2" type="button" style="width:125px; height:25px;" value="  글쓰기  " onClick="javascript:location.href='noticeWriteForm.action?currentPage=<s:property value="currentPage" />';">
  </s:if>
  </td>
</tr>
<tr align="center" height="50">
  <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
</tr>
<tr height="100"></tr>
</table>
</body>
</html>