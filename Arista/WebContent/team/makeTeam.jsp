<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>
	<SCRIPT type="text/javascript">
		function validation(){
			var frm = document.forms(0);
			
			if(frm.team_id.value == ""){
				alert("������ �Է����ּ���.");
				return false;
			}
			else if(frm.team_type.value == "����"){
				alert("�Ҽ������� ������ �ּ���.");
				return false;
			}
			else if(frm.team_fieldtype.value == "����"){
				alert("��������� ������ �ּ���.");
				return false;
			}
			else if(frm.team_age.value == "����"){
				alert("���ɴ븦 ������ �ּ���.");
				return false;
			}
			else if(frm.team_skill.value == "����"){
				alert("�Ƿ��� ������ �ּ���.");
				return false;
			}
			else if(frm.team_age.value == ""){
				alert("���ɴ븦 �Է����ּ���.");
				return false;
			}
			else if(frm.team_intro.value == ""){
				alert("������ �Ұ��� ��Ź �帳�ϴ�.");
				return false;
			}
			return true;
		}
	</SCRIPT>	
</head>
<body>
	<table width="600" border="0" cellspacing="0" cellpadding="2">
		<tr>
			<td align="center"><h2>�� ����</h2></td>
		</tr>
	</table>
	
		<s:if test="resultClass == NULL">
			<form action="writeAction.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		</s:if>
		
		<s:else>
			<form action="modifyAction.action" method="post" enctype="multpart/form-data"/>
			<s:hidden name="team_no" value="%{resultClass.team_no}"/>
			<s:hidden name="currenstPage" value="%{resultClass.currentPage}"/>
			<s:hidden name="old_file" value="%{resultClass.file_savname}"/>
		</s:else>
		
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
          <td align="right" colspan="2"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ����</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="team_id" theme="simple" value="%{resultClass.team_id}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ����</td>
          <td width="500" bgcolor="#FFFFFF">
          	<select name="team_area">
     	    	<option selected="selected">����</option> 
				<option>����</option>
         		<option>���</option>
         		<option>���</option>
         		<option>�泲</option>
         		<option>����</option>
         		<option>���</option>
         		<option>����</option>
         	</select>
          </td>
        </tr>
        
		<tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  �Ҽ�����</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_type">
     	    	<option selected="selected">����</option> 
				<option>û�ҳ�</option>
         		<option>���л�</option>
         		<option>������</option>
         		<option>����</option>
         		<option>�����౸ȸ</option>
         	</select>
          </td>
        </tr>        
         
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ��������</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_fieldtype">
     	    	<option selected="selected">����</option> 
				<option>�౸</option>
         		<option>ǲ��</option>
         	</select>
          </td>
        </tr>         
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ���ɴ�</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_age">
     	    	<option selected="selected">����</option> 
				<option>10��</option>
         		<option>20��</option>
         		<option>30��</option>
         		<option>40��</option>
         		<option>50�� �̻�</option>
         	</select>
          </td>
        </tr>
        
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>          
          <td width="50" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  �Ƿ�</td>
          <td width="250" bgcolor="#FFFFFF">
          	<select name="team_skill">
     	    	<option selected="selected">����</option> 
				<option>��</option>
         		<option>��</option>
         		<option>��</option>
         	</select>
          </td>
        </tr>   
        
          <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
		<tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  �� �ο�</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textfield name="team_count" theme="simple" value="%{resultClass.team_count}" cssStyle="width:370px" maxlength="50"/>
          </td>
        </tr>         
        							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        <tr>
          <td width="100" bgcolor="#F4F4F4"><font color="#FF0000">*</font>  ������ �Ұ�</td>
          <td width="500" bgcolor="#FFFFFF">
            <s:textarea name="team_intro" theme="simple" value="%{resultClass.team_intro}" cols="50" rows="10"/>
          </td>
        </tr>
                							
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>
        </tr>
        
        <tr>
          <td bgcolor="#F4F4F4">  ÷������ </td>
          <td bgcolor="#FFFFFF">
            <s:file name="upload" theme="simple"/>
            
            <s:if test="resultClass.file_orgname != NULL">
				&nbsp; * <s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
		</s:if>
						
          </td>
        </tr>
        <tr bgcolor="#777777">
          <td height="1" colspan="2"></td>	
        </tr>
        
        <tr>
          <td height="10" colspan="2"></td>
        </tr>
        
        
        <tr>
          <td align="right" colspan="2">
          	<input name="submit" type="submit" value="�ۼ��Ϸ�" class="inputb">
            <input name="list" type="button" value="���" class="inputb" onClick="javascript:location.href='listAction.action?currentPage=<s:property value="currentPage" />'">
          </td>
        </tr>

    </table>
</body>
</html>