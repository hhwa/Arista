<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js" integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <script>
$(document).ready(function(){
    // Initialize Tooltip
    $('a[data-toggle="tooltip"]').tooltip(); 
    
    $("#test").click(function() {
    	
    	return false;

    })
})
</script> 
</head>
<body>
<footer class="text-center">
<br>
	<a class="up-arrow" href="#" data-toggle="tooltip" title="�� ����">
		<span class="glyphicon glyphicon-chevron-up"></span>
	</a>
	<br>
	<br>
	
	<a class="bu_2" href="privacy.action" style="color:#FFFFFF;"> ��������ó����ħ</a> &nbsp;
	<a href="promise.action" style="color:#FFFFFF;"> �̿��� </a> &nbsp;
	<a href="emailx.action" style="color:#FFFFFF;"> �̸��Ϲ��ܼ����ź� </a> &nbsp;
	
 <p><span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;Copyright�� 2018 Off The Match. All rights reserved. e-mail : hyunhwa91@naver.com</p>
 <p><a href="#" onclick="return false;" data-toggle="tooltip" title="OFF_THE_BALL"><!-- <img src="/Arista/template/image/footer_logo.png" width="10%"/> --></a></p><br>
</footer>
</body>
</html>