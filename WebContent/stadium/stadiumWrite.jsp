<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="EUC-KR" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>경기장 등록</title>
<link rel="stylesheet" href="/css/css.css" type="text/css">
</head>

<body>
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr>
         <td align="center"><h2>경기장 등록</h2></td>
      </tr>
          
   </table>
   
     <s:if test="resultClass == NULL">
        <form action="StadiumWrite.action" method="post" enctype="multipart/form-data">
     </s:if>
     
     <s:else>
       <form action="StadiumModify.action" method="post" enctype="multipart/form-data">
        <s:hidden name="stadium_no" value="%{resultClass.stadium_no}" />
        <s:hidden name="currentPage" value="%{currentPage}" />
        <s:hidden name="old_file" value="%{resultClass.stadium_main_img_save}" />
        </s:else>
        
        <table width="600" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>는 필수 입력사항입니다.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
         </tr>
         
         <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 이름</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 전화번호</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_tel" theme="simple" value="%{resultClass.stadium_tel}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 주소</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_addr" theme="simple" value="%{resultClass.stadium_addr}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 우편번호</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_zipcode" theme="simple" value="%{resultClass.stadium_zipcode}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 사용가능일</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_day" theme="simple" value="%{resultClass.stadium_day}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
          <tr>
           <td width="100" bgcolor="#F4F4F4"><font color="FF0000">*</font>경기장 사용가능시간</td>
           <td width="500" bgcolor="#FFFFFF">
             <s:textfield name="stadium_time" theme="simple" value="%{resultClass.stadium_time}" cssStyle="width:370px" maxlength="50" />
             </td>
             </tr>
             
             <tr bgcolor="#777777">
               <td height="1" colspan="2"></td>
              </tr>
              
              <tr>
                <td bgcolor="#F4F4F4">첨부파일</td>
                <td bgcolor="#FFFFFF">
                 <s:file name="upload" theme="simple" />
                 
                 <s:if test="resultClass.stadium_main_img_org != NULL" >
                       &nbsp; * <s:property value="resultClass.stadium_main_img_org" />파일이 등록되어 있습니다. 다시 업로드하면 기존의 파일은 삭제됩니다.
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
                   <input name="submit" type="submit" value="작성완료" class="inputb">
                   <input name="stadiumlist" type="button" value="목록" class="inputb" onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'">
                 </td>
                 </tr>
            </table>
           </form>
   

</body>
</html>