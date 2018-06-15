<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center"><h2>Q&A</h2></td>
  </tr>
  <tr>
    <td height="20"></td>
  </tr>
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
  <tr align="center">
    <td width="50">NO</td>
    <td align="left" width="350">&nbsp;제목</td>
    <td width="70">ID</td>
    <td width="80">작성일</td>
    <td width="60">조회수</td>
  </tr>

<s:iterator value="list" status="stat">
  <s:url id="viewURL" action="QNAView">
    
    <s:param name="qna_no">
      <s:property value="qna_no"/>
    </s:param>
    
    <s:param name="currentPage">
      <s:property value="currentPage"/>
    </s:param>

  </s:url>
<tr align="center">
  <td><s:property value="qna_no"/></td>
  <td align="left">&nbsp;
  <s:if test="re_level != 0">
    <c:forEach var="i" begin="0" end="${re_level }"></c:forEach>→</s:if>
  <s:a href="%{viewURL}"><s:property value="qna_subject" /></s:a></td>
  <td align="center"><s:property value="qna_id" /></td>
  <td align="center"><s:property value="qna_regdate" /></td>
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

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
<tr align="center">
  <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
</tr>



<tr align="right">
  <td colspan="5">
  <s:if test="#session.session_id != null && #session.session_adminYN == 0">
  <input type="button" value="글쓰기" onClick="javascript:location.href='QNAWriteForm.action?currentPage=<s:property value="currentPage" />&qna_id=<s:property value="resultClass.qna_id" />';">
  </s:if>
  </td>
</tr>


<tr align="center">
  <td colspan="5">
    <form>
      <select name="topic">
        <option value="0">제목</option>
        <option value="1">작성자</option>
        <option value="2">내용</option>
      </select>
      <s:textfield name="search" theme="simple" value="" cssStyle="width:120px" maxlength="20"/>
      <input name="submit" type="submit" value="검색" class="inputb">
    </form>
  </td>
</tr>
</table>
</body>
</html>