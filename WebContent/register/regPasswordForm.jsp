<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${logStatus==null || logStatus!='Y' }">
	<script>
		location.href="<%=request.getContextPath()%>/index.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webJSP/etc/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webJSP/etc/bootstrap.js"></script>
<style>
	#content{
		text-align: center;
		padding:100px 20px;
	}
</style>
<script>
	$(function(){
		$('#leaveForm').submit(function(){
			if($('#userpwd').val()==""){
				alert("비밀번호를 입력후 탈퇴가 가능합니다.");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
<div class="container">
	<%@ include file ="../inc/top.jspf" %>
	<div id="content">
		<form method="post" id="leaveForm" action="<%=request.getContextPath() %>/register/regLeaveFormOk.do">	
		비밀번호 입력 : <input type="password" name="userpwd" id="userpwd"/>	
					<input type="submit" value="회원탈퇴하기"/>				
		</form>
	</div>
</div>
</body>
</html>