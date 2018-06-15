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
<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  
	<table width="600" border="0" cellspacing="0" cellpadding="2">

		<tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
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
		<tr bgcolor="#FFFFFF"  align="center" onclick="location.href='TeamView.action?team_no=<s:property value="team_no" />&currentPage=<s:property value="currentPage" />'">
        	<td><s:property value="team_" /></td>
        	<td align="center"> &nbsp;<s:property value="team_id" /></td>
        	<td align="center"><s:property value="team_intro" /></td>
        	
      	    </tr>
      	    <tr bgcolor="#777777">
        		<td height="1" colspan="5"></td>
        	</tr>
		</s:iterator>
			
		<s:if test="list.size() <= 0">
				
	  		<tr bgcolor="#FFFFFF"  align="center">
				<td colspan="5">등록된 게시물이 없습니다.</td>
            </tr>						
	      	<tr bgcolor="#777777">
      			<td height="1" colspan="5"></td>
    	    </tr>
    		
    	</s:if>
			
	    <tr align="center">
    		<td colspan="5"><s:property value="pagingHtml"  escape="false" /></td>
    	</tr>
    	<tr align="center">
			<td colspan="5">
			<form>
				<select name="topic" >
					<option value="0">팀명</option>
				</select>
				<s:textfield name="search" theme="simple" value="" cssStyle="width:120px" maxlength="20" />
				<input name="submit" type="submit" value="검색" class="inputb"/>
			</form>
			</td>
		</tr>
	</table>
</body>
</html>