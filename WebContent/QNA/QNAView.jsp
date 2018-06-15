<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Q&A</title>

<script type="text/javascript">
function open_win_noresizable (url, name){
	var oWin = window.open(url, name, 
			"scrollbars=no,status=no,resizable=no,width=300,height=150");
}

</script>
</head>
<body>

<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr>
    <td align="center"><h2>Q&A</h2>
  </td>
  
  <tr>
    <td height="20"></td>
  </tr>
  
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">

  <tr>
    <td width="50">&nbsp;&nbsp;아이디</td>
    <td width="160">
    &nbsp;&nbsp;<s:property value="resultClass.qna_id" />
    </td>
    <td width="60" align="center">조회수</td>
    <td width="60" align="center">
    <s:property value="resultClass.readhit" />
    </td>
    <td width="60" align="center">등록일</td>
    <td width="80" align="center">
    <s:property value="resultClass.qna_regdate" />
    </td>
  </tr>
  
  <tr>
    <td>&nbsp;&nbsp;제목</td>
    <td width="100" colspan="5">
    &nbsp;&nbsp;<s:property value="resultClass.qna_subject" />
    </td>
  </tr>

  <tr>
    <td>&nbsp;&nbsp;내용</td>
    <td width="100" colspan="5">
    &nbsp;&nbsp;<s:property value="resultClass.qna_content" />
    </td>
  </tr>


</table>

<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">

  <tr>
    <td align="right" colspan="2">
    
      <s:url id="updateURL" action="QNAUpdate">
        <s:param name="qna_no">
          <s:property value="qna_no"/>
        </s:param>
      </s:url>
      
      <s:url id="deleteURL" action="QNADelete">
        <s:param name="qna_no">
          <s:property value="qna_no" />
        </s:param>
      </s:url>

    <s:if test="#session.session_adminYN eq 1">
    <input name="list" type="button" value="답변" 
    onClick="javascript:location.href='QNAReplyForm.action?qna_no=<s:property value="qna_no" />&currentPage=<s:property value="currentPage" />'">
    </s:if>
    
    <s:if test="#session.session_adminYN eq 1 && #session.session_id == resultClass.qna_id">  
    <input name="list" type="button" value="수정" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&adminYN=<s:property value="#session.session_adminYN" />&qna_id=<s:property value="resultClass.qna_id" />&currentPage=<s:property value="currentPage" />','update')">
    </s:if>
    
    <s:if test="#session.session_adminYN eq 1">    
    <input name="list" type="button" value="삭제" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&adminYN=<s:property value="#session.session_adminYN" />&qna_id=<s:property value="resultClass.qna_id" />&currentPage=<s:property value="currentPage" />','delete')">
    </s:if>
          
    <s:if test="#session.session_adminYN eq 0 && #session.session_id == resultClass.qna_id">
    <input name="list" type="button" value="수정" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&currentPage=<s:property value="currentPage" />','update')">
    
     
    <input name="list" type="button" value="삭제" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&currentPage=<s:property value="currentPage" />','delete')">
    </s:if>

    <input name="list" type="button" value="목록" 
    onClick="javascript:location.href='QNAList.action?currentPage=<s:property value="currentPage" />'">
    
    </td>
  </tr>
  
</table>






</body>
</html>