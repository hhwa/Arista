<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	border-color: #000000;
	width:60px;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��Ʈ����2 �Խ���</title>

<script type="text/javascript">
function parse(str){
	var y = str.substr(0, 4);
    var m = str.substr(5, 2);
    var d = str.substr(8, 2);
    return new Date(y,m-1,d);

}
function validation(){
	var frm = document.userinput;
	var today = new Date();
	var gameday = frm.game_day.value;
	
	var date = parse(gameday);
	
		
	if(frm.game_day.value==""){
		alert("������� �Է����ּ���");
		return false;
	}else if(date<today){
		alert("���� ������ ��¥�� �������ּ���");
		return false;
	}else if(frm.game_type.value==""){
		alert("��������� �Է����ּ���");
		return false;
	}else if(frm.stadium.value==""){
		alert("����带 �Է����ּ���");
		return false;
	}else if(frm.fee.value==""){
		alert("������ �Է����ּ���.");
		return false;
	}else if(frm.game_area.value==""){
		alert("��� ������ �Է����ּ���.");
		return false;
	}else if(frm.content.value==""){
		alert("������ �Է����ּ���.");
		return false;
	}
	return true;
	
}
function openStadiumList() {	 
	//url�� ����� �Է� id�� �����մϴ�.	
	url = "OpenStadiumList.action";
	//���ο� �����츦 ���ϴ�.
	open(url, "open", "toolbar=no, location=no, status=no, menubar=no, scrollbars=no, resizable=no, width=530, height=600");
}

</script>
</head>
<body>
<s:if test="soloMatchParam == NULL">
	<form action="CreateSoloMatch.action" name="userinput" method="post" enctype="multipart/form-data" onsubmit="return validation();">
</s:if>
<s:else>
	<form action="modifySoloMatch.action" name="userinput" method="post" enctype="multipart/form-data" onsubmit="return validation();">
		<s:hidden name="game_no" value="%{soloMatchParam.game_no}" />
		<s:hidden name="currentPage" value="%{currentPage}" />
</s:else>
	<table align="center">
		<tr height="50"><td></td></tr>
		<tr>
          <td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        <tr height="20" ><td></td></tr>       
			
       	<tr height="40">
          	<td width="100"><b>��⳯¥ <font color="#FF0000">*</font></b></td>
        	<td width="500">
           	<s:if test="soloMatchParam == null">
         		<input type="date" name="game_day" class="bottom" id="bu_in"/>	
         	</s:if>
         	<s:else><s:property value="%{soloMatchParam.game_day}"/></s:else>
         	</td>
       	</tr>
       	
       	<tr height="40">
          <td width="50"><b>����� <font color="#FF0000">*</font></b></td>
          <td width="250">
          	<s:textfield name="stadium" theme="simple" value="%{soloMatchParam.stadium}" cssClass="bottom" id="bu_in" readonly="true"/>
           	<input type="button" class="bu_2" value="����� �˻�" onclick="openStadiumList();"/>
         	</td>
       	</tr>						
       	<tr height="40">
          <td width="100"><b>������� <font color="#FF0000">*</font></b></td>
          <td width="250">
         	
         	<input type="radio" name="game_type" value="ǲ��" <s:if test="soloMatchParam.game_type eq 'ǲ��'">checked="checked"</s:if>/>ǲ��&nbsp;
         	<input type="radio" name="game_type" value="�౸" <s:if test="soloMatchParam.game_type eq '�౸'">checked="checked"</s:if>/>�౸
			
        	</td>
       	</tr>
	
		<tr height="40">
          <td width="50"><b>������� <font color="#FF0000">*</font></b></td>
          <td width="250">
         	<s:if test="areaList != null">
         		<select name="game_area" class="bottom" id="bu_in" > <!-- onchange -->
         			<s:iterator value="areaList" status="stat">
         				<s:if test="soloMatchParam.game_area eq areaList[#stat.index]">
         					<option value="<s:property/>" selected="selected"><s:property/></option>
         				</s:if>
         				<s:else>
         					<option value="<s:property/>"><s:property/></option>
         				</s:else>
         			</s:iterator>
         		</select>
         	</s:if>
         	</td>
       	</tr>
       	
       	<tr height="40">
          <td width="50"><b>���ð� <font color="#FF0000">*</font></b></td>
          <td width="250">
         	<s:if test="timeList != null">
         		<select name="game_time" class="bottom" id="bu_in" > <!-- onchange -->
         			<s:iterator value="timeList" status="stat">
         				<s:if test="game_time eq timeList[#stat.index]">
         					<option value="<s:property/>" selected="selected"><s:property/></option>
         				</s:if>
         				<s:else>
         					<option value="<s:property/>"><s:property/></option>
         				</s:else>
         			</s:iterator>
         		</select>&nbsp; ~ &nbsp;
         		<select name="game_time1" class="bottom" id="bu_in" > <!-- onchange -->
         			<s:iterator value="timeList" status="stat">
         				<s:if test="game_time1 eq timeList[#stat.index]">
         					<option value="<s:property/>" selected="selected"><s:property/></option>
         				</s:if>
         				<s:else>
         					<option value="<s:property/>"><s:property/></option>
         				</s:else>
         			</s:iterator>
         		</select>
         	</s:if>
         	</td>
       	</tr>
       							
       	
       	<tr height="40">
          <td width="50"><b>��� �ִ��ο� <font color="#FF0000">*</font></b></td>
          <td width="250">
         	<input type="number" name="people_max" value="${soloMatchParam.people_max}" class="bottom" id="bu_in"/>��
         	</td>
       	</tr>
       	<tr height="40">
          <td width="50"><b>��� <font color="#FF0000">*</font></b></td>
          <td width="250">
         	<input type="number" name="fee" value="${soloMatchParam.fee}" class="bottom" id="bu_in"/>��
         	</td>
       	</tr>
       	
       	<tr height="40">
          <td width="50"><b>���� <font color="#FF0000">*</font></b></td>
          <td width="250">
           	<s:textarea name="content" theme="simple" value="%{soloMatchParam.content}" cols="48" rows="5" cssClass="bottom" cssStyle="width:300px;" id="bu_in"/>
         	</td>
       	</tr>
	       
       	<tr height="40">
         	<td height="30" colspan="2"></td>
       	</tr>
        <tr height="40">
         	<td align="right" colspan="2">
	         	<input name="submit" type="submit" style="width:125px; height:25px;" value="�ۼ��Ϸ�" class="bu_2">
           		<input name="list" type="button" value="���" style="width:125px; height:25px;" class="bu_2" onClick="javascript:location.href='SoloMatchList.action?currentPage=<s:property value="currentPage" />'">
        	</td>
       	</tr>
       	<tr height="100"></tr>
    </table>
    </form>
</body>
</html>