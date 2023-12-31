<%@ page contentType="text/html; charset=euc-kr" %>

<%-- <%@ page import="com.model2.mvc.service.domain.*" %> --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%
	User vo=(User)session.getAttribute("user");

	String role="";

	if(vo != null) {
		role=vo.getRole();
	}
%> --%>

<html>
<head>
<title>Model2 MVC Shop</title>

<link href="/css/left.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js" ></script>
<script type="text/javascript">
function history(){
	popWin = window.open("/history.jsp","popWin","left=300, top=200, width=300, height=200, marginwidth=0, marginheight=0, scrollbars=no, scrolling=no, menubar=no, resizable=no");
}

$(function () {
	
	
	$(".Depth03:contains('개인정보조회')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/getUser?userId=${user.userId}");	
	})	
	$(".Depth03:contains('회원정보조회')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/user/listUser")
	})
	$(".Depth03:contains('판매상품등록')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","../product/addProductView.jsp")
	})
	$(".Depth03:contains('판매상품관리')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=manage")
	})
	$(".Depth03:contains('상 품 검 색')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/product/listProduct?menu=search")
	})
	$(".Depth03:contains('구매이력조회')").on("click",function(){
		$(window.parent.frames["rightFrame"].document.location).attr("href","/purchase/listPurchase?menu=search")
	})
	/*window.navigator.geolocation.getCurrentPosition(success, error);//()를 붙여 자동호출하는것 x

 function success(position){
	$('#test').text("내 위치 위도 = " + position.coords.latitude
			+" 내 위치 경도 = " + position.coords.longitude);
}
function error(err){
	$('#test').text("조회 실패 ==>" + err.code);} */
})
</script>
</head>

<body background="/images/left/imgLeftBg.gif" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"  >

<table width="159" border="0" cellspacing="0" cellpadding="0">

<!--menu 01 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159" >	
		<tr>
		
		<c:if test="${! empty user }">
		<tr>
		<td class="Depth03">
			개인정보조회
		</td>
		</tr>
		</c:if>
		<c:if test="${user.role == 'admin' }">
		<tr>
		<td class="Depth03" >
			회원정보조회
		</td>
		</tr>
		</c:if>
		
		<%-- <%
			if(vo != null){
		%>
		<tr>
		<td class="Depth03">
			<a href="/getUser.do?userId=<%=vo.getUserId() %>" target="rightFrame">개인정보조회</a>
		</td>
		</tr>
		<%
			}
		%>
		<%
			if(role.equals("admin")){
		%>
		<tr>
		<td class="Depth03" >
			<a href="/listUser.do" target="rightFrame">회원정보조회</a>
		</td>
		</tr>
		<%
			}
		%> --%>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>

	<%-- <%
		if(role.equals("admin")){
	%>
<!--menu 02 line-->
<tr>
<td valign="top"> 
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				<a href="../product/addProductView.jsp;" target="rightFrame">판매상품등록</a>
			</td>
		</tr>
		<td class="Depth03">
				<a href="/listProduct.do?menu=manage" target="rightFrame">판매상품관리</a>
			</td>
		</tr>
		<tr>
			<td class="DepthEnd">&nbsp;</td>
		</tr>
	</table>
</td>
</tr>
	<%
				}
	%> --%>

		<c:if test="${user.role == 'admin' }">
			<tr>
				<td valign="top">
					<table border="0" cellspacing="0" cellpadding="0" width="159">
						<tr>
							<td class="Depth03">판매상품등록</td>
						</tr>
						<td class="Depth03">판매상품관리</td>
						</tr>
						<tr>
							<td class="DepthEnd">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</c:if>

		<!--menu 03 line-->
<tr>
<td valign="top">
	<table  border="0" cellspacing="0" cellpadding="0" width="159">
		<tr>
			<td class="Depth03">
				상 품 검 색
			</td>
		</tr>
		
		<c:if test="${! empty user && user.role == 'user' }">
			<tr>
				<td class="Depth03">
					구매이력조회
				</td>
			</tr>
		</c:if>
		<%-- <%
			if(vo != null){
				if(role.equals("user")){
		%>
		<tr>
			<td class="Depth03">
				<a href="/listPurchase.do" target="rightFrame">구매이력조회</a>
			</td>
		</tr>
		<%
				}
			}
		%> --%>
		<tr>
		<td class="DepthEnd">&nbsp;</td>
		</tr>
		<tr>
			<td class="Depth03">
				<a href="javascript:history()">최근 본 상품</a>
			</td>
			
			<td class="Depth03" id ='test'>
				
			</td>
		</tr>
	</table>
</td>
</tr>

</table>
</body>
</html>