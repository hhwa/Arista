<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
/* Add a dark background color to the footer */
footer {
    background-color: #2d2d30;
    color: #f5f5f5;
    padding: 32   px;
}

footer a {
    color: #f5f5f5;
}

footer a:hover {
    color: #777;
    text-decoration: none;
}
</style>
 <script>
$(document).ready(function(){
    // Initialize Tooltip
    $('[data-toggle="tooltip"]').tooltip(); 
})
</script> 
</head>
<body>
<footer class="text-center">
  <a class="up-arrow" href="#" data-toggle="tooltip" title="�� ����">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <br>
  <br>
   
   <a href="PrivacyView.action"> ��������ó����ħ</a> &nbsp;
   <a href="mypage.action"> �̿��� </a> &nbsp;
   <a href="#"> �̸��Ϲ��ܼ����ź� </a> &nbsp;
   
 <p><span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;Copyright�� 2017 Off The Match. All rights reserved. e-mail : hyunhwa91@naver.com</p>
 <p><a href="#" onclick="return false;" data-toggle="tooltip" title="park & moon"><img src="/Arista/template/image/footer_logo.png" width="10%"/></a></p>
</footer>
</body>
</html>