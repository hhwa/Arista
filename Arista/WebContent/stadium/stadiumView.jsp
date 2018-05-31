<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경기장 정보</title>
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
           <td align="center"><h2>경기장 정보</h2></td>
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
       <td bgcolor="#F4F4F4">번호</td>
       <td bgcolor="#FFFFFF">
         &nbsp;&nbsp;<s:property value="resultClass.stadium_no" />
       </td>
       </tr>
       
       <tr bgcolor="#777777">
       <td height="1" colspan="2"></td>
       </tr>
       
       <tr>
       <td width="100" bgcolor="F4F4F4">경기장 이름</td>
       <td bgcolor="#FFFFFF">
         &nbsp;&nbsp;<s:property value="resultClass.stadium_name" />
         </td>
         </tr>
         
         <tr bgcolor="#777777">
         <td height="1" colspan="2"></td>
         </tr>
         
         <tr>
           <td width="100" bgcolor="F4F4F4">등록일</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.regdate" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
         <tr>
           <td width="100" bgcolor="F4F4F4">경기장  전화번호</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">경기장  주소</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_addr" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">경기장  우편번호</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_zipcode" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">예약가능날짜</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_day" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
          
          <tr>
           <td width="100" bgcolor="F4F4F4">이용가능 시간</td>
           <td bgcolor="#FFFFFF">
             &nbsp;&nbsp;<s:property value="resultClass.stadium_tel" />
             </td>
             </tr>
           
           <tr bgcolor="#777777">
             <td height="1" colspan="2"></td>
            </tr>
            
            <tr>
           <td width="100" bgcolor="F4F4F4">경기장  전화번호</td>
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
                     
                     <input name="list" type="button" value="수정" class="inputb" onClick="javascript:open_win_noresizable('checkForm.action?no=<s:property value="resultClass.stadium_no" />&currentPage=<s:property value="currentPage" />','modify')">
                     <input name="list" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('checkForm.action?no=<s:property value="resultClass.stadium_no" />&currentPage=<s:property value="currentPage" />','delete')">
                     
            
         
</body>
<body>

</body>
</html>