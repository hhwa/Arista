<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	border-color: #000000;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<link href="/Arista/css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="600" border="0" cellspacing="0" cellpadding="2" align="center">
   <tr>
      <td height="100"></td>
   </tr>
</table>
<div align="left" style="margin-left:230px; margin-right: 200px;">
<table align="center" style="float:left; margin-left:50px; margin-right:20px;">
	<tr><td height="60"></td></tr>
	<tr>
       	<td height="200" colspan="3" align="center"><strong><img width="200" height="200" src='${profpath }'></strong></td>
  	</tr>
    <tr><td height="10"></td></tr>
    <tr>
         <td width="400"></td>
    </tr>
	<tr>
		<td align="center">
			<input type="button" value="목록으로" style="width:200px;" class="bu_2" onclick="javascript:window.location='adminMemList.action?currentPage=<s:property value="currentPage"/>'">
		</td>
	</tr>
</table>
</div>
<div align="right">
	<table width="420" border="0" cellspacing="0" cellpadding="2" style="float:left; margin-left:20px; margin-right:50px;">
		<tr>
        	<td class="border_side_bu" align="center" colspan="3" height="20"></td>
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
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 아이디</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{memberResult.m_id}" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 비밀번호</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_passwd" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 이름</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="%{memberResult.m_name}" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 닉네임</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property   value="memberResult.m_nickname" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 휴대폰번호</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_mobilephone" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 생년월일</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_birthyear" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 지역</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_region" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 이메일</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_email" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 포지션</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_position" /></strong></td>
      	</tr>
      	<tr>
         	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 가입날짜</td>
         	<td colspan="2"  class="cont_si_right"><strong><s:property value="memberResult.m_joindate" /></strong></td>
      	</tr>
      	<tr>
		 	<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"><font color="#FF0000">*</font> 관리자 권한</td>
			<td colspan="2" class="cont_si_right"><strong>
		 	<s:form action="adminRight" method="post">
				<s:hidden name="m_id" value="%{memberResult.m_id}"/>
				<select name="admin_yn" id="bu_in" class="bottom">
					<option <s:if test="memberResult.admin_yn eq 0"> selected="selected"</s:if>>0</option>
					<option <s:if test="memberResult.admin_yn eq 1"> selected="selected"</s:if>>1</option>
				</select>
				<input type="submit" value="권한 수정" class="bu_2">
			</s:form>
			</strong>
			</td>
		</tr>
		<tr>
			<td height="25" width="100" class="cont_si_left" style="padding:0px 0px 0px 40px;"></td>
			<td colspan="2" class="cont_si_right"><strong>&nbsp;&nbsp;<font color="red" size="2">※0:일반 / 1:관리자</font></strong></td>
		</tr>
      	<tr>
        	<td height="10" class="cont_si_left"></td>
         	<td colspan="2"  class="cont_si_right"></td>
      	</tr>
      	<tr class="border_top">
         	<td height="5" colspan="3"></td>
      	</tr>
      	<tr height="100"><td></td></tr>
</table>
</div>
<br>			
</body>
</html>