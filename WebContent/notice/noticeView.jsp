<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>

</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td align="center"><h2>공지사항</h2>
  </td>
  
  <tr>
    <td height="20"></td>
  </tr>
  
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0">
 

  <tr>
    <td width="70">작성자</td>
    <td width="160">
    &nbsp;&nbsp;<s:property value="resultClass.notice_id" />
    </td>   
    <td width="70">조회수</td>
    <td width="100">
    &nbsp;&nbsp;<s:property value="resultClass.readhit" />
    </td>    <td width="70">등록일</td>
    <td width="100">
    &nbsp;&nbsp;<s:property value="resultClass.notice_regdate" />
    </td>
  </tr>
  
  <tr>
    <td>제목</td>
    <td width="100" colspan="5">
    &nbsp;&nbsp;<s:property value="resultClass.notice_subject" />
    </td>
  </tr>

  
  <tr>
    <td>내용</td>
    <td width="100" colspan="5">
    &nbsp;&nbsp;<s:property value="resultClass.notice_content" />
    </td>
  </tr>
  

</table>

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="right" colspan="2">
    
      <s:url id="updateURL" action="noticeUpdate">
        <s:param name="notice_no">
          <s:property value="notice_no"/>
        </s:param>
      </s:url>
      
      <s:url id="deleteURL" action="noticeDelete">
        <s:param name="notice_no">
          <s:property value="notice_no" />
        </s:param>
      </s:url>
    <s:if test="#session.session_adminYN eq 1">
    <input name="list" type="button" value="수정" 
    onClick="javascript:location.href='noticeUpdateForm.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />'">
      
    <input name="list" type="button" value="삭제" 
    onClick="javascript:location.href='noticeDelete.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />'">
    </s:if>
    
    <input name="list" type="button" value="목록" 
    onClick="javascript:location.href='noticeList.action?currentPage=<s:property value="currentPage" />'">
    </td>
  </tr>
</table>

</body>
</html>