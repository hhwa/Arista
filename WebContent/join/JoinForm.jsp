<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style type="text/css">
input.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	width: 180px;
	border-color: #000000;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
<title>회원가입</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="./join/joinForm.js" type="text/javascript" charset="EUC-KR">
</script>
</head>
<body>
<s:form method="post" action="MemberJoinAction" name="userinput" enctype="multipart/form-data" onsubmit="return checkIt();">
	<input type="hidden" name="idchecked" value="0"/>
	<input type="hidden" name="nickchecked" value="0"/>
	<input type="hidden" name="emailchecked" value="0"/>
	<table align="center">
	<tr height="50"><td></td></tr>
		<tr><td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font> 필수항목</td></tr>
      	<tr height="20" ><td></td></tr>
		<tr height="40">
			<td width="70"></td>
        	<td width="140"><b>아이디 <font color="#FF0000">*</font></b></td>
         	<td width="190">
				<input class="bottom" id="bu_in" type="text" name="m_id" maxlength="12">
			</td>
			<td>
				<input id="bu_1" type="button" name="check_id" value="  ID 중복확인  " OnClick="openConfirmid(this.form)">
			</td>
		</tr>
		<tr height="40">
			<td width="70"></td>
			<td><b>비밀번호 <font color="#FF0000">*</font></b></td>
			<td>
				<input class="bottom" id="bu_in" type="password" name="m_passwd" size="20">
			</td>
			<td class="font_12">
            &nbsp;&nbsp;<font color="#FF0000">※</font> 8자 이상이여야 하며 영문과 숫자를 반드시 포함해야 한다.
            </td>
		</tr>
		<tr height="40">
        	<td width="70"></td>
         	<td><b>비밀번호 확인  <font color="#FF0000">*</font></b></td>
         	<td>
            	<input class="bottom" id="bu_in" type="password" name="m_passwd2" size="20">
         	</td>
      	</tr> 		
		<tr height="40">
         <td width="70"></td>
         <td><b>이름  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="text" name="m_name" size="15" maxlength="15">
         </td>
      	</tr>
		<tr height="40">
        	<td width="70"></td>
         	<td><b>닉네임  <font color="#FF0000">*</font></b></td>
         	<td>
	            <input class="bottom" id="bu_in" type="text" name="m_nickname" size="15" maxlength="15">
         	</td>
         	<td>
	            <input id="bu_1" type="button" name="check_nick" value="  닉네임 중복확인  " OnClick="openConfirmnick(this.form)">
         	</td>
      	</tr>

			<tr height="40">
			<td width="70"></td>
         	<td><b>포지션  <font color="#FF0000">*</font></b></td>
			<td>
		<s:if test="posiList != null">
               <select name="m_position">
                  <s:iterator value="posiList">
                     <option value="<s:property/>"><s:property/></option>
                  </s:iterator>
               </select>
            </s:if>
			</td>
			<td class="font_12">&nbsp;&nbsp;<font color="#FF0000">※</font>포지션을 선택해주세요.
         	</td>
		</tr>
		
		<tr height="40">
        	<td width="70"></td>
         	<td><b>휴대폰 번호  <font color="#FF0000">*</font></b></td>
         	<td>
            	<input class="bottom" id="bu_in" type="text" name="m_mobilephone" size="11"> 
            </td>
            <td class="font_12">&nbsp;&nbsp;ex)010-1111-1111</td>
      	</tr>    			
		<tr height="40">
        	<td width="70"></td>
         	<td><b>지역  <font color="#FF0000">*</font></b></td>
         	<td>
          <s:if test="areaList != null">
               <select name="m_region">
                  <s:iterator value="areaList">
                     <option value="<s:property/>"><s:property/></option>
                  </s:iterator>
               </select>
            </s:if>
         	</td>
      	</tr>
		<tr height="40">
        	<td width="70"></td>
         	<td><b>출생연도  <font color="#FF0000">*</font></b></td>
         	<td>
	            <input class="bottom" id="bu_in" type="text" name="m_birthyear" size="10">
        	</td>
        	<td class="font_12">&nbsp;&nbsp; ex)1990</td>
      	</tr>
		<tr height="40">
        	<td width="70"></td>
         	<td><b>이메일  <font color="#FF0000">*</font></b></td>
         	<td>
            	<input class="bottom" id="bu_in" type="text" name="m_email" size="30">
            </td>
            <td>
            	<input id="bu_1" type="button" name="email_nick" value="  이메일 중복확인   " OnClick="openConfirmemail(this.form)">
         	</td>
      	</tr>
		
		<tr height="40">
			<td width="70"></td>
			<td><b>프로필사진</b></td>
			<td colspan="11"><s:file name="upload" theme="simple"/></td>	
		</tr>
		</table>
		<table align="center">				
		<tr height="60">
			<td colspan="11" align="center">
				<input id="bu_1" type="submit" name="confirm" value="    등 록    ">&nbsp;&nbsp;&nbsp;
				<input id="bu_1" type="reset" name="reset" value="  다시 입력  ">&nbsp;&nbsp;&nbsp;
				<input id="bu_1" type="button" value="    취 소    " onclick="javascript:window.location='loginForm.action'">
			</td>
		</tr>	
		<tr height="40"><td></td></tr>		
	</table>
</s:form>
</body>
</html>
