<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Arista/css/style.css?ver=1" type="text/css">
<title>회원 가입 동의서</title>
<script type="text/javascript">
function chk(){
	 var agree = document.agreement.agree.checked;
	 var agree2 = document.agreement.agree2.checked;
	 var num = 0;
	 var num2 = 0;
	 
	 if(agree == true){
	  num = 1;
	 }
	 
	 if(agree2 == true){
		  num2 = 1;
		 }
	 
	 if(num==1 && num2==1){
	  document.agreement.submit();
	 }else{
	  alert("모든 약관에 동의하셔야 회원가입이 가능합니다.");
	  return false;
	 }
	}

</script>
</head>
<body>

<s:form action="joinForm" name="agreement" method="post" onsubmit="return chk();">
<table align="center">
<tr>
<td>
<s:include value="../footer/promiseView.jsp">
</s:include>
</td>
</tr>

<tr>
<td><input type="checkbox" id="join_agree" name="agree" value="1"> 이용약관에 동의합니다.</td>
</tr>

<tr>
<td>
<s:include value="../footer/privacyView.jsp">
</s:include>
</td>
</tr>

<tr>
<td><input type="checkbox" id="join_agree2" name="agree2" value="1"> 개인정보 수집·이용에 동의합니다.</td> 
</tr>
</table>
<table align="center">
<tr height="50"><td></td></tr>
<tr>
<td align="center"><b><input type="submit" value="회원가입" id="bu_1" style="width:150px; height:50px;"></b></td>
<td width="50"></td>
<td align="center"><b><input type="button" value="취    소" id="bu_1" style="width:150px; height:50px;" onclick="javascript:window.location='main.action'"></b></td>
</tr>
<tr height="50"><td></td></tr>
</table>
</s:form>
<br>
</body>
</html>