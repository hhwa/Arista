<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ����</title>
<link rel="stylesheet" href="/css/css.css" type="text/css">

<script type="text/javascript">
   function open_win_noresizable(url, name){
	   var oWin = window.open(url,name,"scrollbars=no,status=no,resizable=no,width=300,height=150");
	   }
   </script>
</head>

<body>
    <table width="600" border="0" cellspacing="0" cellpadding="2">
        <tr>
           <td align="center"><h2>����� ����</h2></td>
        </tr>
        <tr>
             <td height="20"></td>
        </tr> 
    </table>
    
 <table width="600" border="0" cellspacing="0" cellpadding="0">
 
      <tr bgcolor="#777777">
       <td height="1" colspan="2"></td>
       </tr>
       
       <tr>
       <td bgcolor="#F4F4F4">��ȣ</td>
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
           <td width="100" bgcolor="F4F4F4">�����</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.regdate" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
         <tr>
           <td width="100" bgcolor="F4F4F4">�����  ��ȭ��ȣ</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">�����  �ּ�</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_addr" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">�����  �����ȣ</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_zipcode" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">���డ�ɳ�¥</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_day" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
          
          <tr>
           <td width="100" bgcolor="F4F4F4">�̿밡�� �ð�</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">�����  ��ȭ��ȣ</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
             <td align="right" colspan="2">
             
                <s:url id="stadiummodifyURL" action="stadiummodifyForm">
                 <s:param name="stadium_no">
                 <s:property value="stadium_no" />
                 </s:param>
                 </s:url>
                 
                 <s:url id="stadiumdeleteURL" action="stadiumdeleteAction" >
                     <s:param name="stadium_no">
                     <s:property value="stadium_no" />
                     </s:param>
                     </s:url>
                     
                     <input name="list" type="button" value="����" class="inputb" onClick="javascript:open_win_noresizable('checkForm.action?no=<s:property value="resultClass.stadium_no" />&currentPage=<s:property value="currentPage" />','modify')">
                     <input name="list" type="button" value="����" class="inputb" onClick="javascript:open_win_noresizable('checkForm.action?no=<s:property value="resultClass.stadium_no" />&currentPage=<s:property value="currentPage" />','delete')">
                     
            
         
</body>
<body>

</body>
</html>