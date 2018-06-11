<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><h2>공지사항</h2></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0">
  <tr align="center">
    <td width="50">NO</td>
    <td align="left" width="350">&nbsp;제목</td>
    <td width="70">작성자</td>
    <td width="80">등록일</td>
    <td width="60">조회수</td>
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
<tr align="center">
  <td><s:property value="notice_no"/></td>
  <td><s:a href="%{viewURL}"><s:property value="notice_subject" /></s:a></td>
  <td align="center"><s:property value="notice_id" /></td>
  <td align="center"><s:property value="notice_regdate" /></td>
  <td><s:property value="readhit" /></td>
</tr>  
<tr>
  <td height="1" colspan="5"></td>
</tr>
  
</s:iterator>  
  
<s:if test="list.size() <= 0">
  
  <tr align="center">
    <td colspan="5">등록된 게시물이 없습니다.</td>
  </tr>
  
</s:if>  
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0">
<tr align="center">
  <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
</tr>

<tr>
  <td colspan="5">
  </td>
</tr>


<tr align="right">
  <td colspan="5">
  <s:if test="#session.session_adminYN eq 1">
  <input type="button" value="글쓰기" onClick="javascript:location.href='noticeWriteForm.action?currentPage=<s:property value="currentPage" />';">
  </s:if>
  </td>
</tr>

</table>
</body>
</html>