<%@ page contentType="text/html; charset=euc-kr" %>

<%-- <%@ page import="com.model2.mvc.service.domain.*" %>

<%
	User vo=(User)request.getAttribute("user");
%> --%>

<html>
<head>
<title>ȸ����������</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
<!--
	function fncUpdateUser() {
	
		var name=$("input[name='userName']").val();
		
		if(name == null || name.length <1){
			alert("�̸���  �ݵ�� �Է��ϼž� �մϴ�.");
			return;
		}
			
		var value = "";	
		if( $("input[name='phone2']").val() != ""  &&  $("input[name='phone3']").val() != "") {
			var value = $("option:selected").val() + "-" 
								+ $("input[name='phone2']").val() + "-" 
								+ $("input[name='phone3']").val();
		}
		
		$("input:hidden[name='phone']").val( value );
		$("form").attr("action","/user/updateUser").attr("method","POST").submit();
	}
	
	$(function () {
		$(".ct_btn01:contains('����')").on("click",function(){
			fncUpdateUser();
		})
		
	})

	
    $(function () {
    	$("input[name='email']").on("change",function(){
    		
    	
	    	var email = $("input[name='email']").val();
	    	if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1)){
	        	alert("�̸��� ������ �ƴմϴ�.");
	        	
	        }
    	})
		
	})
	
	$(function () {
		$(".ct_btn01:contains('���')").on("click",function(){
			history.go(-1);
		})
		
	})
    
 
-->
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<form name="detailForm"  >

<input type="hidden" name="userId" value="${user.userId }">

<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="15" height="37">
			<img src="/images/ct_ttl_img01.gif" width="15" height="37">
		</td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">ȸ����������</td>
					<td width="20%" align="right">&nbsp;</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif" width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:13px;">
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">
			���̵� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="105">${user.userId }</td>
					<td>	</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">
			�̸� <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle">
		</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input type="text" name="userName" value="${user.userName }" class="ct_input_g" 
						style="width:100px; height:19px"  maxLength="50" >
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	
	<tr>
		<td width="104" class="ct_write">�ּ�</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<input 	type="text" name="addr" value="${user.addr }" class="ct_input_g" 
							style="width:370px; height:19px"  maxLength="100">
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�޴���ȭ��ȣ</td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<select 	name="phone1" class="ct_input_g" style="width:50px" 
							onChange="document.detailForm.phone2.focus();">
						<%-- <% 010,011 �� �Ľ��Ͽ� ���õǰ� ���ֱ� ����
						String phone1 = "";
						String phone2 = "";
						String phone3 = "";
						if (vo.getPhone() != null) {
							phone1 = vo.getPhone().split("-")[0];
							phone2 = vo.getPhone().split("-")[1];
							phone3 = vo.getPhone().split("-")[2];
						}
						%>
						<option value="010" <%=phone1.equals("010") ? "selected" : ""%>>010</option>
						<option value="011" <%=phone1.equals("011") ? "selected" : ""%>>011</option>
						<option value="016" <%=phone1.equals("016") ? "selected" : ""%>>016</option>
						<option value="018" <%=phone1.equals("018") ? "selected" : ""%>>018</option>
						<option value="019" <%=phone1.equals("019") ? "selected" : ""%>>019</option> --%>
						
						<!-- &&�� ���� ���� ã�´� but �ϳ��� false �� ��� �Ѿ
						||�� �ϳ��� ���� ã�� ������ �ϳ��� true �� ��� true -->
						<option value="010"
							${ ! empty user.phone1 && user.phone1 == "010" ? "selected" : ""  }>010</option>
						<option value="011"
							${ ! empty user.phone1 && user.phone1 == "011" ? "selected" : ""  }>011</option>
						<option value="016"
							${ ! empty user.phone1 && user.phone1 == "016" ? "selected" : ""  }>016</option>
						<option value="018"
							${ ! empty user.phone1 && user.phone1 == "018" ? "selected" : ""  }>018</option>
						<option value="019"
							${ ! empty user.phone1 && user.phone1 == "019" ? "selected" : ""  }>019</option>
				</select>
			<%-- <input type="text" name="phone2"
					value="<%=phone2.equals("") ? "" : phone2%>" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="9"> - <input
					type="text" name="phone3"
					value="<%=phone3.equals("") ? "" : phone3%>" class="ct_input_g"
					style="width: 100px; height: 19px" maxLength="9"> --%>
					
					<input 	type="text" name="phone2" value="${ ! empty user.phone2 ? user.phone2 : ''}" 
							class="ct_input_g" style="width:100px; height:19px"  maxLength="9" >
					- 
					<input 	type="text" name="phone3" value="${ ! empty user.phone3 ? user.phone3 : ''}"  
							class="ct_input_g"  style="width:100px; height:19px"  maxLength="9" >
					<input type="hidden" name="phone" class="ct_input_g" />
				</td>
	</tr>

	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
	<tr>
		<td width="104" class="ct_write">�̸��� </td>
		<td bgcolor="D6D6D6" width="1"></td>
		<td class="ct_write01">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="26">
						<input 	type="text" name="email" value="${user.email }" class="ct_input_g" 
										style="width:100px; height:19px" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td height="1" colspan="3" bgcolor="D6D6D6"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
	<tr>
		<td width="53%"></td>
		<td align="right">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						����
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
					</td>
					<td width="30"></td>					
					<td width="17" height="23">
						<img src="/images/ct_btnbg01.gif" width="17" height="23">
					</td>
					<td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
						���
					</td>
					<td width="14" height="23">
						<img src="/images/ct_btnbg03.gif" width="14" height="23">
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>

</body>
</html>