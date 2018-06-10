<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.HashMap" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Team List</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
  		<tr>
  			<td align="center"><h2>�� ���</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="800" border="0" cellspacing="0" cellpadding="2" align="center">
	      <tr align="center" bgcolor="#F3F3F3">
      		<td width="50"><strong>��ȣ</strong></td>
			<td colspan="2" width="300"><strong>����</strong></td>
        	<td colspan="2" width="400"><strong>�� ����</strong></td>
       		<td width="50"><strong>��û</strong></td>
         </tr>
<tr bgcolor="#777777">
        		<td height="1" colspan="6"></td>
      	      </tr>

	      <s:iterator value="list" status="stat">

		<s:url id="viewURL" action="TeamView" >
			<s:param name="team_no">
				<s:property value="team_no" />
			</s:param>
			<s:param name="currentPage">
				<s:property value="currentPage" />
			</s:param>
		</s:url>
			
     	      <tr bgcolor="#FFFFFF"  align="center">
        		<td><s:property value="team_no" /></td>
        		<td align="center"> &nbsp;<img width="60" height="60" src="<%= request.getContextPath()%>/teamimg/<s:property value="file_savname"/>"/>
        		</td>
        		<td align="left">
        			<s:property value="team_id" />
        		</td>
        		<td align="left" onclick="location.href='TeamView.action?team_no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />'">
        			<li>���� : <s:property value="team_area" /></li>
        			<li>���ɴ� : <s:property value="team_age" /></li>
        			<li>�Ƿ� : <s:property value="team_skill" /></li>
        		</td>
        		
        		<td align="left" onclick="location.href='TeamView.action?team_no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />'">
        			<li>�Ҽ����� : <s:property value="team_type" /></li>
        			<li>������ : <s:property value="team_count" /></li>
        			<li>������� : <s:property value="team_fieldtype" /></li>
        		</td>
				<td><input name="submit" type="submit" value="��û" class="inputb"></td> 
      	      </tr>
      	      <tr bgcolor="#777777">
        		<td height="1" colspan="6"></td>
      	      </tr>
      
	      </s:iterator>
			
	      <s:if test="list.size() <= 0">
				
	      <tr bgcolor="#FFFFFF"  align="center">
		<td colspan="5">��ϵ� �Խù��� �����ϴ�.</td>
                  </tr>						
	      <tr bgcolor="#777777">
      		<td height="1" colspan="6"></td>
    	      </tr>
    		
	      </s:if>
			
	      <tr align="center">
    		<td colspan="6"><s:property value="pagingHtml"  escape="false" /></td>
    	      </tr>
    	      
    	      
    	<tr align="center">
		<td colspan="6">		
			<form>
				���� : <input type="search" name="searchKeyword"/><input type="submit" value="�˻�"/>			
				<input name="list" type="button" value="My Team" class="inputb" onClick="javascript:location.href='MyTeam.action?currentPage=<s:property value="currentPage" />'""></td>
			</form>
		</td>
	</tr>
	</table>
	
</body>
</html>