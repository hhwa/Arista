<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="EUC-KR" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>����� ��û</title>
<link rel="stylesheet" href="/css/css.css" type="text/css">
</head>

<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr>
         <td align="center"><h2>����� ��û</h2></td>
      </tr>
          
   </table>
   
     
       <form action="StadiumApply.action" method="post" enctype="multipart/form-data">
        <s:hidden name="stadium_no" value="%{resultClass.stadium_no}" />
        <s:hidden name="currentPage" value="%{currentPage}" />
        <s:hidden name="stadium_name" value="%{resultClass.stadium_name}" />
        
        
        
        <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"></td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
         </tr>
         
        <tr>
         <td width="100" bgcolor="F4F4F4">����� ��ȣ</td>
         <td bgcolor="#FFFFFF">
         &nbsp;&nbsp;<s:property value="resultClass.stadium_no" />
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr> 
         
        <tr>
         <td width="100" bgcolor="F4F4F4">����� �̸�</td>
         <td bgcolor="#FFFFFF">
         &nbsp;&nbsp;<s:property value="resultClass.stadium_name" />
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr>
         
         <tr>
         <td width="100" bgcolor="F4F4F4">��û��</td>
         <td bgcolor="#FFFFFF">
         <s:if test="#session.m_session == null">
                       �α��ΰ��� ����
         </s:if>
         <s:if test="#session.m_session != null">
         &nbsp;&nbsp;<s:property value="session_id"/>
         </s:if>
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr>
              
          <tr>
       <td width="100" bgcolor="F4F4F4">���� ��ȣ</td>
       <td bgcolor="#FFFFFF">
         <s:textfield name="game_no" theme="simple" maxlength="50" />
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr>
              
             <tr>
       <td width="100" bgcolor="F4F4F4">�����</td>
       <td bgcolor="#FFFFFF">
          <s:textfield name="game_day" theme="simple" maxlength="50" />
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr>
              
         
                
                <tr>
                 <td height="10" colspan="2"></td>
                 </tr>
                 
                 <tr>
                 <td align="right" colspan="2">
                   <input name="submit" type="submit" value="��û�Ϸ�" class="inputb">
                   <input name="stadiumlist" type="button" value="���" class="inputb" onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'">
                 </td>
                 </tr>
            </table>
           </form>
   

</body>
</html>