<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${logStatus==null || logStatus!='Y' }">
	<script>
		location.href="/webMVC/login.do";
	</script>
</c:if>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webMVC/library/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webMVC/library/bootstrap.js"></script>
<script src="/webMVC/library/ckeditor/ckeditor.js"></script>
<style>
	#title{width:100%}
</style>
<script>
	$(function(){ 
		CKEDITOR.replace("content");		
		
		$('#dataForm').submit(function(){
			if($('#title').val()==""){
				alert("글제목을 입력하세요.");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글내용을 입력하세요.");
				return false;				
			}

			//첨부파일의 수를 구한다.
			var fileCount=0;			
			console.log($('#filename1').val());
			if($('#filename1').val()!=""){
				fileCount++;
			}
			if($('#filename2').val()!=""){
				fileCount++;
			}
			if(fileCount<1){
				alert("첨부파일을 1개 이상 반드시 선택하세요.");
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>

<div class="container">
	<%@include file="../inc/top.jspf" %>
	<div>
		<h1>자료실 글 올리기</h1>																		<!-- 파일 첨부시 반드시 enctype이 있어야 한다. -->
		<form id="dataForm" method="post" action="<%=request.getContextPath()%>/data/dataWriteOk.do" enctype="multipart/form-data">
			<ul>
				<li>제목</li>
				<li><input type="text" name="title" id="title"/></li>
				<li><textarea name="content" id="content"></textarea></li>
				<li>첨부파일 : <input type="file" name="filename1" id="filename1"/></li>
				<li>첨부파일 : <input type="file" name="filename2" id="filename2"/></li>
				<li><input type="submit" value="자료올리기"/>
					<input type="reset" value="다시쓰기"/>
				</li>
			</ul>
		</form>	
	</div>
</div>

</body>
</html>