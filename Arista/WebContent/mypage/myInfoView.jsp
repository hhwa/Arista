<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#noimage{
   background-image: url('/Arista/mypage/image/noImage.jpg');
   background-size:100%;
   padding: 160px 0px 0px 0px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function open_win_noresizable (url, name){
   var oWin = window.open(url, name, 
         "scrollbars=no,status=no,resizable=no,width=530,height=200");
}
</script>
</head>
<body>
<center>

<table align="center" >

   <tr height="40"><td></td></tr>
   <tr height="40">
      <td width=140 ><b>아이디<font color="#FF0000">  *</font></b> </td>
      <td width=200 ><s:property value="memParam.m_id"/></td>
   </tr>
   
   <tr height="40">
      <td><b>이름<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_name"/></td>
      <td width="130" rowspan="4" align="center">
         <s:if test="memParam.prof_image_save==null">
            <div id="noimage"/>
         </s:if>
         <s:else>
         	<img width="160" height="160" src="/Arista/admin/member/profUpload/<s:property value="memParam.prof_image_save"/>">
         </s:else>
      </td>
   </tr>
   <tr height="40">
      <td><b>닉네임<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_nickname"/></td>
   </tr>
   <tr height="40">   
      <td><b>휴대폰 번호<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_mobilephone"/></td>
   </tr>
   <tr height="40">
      <td><b>생년월일<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_birthyear"/></td>
   </tr>
   <tr height="40">
      <td><b>지역<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_region"/></td>
   </tr>
   <tr height="40">
      <td><b>이메일<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_email"/></td>
   </tr>
   <tr height="40">
      <td><b>포지션<font color="#FF0000">  *</font></b> </td>
      <td> <s:property value="memParam.m_position"/></td>
   </tr>
   <tr height="40">
      <td><b>가입일</b> </td>
      <td> <s:property value="memParam.m_joindate"/></td>
   </tr>
</h5>   
</table>

<br><br>
<table>
<tr height="23">
   <td align="center" width=100><input type="button" style="width:200px; height:40px;" value="수   정" onclick="location.href='modiftyMemberForm.action'" id="bu_1"></td>
   
   <td width=80></td>
   <td align="center" width=100>
      <input type="button" id="bu_1" style="width:200px; height:40px;" value="탈   퇴" onclick="javascript:open_win_noresizable('deleteMemberPW.action?m_id=<s:property value="memParam.m_id"/>','delete')">
   </td> 
</tr>
<tr height="100"></tr>
</table>
</center>

</body>
</html>