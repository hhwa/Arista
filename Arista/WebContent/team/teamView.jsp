<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>�� �󼼺���</title>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css">
<script type="text/javascript">
function aboutTeam(url,msg){
	if (confirm(msg+" �Ͻðڽ��ϱ�?") == true){    //Ȯ��
		location.href=url;
	}else{   //���
	    return;
	}

}
function locationURL(){
	if(window.name == 'team')
		window.close();
    else {
		location.href='TeamList.action?currentPage=<s:property value="currentPage" />';
	}
}
</script>
</head>
<body>
  
<table width="600" border="0" cellspacing="0" cellpadding="2">
  	<tr>
  		<td height="80"></td>
  	</tr>
</table>

	<table align="center">
		<tr>
			<td height="200" colspan="3" align="center"><img class="team_img" width="230" height="230" src="/Arista/team/teamIMG/<s:property value="resultClass.file_savname" />"/></td>
		</tr>
		<tr height="20"><td></td></tr>
		<tr>
			<td class="border_side_bu" align="center" colspan="3"><b><s:property value="resultClass.team_id"/></b></td>
		</tr>
		<tr>
			<td class="border_left" height="8" width="120"></td>
			<td width="50"></td>
			<td class="border_right" width="150"></td>
		</tr>
		<tr>
			<td height="10" class="cont_si_left"></td>
			<td colspan="2"  class="cont_si_right"></td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ����</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_area"/></td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �Ҽ�����</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_type"/></td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ��������</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_fieldtype"/></td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ���ɴ�</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_age"/></td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �Ƿ�</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_skill"/></td>
		</tr><tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �� �ο�</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_count"/>��</td>
		</tr><tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ������ �Ұ�</td>
			<td colspan="2"  class="cont_si_right"><s:property value="resultClass.team_intro"/></td>
		</tr>
		<tr>
			<td height="10" class="cont_si_left"></td>
			<td colspan="2"  class="cont_si_right"></td>
		</tr>
		
	<tr class="border_top">
		<td height="5" colspan="3"></td>
	</tr>

    <tr>
        <td align="center" colspan="3" class="border_side_bu" width="400">
        	<s:if test="#session.session_id !=null">
        		<s:if test="memParam.myteam == null">
        			<s:if test="teamInfoParam.mem_id != null"></s:if>
        			<s:else>
					<input type="button" value="��û" class="bu_2" onclick="aboutTeam('joinTeam.action?team_id=<s:property value="resultClass.team_id"/>','��û')"/>&nbsp;/&nbsp;
					</s:else>
				</s:if>
			</s:if>
			<%-- <input name="list" type="button" value="���" class="bu_2" onclick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'"/> --%>
			<input name="list" type="button" value="���" class="bu_2" onclick="javascript:locationURL();"/>

        </td>
      </tr>
      <tr height="100"><td></td></tr>
  </table>
 </body>
</html>