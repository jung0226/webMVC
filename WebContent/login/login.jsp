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
		body{
			margin:0px;
			background-color:#ddd;			
		}
		a:link, a:visited, a:hover{
			text-decoration:none;
			color:gray;
		}
		#mainDiv{
			width:700px;
			height:100vh;/*높이는 백분율이 안 됨.*/
			margin:0 auto;
			background-color:#fff;
		}
		.bar{
			border-bottom: 2px solid #ddd;		
		}
		#logo{
			height:90px;
			text-align:center;
		}
		#logo img{
			height:90px;			
		}
		#logfrm{
			padding: 50px 40px 60px;
			overflow:auto;
		}
		#logfrm>*{}
		#logfrm>div, #logform>img, #logstate>div{
			float:left;		
		}
		#logfrm>div{
			width:300px;
			margin-right:70px;
		}
		#logfrm>img{
			border: 1px solid #ddd;
			width:248px;
		}
		#frm>input:not([type=submit]){
			width:297px;
			height:48px;
			padding:0px;
			bold: 1px solid #ddd;
			font-size:20px;
			font-weight:bold;	
			margin-bottom:5px;		
		}
		#frm>input[type=submit]{
			width:300px;
			height:48px;
			background-color:rgb(77,139,235);
			border: 1px solid #ddd;
			font-size:20px;
			color:#fff;		
			margin:10px 0px 10px;	
		}
		/* 로그인 상태 유지 */
		#logstate>div{
			width:50%;
			color:gray;
			margin-bottom:10px;
		}
		#logstate>div:last-child{
			text-align: right;
		}
		#logstate span{
			color:rgb(77,139,235);
			font-weight:bold;
		}
		/* 아이디, 비밀번호 찾기 */
		.search{
			text-align:center;
			margin-bottom:10px;
		}
	</style>	
	<script>
		$(function(){
			$('#frm').submit(function(){
				if($('#userid').val()==""){
					alert("아이디를 입력하세요.");
					return false;
				}
				if($('#userpwd').val()==""){
					alert("비밀번호를 입력하세요.");
					return false;
				}
				return true;
			});
		});
	</script>
</head>
<body>
	<div id="mainDiv">
		<div id="logo" class="bar"><a href="/webMVC/index.do"><img src="/webMVC/login/logo.png"/></a></div>
		<div id="logfrm" class="bar">
			<div>
				<!-- 로그인 폼 -->
				<form method="post" action="/webMVC/loginOk.do" id="frm">
					<input type="text" name="userid" id="userid"maxlength="20" placeholder="아이디입력"/>
					<input type="password" name="userpwd" id="userpwd" maxlength="20" placeholder="비밀번호 입력"/>
					<input type="submit" value="로그인"/>
				</form>
				
				<div id="logstate" style="overflow:auto"><!-- 로그인 상태 유지 -->
					<div><input type="checkbox"/>로그인 상태 유지</div>
					<div>
						<a href="#">IP보안</a>
						<span>ON</span>
					</div>
				</div>
				<div class="search">
					<a href="#">아이디 찾기</a>
					<a href="#">비밀번호 찾기</a>
				</div>
			</div>
			<img src="/webMVC/login/ad.png" title="banner"/>
		</div>
		<div class="search">
			&copy;kakao Corp. | <a href="#">고객센터</a>
		</div>
	
	</div>

</body>
</html>