<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
     <title>stadium</title>
     <link rel="stylesheet" href="/css/css.css" type="text/css">
</head>
<body>
   <table width="600" border="0" cellspacing="0" cellspadding="2">
   
   <tr>
       <td align="center"><h2>경기장 목록</h2></td>
   </tr>
   <tr>
      <td height="20"></td>
   </tr>
   </table>
   
   <table width="600" border="0" cellspacing="0" cellpadding="2">
      <tr align="center" bgcolor="#F3F3F3">
          <td width="50"><strong>경기장이름</strong></td>
          <td width="350"><strong>경기장 내용</strong></td>
          <td width="70"><strong>경기장 전화번호</strong></td>
          <td width="100"><strong>경기장 주소</strong></td>
          <td width="70"><strong>경기장 이용가능시간</strong></td>
          
          </tr>
             <tr bgcolor="#777777">
                <td height="1" colspan="5"></td>
             </tr>
             
             <s:iterator value="list" status="stat">
             
             <s:url id="viewURL" action="viewAction">
                  
                  <s:param name="stadium_no">
                     <s:property value="stadium_no" />
                   </s:param>
                   <s:param name="currentPage">
                       <s:property value="currentPage" />
                   </s:param>
                </s:url>
                
                <tr bgcolor="#FFFFFF" align="center">
                     <td><s:property value="stadium_name" /></td>
                     <td align="left">&nbsp;<s:a href="%{viewURL}"><s:property value="stadium_cont" /></s:a></td>
                     <td align="center"><s:property value="stadium_tel" /></td>
                  <td align="center"><s:property value="stadium_addr" /></td>
                   <td align="center"><s:property value="stadium_time" /></td>
               
                 </tr>
                 <tr bgcolor="#777777">
                     <td height="1" colspan="5"></td>
                 </tr>
                 
                 </s:iterator>
                 
                 <s:if test="list.size() <= 0">
                 
                 <tr bgcolor="#FFFFFF" align="center">
                    <td colspan="5">등록된 게시물이 없습니다.</td>
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
                   <input type="button" value="글쓰기" class="inputb" onClick="javascript:location.href='writeForm.action?currentPage=<s:property value="currentPage" />';"></input>
                 </td>
              </tr>
               
   </table>
   
</body>
</html>