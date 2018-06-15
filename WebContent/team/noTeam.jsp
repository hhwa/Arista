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
	if (confirm(msg+" 하시겠습니까?") == true){    //확인
		location.href=url;
	}else{   //취소
	    return;
	}
}
</script>
</head>
<body>
<s:if test="teamInfoParam == null">
	<a href="TeamCreateForm.action">팀 생성</a><br>
	<a href="TeamList.action">팀 신청하러가기</a>
</s:if>
<s:else>
	<s:property value="teamInfoParam.team_id"/>에 가입 대기 중입니다. <br>
	<a href="#" onclick="aboutTeam('withdrawTeam.action?team_id=<s:property value="teamInfoParam.team_id"/>&mem_id=<s:property value="#session.session_id"/>','가입 취소')">가입 취소</a> &nbsp;

</s:else>


</body>
</html>