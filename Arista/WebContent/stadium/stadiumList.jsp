<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<?xml version="1.0" encoding="euc-kr" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>����� ���</title>
   <link rel="stylesheet" href="/css/css.css" type="text/css"> 
</head>

<body>
    <table width="600" border="0" cellspacing="0" cellpadding="2">
         <tr>
              <td align="center"><h2>����� �Խ���</h2></td>
         </tr>
           <tr>
               <td height="20"></td>
           </tr>
    </table>
    
    <table width="600" border="0" cellspacing="0" cellpadding="2">
       <tr align="center" bgcolor="#F3F3F3">
         
         <td width="50"><strong>����� �̹���</strong></td>
         <td width="50"><strong>����� �̸�</strong></td>
         <td width="70"><strong>����� ��ȭ��ȣ</strong></td>
         <td width="100"><strong>����� �ּ�</strong></td>
         <td width="70"><strong>����� �̿밡�ɽð�</strong></td>
       </tr>
       
       
          <tr bgcolor="#777777">
              <td height="1" colspan="5"></td>
       </tr>
       
       <s:iterator value="list" status="stat">
       
       <s:url id="viewURL" action="stadiumviewAction" >
          <s:param name="stadium_no">
             <s:property value="stadium_no" />
             </s:param>
             <s:param name="currentPage">
                <s:property value="currentPage" />
             </s:param>
             </s:url>
             
             <tr bgcolor="#FFFFFF" align="center">
                
                <td align="center"><img src="<%= request.getContextPath()%>/upload/<s:property value="stadium_main_img_save" />" width="100" height="100"/>
                <td align="left"> &nbsp;<s:a href="%{viewURL}"><s:property value="stadium_name" /></s:a></td>
                <td align="center"><s:property value="stadium_tel" /></td>
                <td align="center"><s:property value="stadium_addr" /></td>
                <td align="center"><s:property value="stadium_time" /></td>
              </tr>
              <tr bgcolor="#777777">
                  <td height="1" colspan="5"></td>
              </tr>
              </s:iterator>
              
              <s:if test="list.size() <=0">
              
              <tr bgcolor="#FFFFFF" align="center">
                 <td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
              </tr>
              <tr bgcolor="#777777">
                 <td height="1" colspan="5"></td>
              </tr>
              </s:if>
              
              <tr align="center">
                <td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
              </tr>
              
              <tr align="right">
                 <td colspan="5">
                    <input type="button" value="����� ���" class="inputb" onClick="javascript:location.href='stadiumwriteFormAction.action?currentPage=<s:property value="currentPage" />';"></input> 
                 </td>
              </tr>
              
              <tr align="center">
                <td colspan="5">
                    <form>
                        <select name="SearchNum">
                          <option value="0">����� �̸�</option>
                          <option value="1">�����  �ּ�</option>
                          <option value="2">����� ��ȣ��ȣ</option>
                        </select>
                        <s:textfield name="SearchKeyword" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
                        <input name="submit" type="submit" value="�˻�" class="inputb">
                    </form>
                </td>
                
              </tr>
       
    </table>
    </body>


</html>