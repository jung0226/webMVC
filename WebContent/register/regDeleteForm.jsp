<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	#content li{
		text-align:center;
		padding:5px;
	}
	#content li:last-child{
		width:100%;
	}
</style>
</head>
<body>
<div class="container">
	<%@ include file ="../inc/top.jspf" %>
	<div id="content">
		<h1>회원탈퇴</h1>
		<form method="post" id="regFrm" action="/webMVC/register/regDeleteFormOk.do">
		<ul>
			<li>회원탈퇴를 하시면 복구할 수 없습니다.</li>
			<li>회원탈퇴를 하시겠습니까?</li>
			<li></li>
			<li>
				<input type="submit" value="회원탈퇴하기"/>
			</li>
		</ul>
		</form>
	</div>
</div>
</body>
</html>