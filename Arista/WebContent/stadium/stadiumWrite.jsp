<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="s" uri="/struts-tags" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.bottom {
	display:black;
	border: none;
	border-bottom: 1px solid #000000;
	border-color: #000000;
	width:60px;
	/*font-family: 'Lucida Handwriting', serif;*/
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="/Arista/css/style.css" type="text/css"/>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //�� ���������� ���θ� �ּ� ǥ�� ��Ŀ� ���� ���ɿ� ����, �������� �����͸� �����Ͽ� �ùٸ� �ּҸ� �����ϴ� ����� �����մϴ�.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // �˾����� �˻���� �׸��� Ŭ�������� ������ �ڵ带 �ۼ��ϴ� �κ�.

                // ���θ� �ּ��� ���� ��Ģ�� ���� �ּҸ� �����Ѵ�.
                // �������� ������ ���� ���� ��쿣 ����('')���� �����Ƿ�, �̸� �����Ͽ� �б� �Ѵ�.
                var fullRoadAddr = data.roadAddress; // ���θ� �ּ� ����
                var extraRoadAddr = ''; // ���θ� ������ �ּ� ����

                // ���������� ���� ��� �߰��Ѵ�. (�������� ����)
                // �������� ��� ������ ���ڰ� "��/��/��"�� ������.
                if(data.bname !== '' && /[��|��|��]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // �ǹ����� �ְ�, ���������� ��� �߰��Ѵ�.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // ���θ�, ���� ������ �ּҰ� ���� ���, ��ȣ���� �߰��� ���� ���ڿ��� �����.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // ���θ�, ���� �ּ��� ������ ���� �ش� ������ �ּҸ� �߰��Ѵ�.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // �����ȣ�� �ּ� ������ �ش� �ʵ忡 �ִ´�.
                document.StadiumForm.stadium_zipcode.value=data.zonecode; //5�ڸ� �����ּ�
                document.StadiumForm.stadium_addr.value=fullRoadAddr;	//���θ��ּ�
                /* document.StadiumForm.address2.value=data.jibunAddress; //�����ּ� */
               

                // ����ڰ� '���� ����'�� Ŭ���� ���, ���� �ּҶ�� ǥ�ø� ���ش�.
                if(data.autoRoadAddress) {
                    //����Ǵ� ���θ� �ּҿ� ������ �ּҸ� �߰��Ѵ�.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(���� ���θ� �ּ� : ' + expRoadAddr + ')';

               /*  } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(���� ���� �ּ� : ' + expJibunAddr + ')'; */

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
    function validation(){
    	var frm = document.StadiumForm;
    	
    	if(frm.stadium_name.value == ""){
    		alert("����� �̸��� �Է����ּ���.");
    		return false;
    	}
    	else if(frm.stadium_tel.value == "����"){
    		alert("��ȭ��ȣ�� �Է����ּ���");
    		return false;
    	}
    	else if(frm.stadium_zipcode.value == "����"){
    		alert("�ּҸ� �Է����ּ���");
    		return false;
    	}
    	else if(frm.stadium_addr2.value == "����"){
    		alert("���ּҸ� �Է����ּ���.");
    		return false;
    	}
    	else if(frm.stadium_day.value == "����"){
    		alert("�̿� ���� ������ �������ּ���");
    		return false;
    	}
    	else if(frm.stadium_time.value == ""){
    		alert("�̿� ���� �ð��� �������ּ���.");
    		return false;
    	}
    	return true;
    }
</script>
<title>����� ���</title>

</head>

<body>
   
<s:if test="resultClass == NULL">
	<form action="StadiumWrite.action" name="StadiumForm" method="post" enctype="multipart/form-data">
</s:if>
     
<s:else>
	<form action="StadiumModify.action" name="StadiumForm" method="post" enctype="multipart/form-data">
    	<s:hidden name="stadium_no" value="%{resultClass.stadium_no}" />
        <s:hidden name="currentPage" value="%{currentPage}" />
        <s:hidden name="old_file" value="%{resultClass.stadium_main_img_save}" />
</s:else>
        
	<table align="center">
		<tr height="50"><td></td></tr>
		<tr>
        	<td colspan="11" class="font_12" align="right" style="padding:0px 50px"><font color="#FF0000">*</font>�� �ʼ� �Է»����Դϴ�.</td>
        </tr>
        <tr height="20" ><td></td></tr>
         
        <tr height="40">
        	<td width="200"><b>����� �̸� <font color="#FF0000">*</font></b></td>
        	<td width="300">
           		<s:if test="resultClass == NULL">
        		<s:textfield name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" />
        		</s:if>
        		<s:else>
        		<s:hidden name="stadium_name" theme="simple" value="%{resultClass.stadium_name}" /><s:property value="resultClass.stadium_name"/>
        		</s:else>
           	</td>
        </tr>
         	
        <tr height="40">
        	<td width="200"><b>����� ���� <font color="#FF0000">*</font></b></td>
        	<td width="300">
        		<input type="radio" name="stadium_type" value="ǲ������" <s:if test="resultClass.stadium_type eq 'ǲ������'"> checked="checked"</s:if>/>ǲ������&nbsp;
         		<input type="radio" name="stadium_type" value="�౸�����" <s:if test="resultClass.stadium_type eq '�౸�����'"> checked="checked"</s:if>/>�౸�����
           	</td>
        </tr>
              
        <tr height="40">
        	<td width="200"><b>��ȭ��ȣ <font color="#FF0000">*</font></b></td>
           	<td width="500">
           		<s:textfield name="stadium_tel" theme="simple" value="%{stadium_tel}" maxlength="4" cssClass="bottom" id="bu_in" cssStyle="width:50px;"/>&nbsp; - &nbsp;
           		<s:textfield name="stadium_tel1" theme="simple" value="%{stadium_tel1}"  maxlength="4"cssClass="bottom" id="bu_in" cssStyle="width:50px;" />&nbsp; - &nbsp;
           		<s:textfield name="stadium_tel2" theme="simple" value="%{stadium_tel2}" maxlength="4"cssClass="bottom" id="bu_in" cssStyle="width:50px;" />
            </td>
        </tr>
             
        <tr height="40">
        	<td width="200"><b>�����ȣ <font color="#FF0000">*</font></b></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:80px; padding:0px 0px 0px 10px;" name="stadium_zipcode" value="${resultClass.stadium_zipcode }" readonly="readonly">
				<input type="button" id="bu_1" value="�����ȣã��" onclick="DaumPostcode()" placehoder="�����ȣ�� �˻��ϼ���">
			</td>
		</tr>
		<tr>
		<tr height="40">
        	<td width="200"><b>���θ� �ּ� <font color="#FF0000">*</font></b></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:370px; padding:0px 0px 0px 10px;" name="stadium_addr" value="${resultClass.stadium_addr }" placeholder="���θ��ּ�" readonly="readonly"/>
			</td>
		</tr>
		<tr height="40">
          	<td width="200"></td>
          	<td width="500">
				<input type="text" class="bottom" style="width:370px; padding:0px 0px 0px 10px;" name="stadium_addr2" value="${resultClass.stadium_addr2 }" placeholder="���ּ�"/>
			<!-- <input type="text" id="address2" name="address2" placeholder="�����ּ�"> -->
			</td>
			<span id="guide" style="color:#999"></span>
		</tr>
        <tr height="40">
          	<td width="200"><b>��� ���� ���� <font color="#FF0000">*</font></b></td>
          	<td width="500">
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="mon != null"> checked="checked"</s:if>>��&nbsp;
          		<input type="checkbox" name="stadium_days" value="ȭ" <s:if test="tue != null"> checked="checked"</s:if>>ȭ&nbsp;
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="wed != null"> checked="checked"</s:if>>��&nbsp;
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="thu != null"> checked="checked"</s:if>>��&nbsp;
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="fri != null"> checked="checked"</s:if>>��&nbsp;
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="sat != null"> checked="checked"</s:if>>��&nbsp;
          		<input type="checkbox" name="stadium_days" value="��" <s:if test="sun != null"> checked="checked"</s:if>>��&nbsp;
        		<%-- <s:textfield name="stadium_day" theme="simple" value="%{resultClass.stadium_day}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" /> --%>
            </td>
        </tr>
             
              
        <tr height="40">
        	<td width="200"><b>��� ���� �ð� <font color="#FF0000">*</font></b></td>
          	<td width="500">
          	<select name="stadium_time" class="bottom" id="bu_in">
          		<s:iterator value="timeList" status="stat">
          			<s:if test="stadium_time eq timeList[#stat.index]">
          			<option value="<s:property/>" selected="selected"><s:property/></option>
          			</s:if>
          			<s:else>
          			<option value="<s:property/>"><s:property/></option>
          			</s:else>
          		</s:iterator>
          	</select>&nbsp; ~ &nbsp;
          	<select name="stadium_time1" class="bottom" id="bu_in">
          		<s:iterator value="timeList" status="stat">
          			<s:if test="stadium_time1 eq timeList[#stat.index]">
          				<option value="<s:property/>" selected="selected"><s:property/></option>
          			</s:if>
          			<s:else>
          				<option value="<s:property/>"><s:property/></option>
          			</s:else>
          		</s:iterator>
          	</select>	
            	<%-- <s:textfield name="stadium_time" theme="simple" value="%{resultClass.stadium_time}" cssClass="bottom" id="bu_in" cssStyle="width:370px" maxlength="50" /> --%>
            </td>
        </tr>
             
        <tr height="40">
        	<td width="200"><b>����� �̹��� <font color="#FF0000">*</font></b></td>
            <td width="500">
            	<s:file name="upload" theme="simple" />
                 
                <s:if test="resultClass.stadium_main_img_org != NULL" >
                &nbsp; * <s:property value="resultClass.stadium_main_img_org" />������ ��ϵǾ� �ֽ��ϴ�. �ٽ� ���ε��ϸ� ������ ������ �����˴ϴ�.
                </s:if>
            </td>
        </tr>
                
        <tr>
        	<td height="30" colspan="2"></td>
        </tr>
                 
        <tr height="100">
          	<td align="right" colspan="2">
        	    <input name="submit" type="submit" style="width:125px; height:25px;" value="�ۼ��Ϸ�" class="bu_2"/>
                <input name="stadiumlist" type="button" style="width:125px; height:25px;" value="���" class="bu_2" onClick="javascript:location.href='StadiumList.action?currentPage=<s:property value="currentPage" />'"/>
            </td>
        </tr>
        <tr height="100"></tr>
	</table>
    </form>
</body>
</html>