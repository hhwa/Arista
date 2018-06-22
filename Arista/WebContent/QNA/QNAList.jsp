<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
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

<table width="600" cellspacing="0" cellpadding="0" align="center">
  <tr align="center" class="bu_2">
    <td height="25" width="70">NO</td>
    <td align="center">제목</td>
    <td width="80">ID</td>
    <td width="100">작성일</td>
    <td width="70">조회수</td>
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
  	<tr>
  		<td height="5"></td>
	</tr>
	<tr align="center">
  		<td height="25"><s:property value="qna_no"/></td>
  		<td align="left" style="padding:0px 0px 0px 25px;">
  		<s:if test="re_level != 0">
    		<c:forEach var="i" begin="0" end="${re_level }"></c:forEach>→</s:if>
  		<s:a href="%{viewURL}"><s:property value="qna_subject" /></s:a></td>
  		<td align="center"><s:property value="qna_id" /></td>
  		<td align="center"><s:property value="qna_regdate" /></td>
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
  		<s:if test="#session.session_id != null && #session.session_adminYN == 0">
  			<input class="bu_2" type="button" style="width:125px; height:25px;" value="  글쓰기  " onClick="javascript:location.href='QNAWriteForm.action?currentPage=<s:property value="currentPage" />&qna_id=<s:property value="resultClass.qna_id" />';">
  		</s:if>
	  	</td>
	</tr>
	<tr align="center" height="50">
  		<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
	</tr>


	<tr align="center" height="30">
  		<td colspan="5">
    	<form>
      		<select name="topic" class="bottom" id="bu_in">
        		<option value="0">제목</option>
        		<option value="1">작성자</option>
        		<option value="2">내용</option>
      		</select>&nbsp;&nbsp;
      		<s:textfield name="search" theme="simple" value="" cssClass="bottom" cssStyle="width:120px" maxlength="20"/>&nbsp;&nbsp;
      		<input name="submit" type="submit" style="width:125px;" value="검색" class="bu_2">
    	</form>
  		</td>
	</tr>
	<tr height="100"></tr>
</table>
</body>
</html>