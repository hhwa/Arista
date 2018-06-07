<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>팀 상세보기</title>
	<script type="text/javascript">
		function open_win_noresizable (url, name) {
			var oWin = window.open(url, name, "scrollbars=no,status=no,resizable=no,width=300,height=150");
		}
	</script>
</head>
  
  <body>
  
  	<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>팀 상세보기</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
	<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">     
 
		<tr>				
		<!-- <td width="100" bgcolor="F4F4F4"></td> -->
      		 <td bgcolor="#FFFFFF" colspan="2">
       		  &nbsp;&nbsp;<img width="200" height="200" src="<%= request.getContextPath()%>/teamimg/<s:property value="paramClass.file_savname" />"/>
       		  </td>
         </tr>
         
         
 	
    	 <tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
    	  </tr>
			
      <tr>
      	<td align="left">
        			<li>지역 : <s:property value="paramClass.team_area" /></li>
        			<li>연령대 : <s:property value="paramClass.team_age" /></li>
        			<li>실력 : <s:property value="paramClass.team_skill" /></li>
        			<li>간략한 소개 : <s:property value="paramClass.team_intro" /></li>
        		
        </td>
        
        		
        <td align="left">
        			<li>소속유형 : <s:property value="paramClass.team_type" /></li>
        			<li>팀원수 : <s:property value="paramClass.team_count" /></li>
        			<li>경기유형 : <s:property value="paramClass.team_fieldtype" /></li>
        </td>
      </tr>
      
      <s:url id="deleteURL" action="delete" >
				<s:param name="team_no">
					<s:property value="team_no" />
				</s:param>
	  </s:url>
	        
      <tr>
        <td align="right" colspan="2">
				
			<input name="list" type="button" value="수정" class="inputb" onClick="javascript:location.href='TeamModifyForm.action?team_no=<s:property value="team_no"/>&currentPage=<s:property value="currentPage"/>'">
					
			<input name="list" type="button" value="삭제" class="inputb" onClick="javascript:open_win_noresizable('deleteForm.action?no=<s:property value="paramClass.no" />&currentPage=<s:property value="currentPage" />','delete')">

			<input name="list" type="button" value="목록" class="inputb" onClick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'">

        </td>
      </tr>

  </table>
 </body>
</html>