<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>�� �󼼺���</title>
<script type="text/javascript">
function aboutTeam(url,msg){
	if (confirm(msg+" �Ͻðڽ��ϱ�?") == true){    //Ȯ��
		location.href=url;
	}else{   //���
	    return;
	}

}
</script>
</head>
  
  <body>
  
  	<table width="600" border="0" cellspacing="0" cellpadding="2">
  		<tr>
  			<td align="center"><h2>�� �󼼺���</h2></td>
  		</tr>
  		<tr>
  			<td height="20"></td>
  		</tr>
  	</table>
  	
  <%-- 	<table class="type01">
   	<tr>
        <th scope="row">����</th>
        <td>&nbsp;&nbsp;<s:property value="resultClass.team_id" /></td>
    </tr>
    <tr>
    	<th scope="row">����</th>
        <td>&nbsp;&nbsp;<s:property value="resultClass.team_area" /></td>
    </tr>
	</table> --%>
<table width="600" border="0" cellspacing="0" cellpadding="0">     
     
    <%--  <tr>
     	<td>
     		<img src="<%= request.getContextPath() %>/teamimg/����.jpg"/>
     	</td>
     </tr> --%>
     
     <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  ���� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_id" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  ���� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_area" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  �Ҽ����� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_type" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  �������� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_fieldtype" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  ���ɴ� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_age" />
        </td>
      </tr>
      
      <tr bgcolor="#777777">
        <td height="1" colspan="2"></td>
      </tr>
			
      <tr>
        <td bgcolor="#F4F4F4">  �Ƿ� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_skill" />
        </td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  �� �ο� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_count" />
        </td>
      </tr>
      
      <tr>
        <td bgcolor="#F4F4F4">  ������ �Ұ� </td>
        <td bgcolor="#FFFFFF">
          &nbsp;&nbsp;<s:property value="resultClass.team_intro" />
        </td>
      </tr>
      
          <tr>
        <td align="right" colspan="2">
        	<s:if test="#session.session_id !=null">
        		<s:if test="memParam.myteam == null">
        			<s:if test="teamInfoParam.mem_id != null"></s:if>
        			<s:else>
					<input type="button" value="��û" onclick="aboutTeam('joinTeam.action?team_id=<s:property value="resultClass.team_id"/>','��û')"/>
					</s:else>
				</s:if>
				<s:else>
					<s:if test="teamInfoParam.team_admin == 1 || teamInfoParam.team_admin ==2">
						<input name="list" type="button" value="����" class="inputb" onClick="aboutTeam('TeamModifyForm.action?team_no=<s:property value="team_no"/>&currentPage=<s:property value="currentPage"/>','����')"/>
						<input name="list" type="button" value="����" class="inputb" onClick="aboutTeam('TeamDeleteForm.action?team_no=<s:property value="team_no"/>&currentPage=<s:property value="currentPage"/>','����')"/>
					</s:if>
				</s:else>
        		
	       		
				
			</s:if> 
			<input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'">

        </td>
      </tr>

  </table>
 </body>
</html>