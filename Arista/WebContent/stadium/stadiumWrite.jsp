<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� ���</title>
</head>

<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr>
         <td align="center"><h2>����� ���</h2></td>
      </tr>
          
   </table>
   
     <s:if test="resultClass == NULL">
        <form action="stadiumWrite.action" method="post" enctype="multipart/form-data">
     </s:if>
     
     <s:else>
       <form action="stadiumModify.action" method="post" enctype="multipart/form-data">
        <s:hidden name="stadium_no" value="%{resultClass.stadium_no}" />
        <s:hidden name="currentPage" value="%{currentPage}" />
        <s:hidden name="old_file" value="%{resultClass.stadium_main_img_save}" />
     </s:else>
        
        <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
         </tr>
         
         <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� �̸�</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� ��ȭ��ȣ</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_tel" theme="simple" value="%{resultClass.stadium_tel}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� �ּ�</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_addr" theme="simple" value="%{resultClass.stadium_addr}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� �����ȣ</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_zipcode" theme="simple" value="%{resultClass.stadium_zipcode}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� ��밡����</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_day" theme="simple" value="%{resultClass.stadium_day}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>����� ��밡�ɽð�</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_time" theme="simple" value="%{resultClass.stadium_time}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
              <tr>
                <td bgcolor="#F4F4F4">÷������</td>
                <td bgcolor="#FFFFFF">
                 <s:file name="upload" theme="simple" />
                 
                 <s:if test="resultClass.stadium_main_img_org != NULL" >
                       &nbsp; * <s:property value="resultClass.stadium_main_img_org" />������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
                 </s:if>
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
                   <input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
                   <input name="stadiumlist" type="button" value="���" class="inputb" onClick="javascript:location.href='stadiumList.action?currentPage=<s:property value="currentPage" />'">
                 </td>
                 </tr>
            </table>
           </form>
   

</body>
</html>