<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
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
<s:if test="teamInfoParam == null">
	<a href="TeamCreateForm.action">�� ����</a><br>
	<a href="TeamList.action">�� ��û�Ϸ�����</a>
</s:if>
<s:else>
	<s:property value="teamInfoParam.team_id"/>�� ���� ��� ���Դϴ�. <br>
	<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="teamInfoParam.team_id"/>&mem_id=<s:property value="#session.session_id"/>','���� ���')">���� ���</a> &nbsp;

</s:else>


</body>
</html>