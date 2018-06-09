<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>QNA</title>

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
    <td align="center"><h2>QNA</h2>
  </td>
  
  <tr>
    <td height="20"></td>
  </tr>
  
</table>

<table width="600" border="1" cellspacing="0" cellpadding="0" align="center">
 
  <tr>
    <td height="1" colspan="2"></td>
  </tr>
  
  <tr>
    <td>��ȣ</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.qna_no" />
    </td>
  </tr>
  
  <tr>
    <td width="100">����</td>
    <td width="500">
    &nbsp;&nbsp;<s:property value="resultClass.qna_subject" />
    </td>
  </tr>
  
  <tr>
    <td>�ۼ���</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.qna_id" />
    </td>
  </tr>
  
  <tr>
    <td>����</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.qna_content" />
    </td>
  </tr>
  
  <tr>
    <td>��ȸ��</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.readhit" />
    </td>
  </tr>
  
  <tr>
    <td>�����</td>
    <td>
    &nbsp;&nbsp;<s:property value="resultClass.qna_regdate" />
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
    <input name="list" type="button" value="�亯" 
    onClick="javascript:location.href='QNAReplyForm.action?qna_no=<s:property value="qna_no" />&currentPage=<s:property value="currentPage" />'">
      
    <input name="list" type="button" value="����" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&adminYN=<s:property value="#session.session_adminYN" />&qna_id=<s:property value="resultClass.qna_id" />&currentPage=<s:property value="currentPage" />','update')">
    
    <input name="list" type="button" value="����" 
    onClick="javascript:location.href='QNADelete.action?qna_no=<s:property value="qna_no" />&currentPage=<s:property value="currentPage" />'">
    </s:if>
          
    <s:elseif test="#session.session_id == resultClass.qna_id">
    <input name="list" type="button" value="����" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&currentPage=<s:property value="currentPage" />','update')">
     
    <input name="list" type="button" value="����" 
    onClick="javascript:open_win_noresizable('QNACheckForm.action?qna_no=<s:property value="resultClass.qna_no"
    />&currentPage=<s:property value="currentPage" />','delete')">
    </s:elseif>

    <input name="list" type="button" value="���" 
    onClick="javascript:location.href='QNAList.action?currentPage=<s:property value="currentPage" />'">
    
    </td>
  </tr>
  
</table>






</body>
</html>