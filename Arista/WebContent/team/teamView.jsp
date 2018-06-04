<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>팀 상세보기</title>
	
</head>
  
  <body>
  
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>팀 상세보기</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
	<table width="600" border="0" cellspacing="0" cellpadding="0">     
 
		<tr>				
		<!-- <td width="100" bgcolor="F4F4F4"></td> -->
      		 <td bgcolor="#FFFFFF" colspan="2">
       		  &nbsp;&nbsp;<img width="200" height="200" src="<%= request.getContextPath()%>/teamimg/<s:property value="resultClass.file_savname" />"/>
       		  </td>
         </tr>
         
         
 	
     <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
      	<td align="left">
        			<li>지역:<s:property value="resultClass.team_area" /></li>
        			<li>연령대:<s:property value="resultClass.team_age" /></li>
        			<li>실력:<s:property value="resultClass.team_skill" /></li>
        		
        </td>
        		
        <td align="left">
        			<li>소속유형:<s:property value="resultClass.team_fype" /></li>
        			<li>팀원수:<s:property value="resultClass.team_count" /></li>
        			<li>경기유형:<s:property value="resultClass.team_fieldtype" /></li>
        </td>
       <%--  <td bgcolor="#F4F4F4">  팀명 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_id" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  지역 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_area" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  소속유형 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_type" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  종목유형 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_fieldtype" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  연령대 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_age" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  실력 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_skill" />
        </td>
      </tr>
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  팀 인원 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_count" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td> --%>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  간략한 소개 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_intro" />
        </td>
      </tr>
      
      <tr>
        <td align="right" colspan="2">
				
			<input name="list" type="button" value="수정" class="inputb" onClick="javascript:location.href='teammodifyForm.action?team_no=<s:property value="team_no"/>&currentPage=<s:property value="currentPage"/>'">
					
			<input name="list" type="button" value="삭제" class="inputb" onClick="javascript:location.href='teamlistAction.action?currentPage=<s:property value="currentPage" />'">

			<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='teamlistAction.action?currentPage=<s:property value="currentPage" />'">

        </td>
      </tr>

  </table>
 </body>
</html>