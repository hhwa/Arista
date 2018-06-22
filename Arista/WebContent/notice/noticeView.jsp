<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>

</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr>
    <td align="center"></td>
  <tr>
    <td height="100"></td>
  </tr>
</table>

<table width="600" cellspacing="0" cellpadding="0" align="center">
 

  <tr>
    <td width="70" class="bu_2" align="center">작성자</td>
    <td width="3"></td>
    <td width="160" class="under_pad"><s:property value="resultClass.notice_id" /></td> 
    <td width="3"></td>  
    <td width="60" align="center" class="bu_2">조회수</td>
    <td width="3"></td>
    <td width="60" align="center" class="under"><s:property value="resultClass.readhit" /></td>    
    <td width="3"></td>
    <td width="60" align="center" class="bu_2">등록일</td>
    <td width="3"></td>
    <td width="80" align="center" class="under">
    <s:property value="resultClass.notice_regdate" />
    </td>
  </tr>
  <tr>
    <td height="1"></td>
  </tr>
  <tr>
    <td class="bu_2" align="center">제목</td>
    <td width="3"></td>
    <td width="100" colspan="9" class="under_pad"> <s:property value="resultClass.notice_subject" />
    </td>
  </tr>
	<tr>
    <td height="1" colspan="2"></td>
  </tr>
  <tr>
    <td class="bu_2" align="center" height="130">내용</td>
    <td width="3"></td>
    <td width="100" colspan="9" class="under"><pre style="white-space:pre-wrap; background-color: #fff; border: none;"><s:property value="resultClass.notice_content" /></pre></td>
  </tr>
</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">
<tr height="30"><td></td></tr>
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
    <input class="bu_2" name="list" type="button" value="  수   정  " onclick="javascript:location.href='noticeUpdateForm.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />'">
      
    <input class="bu_2" name="list" type="button" value="  삭   제  " onclick="javascript:location.href='noticeDelete.action?notice_no=<s:property value="notice_no" />&currentPage=<s:property value="currentPage" />'">
    </s:if>
    
    <input class="bu_2" name="list" type="button" value="  목   록  " onclick="javascript:location.href='noticeList.action?currentPage=<s:property value="currentPage" />'">
    </td>
  </tr>
  <tr height="100"></tr>
</table>

</body>
</html>