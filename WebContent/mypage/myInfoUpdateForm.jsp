<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
#noImage{
   background-image: url('/Arista/mypage/image/noImage.jpg');
   background-size:100%;
   padding: 160px 0px 0px 0px;
}
</style>
<link href="css/style.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="./join/joinForm.js" type="text/javascript">
</script>
</head>
<body>
<s:form method="post" action="modiftyMemberPro" name="userinput" enctype="multipart/form-data">
	<s:hidden name="prof_image_save" value="%{memberResult.prof_image_save}"/>
	<s:hidden name="m_id" value="%{memberResult.m_id}"/>

	<table align="center">
   <tr height="50" ><td></td></tr>
      <tr height="40">
         <td width="140"><b>아이디 <font color="#FF0000">*</font></b></td>
         <td width="190" id="bu_in">
            <s:property value="memberResult.m_id"/>
         </td>
         <td width="130" rowspan="4" align="center">
            <img src="<s:property value='memberResult.prof_image_save'/>">
      </td>
      </tr>
      <tr height="40">
         <td><b>비밀번호 <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="password" name="m_passwd" size="10" placeholder="※ 8자 이상 입력">
            </td>
      </tr>
      <tr height="40">
         <td><b>비밀번호 확인  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="password" name="passwd2" size="20">
         </td>
      </tr>
      <tr height="40">
         <td><b>이름  <font color="#FF0000">*</font></b></td>
         <td id="bu_in">
            <s:property value="memberResult.m_name"/>
         </td>
      </tr>
      <tr height="40">
         <td><b>닉네임  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="text" name="m_nickname" maxlength="15" size="20" placeholder="<s:property value="memberResult.m_nickname"/>" autocomplete="off">
         </td>
         <td>
            <input id="bu_1" type="button" name="check_nick" value="  닉네임 중복확인  " OnClick="openConfirmnick(this.form)">
         </td>
      </tr>   
      <tr height="40">
         <td><b>포지션  <font color="#FF0000">*</font></b></td>
         <td>
         <s:property value="memberResult.m_position"/> &nbsp;>&nbsp;
         <s:if test="posiList != null">
               <select name="m_position">
                  <s:iterator value="posiList">
                     <option value="<s:property/>"><s:property/></option>
                  </s:iterator>
               </select>
            </s:if>
            </td>
      </tr>
      <tr height="40">
         <td><b>휴대폰 번호  <font color="#FF0000">*</font></b></td>
         <td>
            <input type="text" name="m_mobilephone" size="20" value="<s:property value="memberResult.m_mobilephone"/>"> 
         </td>
         
      </tr>      
                  
      <tr height="40">
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
         <td><b>출생연도  <font color="#FF0000">*</font></b></td>
         <td><s:property value="memberResult.m_birthyear"/></td>
      </tr>
      <tr height="40">
      <td><b>이메일  <font color="#FF0000">*</font></b></td>
         <td>
            <input class="bottom" id="bu_in" type="text" name="m_email" maxlength="15" size="30" placeholder="<s:property value="memberResult.m_email"/>" autocomplete="off">
         </td>
         <td>
            <input id="bu_1" type="button" name="email_nick" value="  이메일 중복확인   " OnClick="openConfirmemail(this.form)">
         </td>
      </tr>
      
      <tr height="40">
         <td><b>기존 프로필사진</b></td>
         <td>
            <s:property value='memParam.prof_image_save'/>
         </td>
   </tr>

      <tr height="40">
         <td><b>프로필사진</b></td>
         <td colspan="2"><s:file name="upload" theme="simple"/></td>   
      </tr>      
      
      </table>
      <table align="center">         
      <tr height="60">
         <td align="center">
            <input id="bu_1" type="submit" name="confirm" value="        등 록        " onclick="return checkIt()">&nbsp;&nbsp;&nbsp;
            <input id="bu_1" type="button" value="     되돌리기     " onclick="javascript:window.location='modiftyMemberForm.action?m_id=<s:property value="memberResult.m_id"/>'">&nbsp;&nbsp;&nbsp;
            <input id="bu_1" type="button" value="        취  소        " onclick="javascript:window.location='mypage.action'">
         </td>
      </tr>   
      <tr height="40"><td></td></tr>      
   </table>

	</s:form>


</body>
</html>