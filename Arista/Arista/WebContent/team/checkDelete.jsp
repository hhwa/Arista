<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���� Ȯ��</title>
</head>
<body>

<h3>���� ���� �Ͻðڽ��ϱ�?</h3>
  	
  	<form action="TeamDelete.action" method="post">
  	<s:hidden name="team_no" value="%{team_no}" />
  	<s:hidden name="currentPage" value="%{currentPage}" />
  		
  	<table width="250" border="0" cellspacing="0" cellpadding="0">
  	
		<tr>
        <td width="150" bgcolor="#FFFFFF">
          &nbsp;&nbsp;<input name="submit" type="submit" value="��">
          &nbsp;&nbsp;<input name="view" type="button" value="�ƴϿ�" onClick="window.close();"></td>
        </tr>
 

      
    </table>
  
  </form>
  
</body>
</html>