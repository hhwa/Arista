<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
   <tr>
      <td height="40"></td>
   </tr>
</table>

<div align="left" style="margin-left:20%; margin-right: 20%; margin-bottom: 150px;">
   <table width="320" align="center" style="float:left; margin-left:35px; margin-right:35px;" >
      
      <tr>
         <td height="200" colspan="3" align="center"><strong><img class="team_img" width="200" height="200" src="team/teamIMG/<s:property value="resultClass.file_savname" />"></strong></td>
      </tr>
      <tr>
         <td height="8" width="120"></td>
         <td width="50"></td>
         <td width="150"></td>
      </tr>
      <tr>
         <td class="border_side_bu" align="center" colspan="3"><b><s:property value="%{resultClass.team_id}" /></b></td>
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
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �� ������</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.team_master}" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ����</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_area" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ������</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="%{resultClass.team_type}" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �� �������</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property   value="resultClass.team_fieldtype" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ��տ���</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_age" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> ��սǷ�</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_skill" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �� �ο���</td>
         <td colspan="2"  class="cont_si_right"><strong><s:property value="resultClass.team_count" /></strong></td>
      </tr>
      <tr>
         <td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> �� �Ұ�</td>
         <td colspan="2" width="220"class="cont_si_right"><strong><s:property value="resultClass.team_intro" /></strong></td>
      </tr>
      <tr>
         <td height="10" class="cont_si_left"></td>
         <td colspan="2"  class="cont_si_right"></td>
      </tr>
      <tr class="border_top">
         <td height="5" colspan="3"></td>
      </tr>
      
   </table>
</div>
<br>
<div align="right">
	<table width="420" border="0" cellspacing="0" cellpadding="2" style="float:left; margin-left:20px; margin-right:50px;">
    	 <tr><td colspan="6" align="right" style="font-size: 12px; padding: 0px 10px 0px 0px;">ȸ�����</td></tr>
    	 <tr align="center" class="bu_2">
            <td height="25" align="center">���̵�</td>
            <td align="center">�̸�</td>
            <td align="center" width="60">�� ������</td>
            <td align="center" colspan="3" width="160">���</td>
         </tr>
         <tr height="5"><td></td></tr>
         <s:iterator value="teamMemberList" status="stat">
            
            <tr class="list_cont" height="25">
               <td align="left" style="padding:0px 0px 0px 10px;"><s:property value="mem_id" /></td>
               <td align="center"><s:property value="m_name" /></td>
               <td align="center"><s:property value="m_position" /></td>
               <s:if test="team_admin == 2">
                  <td width="60" align="center">������</td>
               </s:if>
               <s:if test="team_admin == 1">
                  <td align="center">������</td>
               </s:if>
               <s:if test="team_admin == 0">
                  <td align="center">ȸ��</td>
               </s:if>
               <s:if test="teamInfoParam.team_admin == 2">
                  <s:if test="team_admin!=2">
                  <td align="center" width="120">
                  <form action="changeTeamAdmin.action" method="post">
                     <s:hidden name="mem_id" value="%{mem_id}"/>
                     <s:hidden name="team_id" value="%{resultClass.team_id}"/>
                     <select name="team_admin">
                        <option value="0" <s:if test="team_admin==0"> selected="selected" </s:if>>ȸ��</option>
                        <option value="1" <s:if test="team_admin==1"> selected="selected" </s:if>>������</option>
                        <option value="2" <s:if test="team_admin==2"> selected="selected" </s:if>>������</option>
                     </select>
                     <input type="submit" id="bu_1" value="����"/>
                  </form>
                  </td>
                  <td width="30" align="center">
                     <input type="button" value="����" id="bu_1" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="mem_id"/>','����')"/>
                  </td>
                  </s:if>
               </s:if>
            </tr>
         </s:iterator>
    </table>
</div>
<s:if test="teamInfoParam.team_admin == 1 || teamInfoParam.team_admin == 2">
      <div align="right">
         <table width="420" border="0" cellspacing="0" cellpadding="2" style="float:left; margin-left:20px; margin-right:50px;">
         <tr height="8"><td></td></tr>
         <tr><td colspan="6" align="right" style="font-size: 12px; padding: 0px 10px 0px 0px;">���Դ����</td></tr>
         <tr align="center" class="bu_2" height="25">
               <td>���̵�</td>
               <td>�̸�</td>
               <td align="center" width="60">�� ������</td>
               <td align="center" width="210">���԰���</td>
            </tr>
            <tr height="5"><td></td></tr>
            <s:iterator value="teamJoinList" status="stat">
               <tr class="list_cont" height="25">
                  <td align="left" style="padding:0px 0px 0px 10px;"><s:property value="mem_id" /></td>
                  <td align="center"><s:property value="m_name" /></td>
                  <td align="center"><s:property value="m_position" /></td>
                  <td align="center">
                  <a href="#" onclick="aboutTeam('teamJoinAgree.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','����')">���Խ���</a>
                  &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                  <a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="resultClass.team_id"/>&mem_id=<s:property value="mem_id"/>','����')">���԰���</a>
                  </td>
               </tr>
            </s:iterator>
    	</table>
	</div>
</s:if>
<div style="margin-left:20%; margin-right:20%; margin-top: 450px;">
	<table style="margin:35px;">
   		<tr>
      		<td align="center" colspan="3" class="border_side_bu" width="320">
      			<input type="button" value="�� ���� ����" onclick="aboutTeam('TeamModifyForm.action?team_id=<s:property value="%{resultClass.team_id}"/>','�� ������ ����')">&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
      		<s:if test="teamInfoParam.team_admin == 2">
      			<input type="button" value="�� ����" onclick="aboutTeam('DeleteTeam.action?team_id=<s:property value="%{resultClass.team_id}"/>','�� ������')">&nbsp;&nbsp;&nbsp;&nbsp;
      		</s:if>
      		<s:else>
      			<input type="button" value="�� Ż��" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="team_id"/>&mem_id=<s:property value="#session.session_id"/>','Ż��')"/>
      		</s:else>
      		</td>
      		<td width="55"></td>
      		<td align="center" colspan="3"><input type="button" style="width:420px;" class="border_side_bu" value="�ٸ� �� ���" onclick="location.href='TeamList.action'"></td>
      	</tr>
	</table>
</div>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
   <tr>
      <td height="40"></td>
   </tr>
</table>
</body>
</html>