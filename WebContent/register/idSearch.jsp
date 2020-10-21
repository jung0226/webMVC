<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webMVC/library/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webMVC/library/bootstrap.js"></script>
<script>
	$(function(){
		$("#search").submit(function(){
			if($('#userid').val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}
			return true;
		});
		//검색한 아이디 적용
		$('#setUserid').click(function(){
			//검색한 아이디
			opener.document.getElementById("userid").value='${userid}'; // 'abad' , abad로 따옴표없으면 변수가 됨.
			opener.document.getElementById("idStatus").value='Y';
			self.close();
		});
	});
</script>
</head>
<body>
	<h1>아이디 중복 검사</h1>
		<c:if test="${result>0}">
			<b>${userid }</b>는 사용불가능한 아이디입니다.
		</c:if>
		<c:if test="${result==0}">
			<b>${userid}</b>는 사용 가능한 아이디 입니다.
			<input type="button" value="사용하기" id="setUserid"/>
		</c:if>
	<hr/>
		<form method="post" id="search" action="<%=request.getContextPath()%>/register/idSearch.do">
			아이디 : <input type="text" name="userid" id="userid"/>
			<input type="submit" value="아이디 중복검사하기"/>
		</form>
	
</body>
</html>