<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	width: 180px;
	border-color: #000000;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
function validation(){
	var frm = document.userinput;
	
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
	}else if(frm.idcheckresult.value != 1){
		alert("�� �̸� �ߺ�Ȯ�� ���ּ���");
		return false;
	}
	return true;
}
function openConfirmid(userinput) {	 
	
	var id = userinput.team_id.value
//url�� ����� �Է� id�� �����մϴ�.	
url = "teamIdCheck.action?team_id="+id;
//���ο� �����츦 ���ϴ�.
open(url, "confirm", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=200");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ����</title>	
</head>
<body>

	<s:if test="resultClass == NULL">
		<form name="userinput" action="TeamCreate.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		<s:hidden name="idcheckresult" value="<s:property value='idcheckresult'/>"/>
	</s:if>
		
	<s:else>
		<form name="userinput" action="TeamModify.action" method="post" enctype="multipart/form-data" onsubmit="return validation();"/>
		<s:hidden name="team_no" value="%{resultClass.team_no}"/>
		<s:hidden name="currentPage" value="%{resultClass.currentPage}"/>
		<s:hidden name="old_file" value="%{resultClass.file_savname}"/>
		<s:hidden name="idcheckresult" value="1"/>
	</s:else>
		
	<table align="center">
		<tr height="50"><td></td></tr>
		<tr>
          <td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        <tr height="20" ><td></td></tr>
        
		<tr height="40">
          	<td width="100"><b>���� <font color="#FF0000">*</font></b></td>
          	<s:if test="resultClass == NULL">
          	<td width="300">
            	<s:textfield name="team_id" cssClass="bottom" id="bu_in" theme="simple" cssStyle="width:370px"/>
          	</td>
          	<td>
				<input id="bu_1" type="button" name="check_id" value="�� �̸� �ߺ�Ȯ��  " onclick="openConfirmid(this.form)">
			</td>
			</s:if>
			<s:else>
			<td width="300" style="padding:0px 0px 0px 10px;"><s:hidden name="team_id" value="%{resultClass.team_id}"/><s:property value="%{resultClass.team_id}"/></td>
			</s:else>
        </tr>
	   
		<tr height="40">
          	<td width="100"><b>���� <font color="#FF0000">*</font></b></td>
         	<td width="500">
          		<select name="team_area" class="bottom" id="bu_in">
     	    		<option>����</option> 
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="��õ" <s:if test="resultClass.team_area eq '��õ'">selected="selected"</s:if>>��õ</option>
					<option value="���" <s:if test="resultClass.team_area eq '���'">selected="selected"</s:if>>���</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="�泲" <s:if test="resultClass.team_area eq '�泲'">selected="selected"</s:if>>�泲</option>
					<option value="���" <s:if test="resultClass.team_area eq '���'">selected="selected"</s:if>>���</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="����" <s:if test="resultClass.team_area eq '����'">selected="selected"</s:if>>����</option>
					<option value="���" <s:if test="resultClass.team_area eq '���'">selected="selected"</s:if>>���</option>
					<option value="�泲" <s:if test="resultClass.team_area eq '�泲'">selected="selected"</s:if>>�泲</option>
					<option value="�뱸" <s:if test="resultClass.team_area eq '�뱸'">selected="selected"</s:if>>�뱸</option>
					<option value="���" <s:if test="resultClass.team_area eq '���'">selected="selected"</s:if>>���</option>
					<option value="�λ�" <s:if test="resultClass.team_area eq '�λ�'">selected="selected"</s:if>>�λ�</option>
         		</select>
          	</td>
        </tr>
        
		<tr height="40">
          	<td width="50"><b>�Ҽ����� <font color="#FF0000">*</font></b></td>
          	<td width="250">
          		<select name="team_type"class="bottom" id="bu_in">
     	    		<option>����</option> 
					<option <s:if test="resultClass.team_type eq 'û�ҳ�'">selected="selected"</s:if>>û�ҳ�</option>
         			<option <s:if test="resultClass.team_type eq '���л�'">selected="selected"</s:if>>���л�</option>
         			<option <s:if test="resultClass.team_type eq '������'">selected="selected"</s:if>>������</option>
         			<option <s:if test="resultClass.team_type eq '����'">selected="selected"</s:if>>����</option>
         			<option <s:if test="resultClass.team_type eq '�����౸ȸ'">selected="selected"</s:if>>�����౸ȸ</option>
         		</select>
          	</td>
        </tr>        
         
		<tr height="40">
          	<td width="50"><b>�������� <font color="#FF0000">*</font></b></td>
          	<td width="250">
          
        	<input type="radio" name="team_fieldtype" value="ǲ��" <s:if test="resultClass.team_fieldtype eq 'ǲ��'">checked="checked"</s:if>/>ǲ��&nbsp;
        	<input type="radio" name="team_fieldtype" value="�౸" <s:if test="resultClass.team_fieldtype eq '�౸'">checked="checked"</s:if>/>�౸

          	</td>
        </tr>         
        
		<tr height="40">       
          	<td width="50" ><b>���ɴ� <font color="#FF0000">*</font></b></td>
          	<td width="250">
          	<select name="team_age" class="bottom" id="bu_in">
     	    	<option>����</option> 
				<option <s:if test="resultClass.team_age eq '10��'">selected="selected"</s:if>>10��</option>
         		<option <s:if test="resultClass.team_age eq '20��'">selected="selected"</s:if>>20��</option>
         		<option <s:if test="resultClass.team_age eq '30��'">selected="selected"</s:if>>30��</option>
         		<option <s:if test="resultClass.team_age eq '40��'">selected="selected"</s:if>>40��</option>
         		<option <s:if test="resultClass.team_age eq '50�� �̻�'">selected="selected"</s:if>>50�� �̻�</option>
         	</select>
          	</td>
        </tr>
        
		<tr height="40">    
          	<td width="50"><b>�Ƿ� <font color="#FF0000">*</font></b></td>
          	<td width="250">
          	<select name="team_skill" class="bottom" id="bu_in">
     	    	<option>����</option> 
				<option <s:if test="resultClass.team_skill eq '�ֻ�' ">selected="selected"</s:if>>�ֻ�</option>
				<option <s:if test="resultClass.team_skill eq '�߻�' ">selected="selected"</s:if>>�߻�</option>
         		<option <s:if test="resultClass.team_skill eq '�߰�' ">selected="selected"</s:if>>�߰�</option>
         		<option <s:if test="resultClass.team_skill eq '����' ">selected="selected"</s:if>>����</option>
         		<option <s:if test="resultClass.team_skill eq '����' ">selected="selected"</s:if>>����</option>
         	</select>
          	</td>
        </tr>   
        
		<tr height="40">
          	<td width="100"><b>�� �ο� <font color="#FF0000">*</font></b></td>
          	<td width="500">
            	<s:textfield name="team_count" cssClass="bottom" id="bu_in" theme="simple" value="%{resultClass.team_count}" cssStyle="width:370px" maxlength="50"/>
          	</td>
        </tr>         
        							
        <tr height="40">
          	<td width="100"><b>�� �Ұ� <font color="#FF0000">*</font></b></td>
          	<td>
          		<textarea name="team_intro" maxlength="75" cols="48" rows="10" >${resultClass.team_intro}</textarea>
          	</td>
        </tr>
                							
        
        <tr height="40">
          	<td width="100"><b>�� �ΰ� </b></td>
          	<td>
          	<%-- <s:file name="upload" theme="simple"/> --%>
          	<input type="file" name="upload"/>
            <s:if test="resultClass.file_orgname != NULL">
				&nbsp; * <s:property value="resultClass.file_orgname" /> ������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
			</s:if>
          	</td>
        </tr>
        
        <tr>
          <td height="30" colspan="2"></td>
        </tr>
        
        
        <tr height="40">
          	<td align="right" colspan="2">
          		<input name="submit" type="submit" style="width:125px; height:25px;" class="bu_2" value="�ۼ��Ϸ�" >
            	<input name="list" type="button" class="bu_2" style="width:125px; height:25px;" value="��  ��" onClick="javascript:location.href='TeamList.action?currentPage=<s:property value="currentPage" />'">
          	</td>
        </tr>
		<tr height="100"></tr>
    </table>
    </form>
</body>
</html>