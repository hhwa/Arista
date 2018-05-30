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
      
     <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  팀명 </td>
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
      
      <tr>
        <td bgcolor="#F4F4F4">  팀 인원 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_count" />
        </td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  간략한 소개 </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_intro" />
        </td>
      </tr>
      
          <tr>
        <td align="right" colspan="2">
        
	        <s:url id="modifyURL" action="modifyForm" >
				<s:param name="team_no">
					<s:property value="team_no" />
				</s:param>
	        </s:url>
					
	        <s:url id="deleteURL" action="deleteAction" >
				<s:param name="no">
					<s:property value="no" />
				</s:param>
	        </s:url>
				
	<input name="list" type="button" value="수정" class="inputb" onClick="javascript:location.href='teamView.action?team_no=<s:property value="resultClass.team_no" />&currentPage=<s:property value="currentPage" />','modify')">
					
	<input name="list" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('checkForm.action?no=<s:property value="resultClass.no" />&currentPage=<s:property value="currentPage" />','delete')">

	<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">

        </td>
      </tr>

  </table>
 </body>
</html>