<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function setStadium(stadium_name,stadium_type,stadium_area)
{
	opener.document.userinput.stadium.value=stadium_name;
	opener.document.userinput.game_type.value=stadium_type;
	opener.document.userinput.game_area.value=stadium_area;
	self.close();
} 
</script>
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����� �˻�</title>
</head>
<body>

<form action="OpenStadiumList.action" method="post">
	<table align="center">
	<tr height="50"><td><b> * ������� �������ּ��� </b></td></tr>
	<tr>
		<td>
	<input type="radio" name="search" value="ǲ������" <s:if test="search eq 'ǲ������'"> checked="checked"</s:if>/>ǲ������&nbsp;
    <input type="radio" name="search" value="�౸�����" <s:if test="search eq '�౸�����'"> checked="checked"</s:if>/>�౸�����
    <input type="radio" name="search" value="��ü�˻�" <s:if test="search eq '��ü�˻�'"> checked="checked"</s:if>/>��ü�˻�
	<input type="submit" id="bu_1" value="�˻�">
		</td>
	</tr>
	<tr height="20"></tr>
	</table>
</form>

<table align="center" width="500" cellpadding="0" cellspacing="0">
	<tr>
		<td id="bu_1" align="center" width="200">����� �̸�</td>
		<td id="bu_1" align="center" width="100">����� ����</td>
		<td id="bu_1" align="center" width="200">����� ����</td>
	</tr>
	<s:iterator value="list" status="stat">
		<tr onclick="setStadium('<s:property value="stadium_name"/>','<s:property value="typeList[#stat.index]"/>','<s:property value="areaMap[#stat.index]"/>');">
			<td class="under" align="center"><s:property value="stadium_name"/></td>
			<td class="under" align="center"><s:property value="typeList[#stat.index]"/></td>
			<td class="under" align="center"><s:property value="areaMap[#stat.index]"/>&nbsp;<s:property value="areaMap[#stat.index+10]"/></td>
		</tr>
	</s:iterator>
	
</table>
<table align="center">
	<tr height="50">
		<td align="center"><br> 
			<a href="javascript:this.close();" id="bu_1" style="width:50px; height:30px;">�ݱ�</a>
		</td>
	</tr>
	<tr align="center" height="50">
       	<td colspan="5"><s:property value="pagingHtml" escape="false" /></td>
    </tr>
    <tr height="40"></tr>
</table>
</body>
</html>