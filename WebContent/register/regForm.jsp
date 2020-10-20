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
		float:left;
		width:20%;
		padding:5px;
	}
	#content li:nth-child(2n){
		width:80%;
	}
	#content li:last-child{
		width:100%;
		text-align:center;
	}
</style>
</head>
<body>
<div class="container">
	<%@ include file ="../inc/top.jspf" %>
	<div id="content">
		<h1>회원가입 폼</h1>
		<form method="post" id="regFrm" action="/webMVC/register/regFormOk.do">
		<ul>
			<li>아이디</li>
			<!-- 아이디 중복검사 -->
			<li><input type="text" name="userid" id="userid" placeholder="아이디 입력"/>
				<input type="button" value="아이디 중복 검사"/>
			</li>
			<li>비밀번호</li>
			<li><input type="password" name="userpwd" id="userpwd"/></li>
			<li>비밀번호 확인</li>
			<li><input type="password" name="userpwdChk" id="userpwdChk"/></li>
			<li>이름</li>
			<li><input type="text" name="username" id="username"/></li>
			<li>성별</li>
			<li><input type="radio" name="gender" value="M" checked/>남자
				<input type="radio" name="gender" value="F"/>여자</li>
			<li>생년월일</li>
			<li><input type="text" name="year" id="year" size="4" placeholder="2020"/>년
				<select name="month" id="month">
					<script>
						for(i=1; i<=12; i++){
							if(i<10){
								document.write("<option value=='0"+i+"'>0"+i+"</option>");
							}else{
								document.write("<option value=='"+i+"'>"+i+"</option>");								
							}
						}
					</script>
				</select>월
				<select>
					<script>
						var tag=""
						for(i=1;i<=31;i++){
							tag+="<option value='";
							if(i<10){
								tag += "0"+i;
							}else{
								tag += i;
							}
							tag += "'>"+i+"</option>";
						}
						document.write(tag);
					</script>
				</select>일</li>
			<li>전화번호</li>
			<li><select name="tel1" id="tel1">
				<option value="010">010</option>
				<option value="02">02</option>
				<option vlaue="031">031</option>
				<option value="032">032</option>
			</select>-
			<input type="text" name="tel2" id="tel2" size="4"/>-
			<input type="text" name="tel3" id="tel3" size="4"/>
			</li>
			<li>이메일</li>
			<li><input type="text" name="email" id="email" size="20"/></li>
			<li>우편번호</li>
			<li><input type="text" name="zipcode" id="zipcode" size="5"/>
				<input type="button" value="우편번호검색"/>
				<input type="text" name="addr" id="addr" size="40"/>
			</li>
			<li>상세 주소</li>
			<li><input type="text" name="addrdetail" id="addrdetail" size="40"/></li>
			<li>
				<input type="submit" value="회원가입하기"/>
				<input type="reset" value="다시쓰기"/>
			</li>
		</ul>
		</form>
	</div>
</div>
</body>
</html>