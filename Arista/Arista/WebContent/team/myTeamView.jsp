<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>My Team</title>
</head>
<body>
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td><h2>My Team</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
	
	<s:if test="memParam.myteam == null">
	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td><h3>My Team�� �����ϴ�.</h3></td>
  		</tr>
 	</table>
 	
 	<table align="center" width="600" border="0" cellspacing="0" cellpadding="2">	
 		<tr>
  			<td><input name="list" type="button" value="�� ���� �ϱ�" class="inputb" onClick="javascript:location.href='http://localhost:8080/Arista/team/makeTeam.jsp'"></td>
  		</tr>
  		
  		<tr>
  			<td height="20"></td>
  		</tr>
  		
  		<tr>
  			<td><input name="list" type="button" value="�� ��û ���" class="inputb" onClick="javascript:location.href='teamlistAction.action?currentPage=<s:property value="currentPage" />'"></td>
		</tr>
	</table>
	</s:if>
	<s:elseif test="memParam.myteam !=null">
		<table width="600" border="0" cellspacing="0" cellpadding="0" align="center">     
 
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
    		  <td colspan="2" width="300">My Team : <s:property value="resultClass.team_id" /></td>
		</tr>
		
		<tr bgcolor="#777777">
        	<td height="1" colspan="2"></td>
    	  </tr>
    	  
      <tr>
      	<td align="left">
        			<li>���� : <s:property value="resultClass.team_area" /></li>
        			<li>���ɴ� : <s:property value="resultClass.team_age" /></li>
        			<li>�Ƿ� : <s:property value="resultClass.team_skill" /></li>
        			<li>������ �Ұ� : <s:property value="resultClass.team_intro" /></li>
        		
        </td>
        
        		
        <td align="left">
        			<li>�Ҽ����� : <s:property value="resultClass.team_type" /></li>
        			<li>������ : <s:property value="resultClass.team_count" /></li>
        			<li>������� : <s:property value="resultClass.team_fieldtype" /></li>
        </td>
      </tr>
      
      <s:url id="deleteURL" action="delete" >
				<s:param name="team_no">
					<s:property value="team_no" />
				</s:param>
	  </s:url>
	        
      <tr>
        <td align="right" colspan="2">
				
			<input name="list" type="button" value="����" class="inputb" onClick="javascript:location.href='TeamModifyForm.action?team_no=<s:property value="team_no"/>&currentPage=<s:property value="currentPage"/>'">
					
			<input name="list" type="button" value="����" class="inputb" onClick="javascript:open_win_noresizable('deleteForm.action?no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />')">			

			<input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'">

        </td>
      </tr>

  </table>
  </s:elseif>
  	
</body>
</html>