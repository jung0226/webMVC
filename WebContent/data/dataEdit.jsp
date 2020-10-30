<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${logStatus==null || logStatus!='Y'}">
	<script>
		location.href="/webMVC/login.do";
	</script>
</c:if>
<c:if test="${logId!=vo.userid }">
	<script>
		alert("작성자만 글을 수정할 수 있습니다.");
		location.href="/webMVC/data/dataList.do";
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
		
		//첨부파일
		$('b').click(function(){
			$(this).parent().next().attr("type","file");
			$(this).parent().next().next().attr("name","delfile");
			$(this).parent().remove();
		});
		
		
		//데이터 존재 유무 확인
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
			if($('#delfile1').val()!=""){
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
		<form id="dataForm" method="post" action="<%=request.getContextPath()%>/data/dataEditOk.do" enctype="multipart/form-data">
			<ul>
				<input type="hidden" name="no" value="${vo.no }"/>
				<li>제목</li>
				<li><input type="text" name="title" id="title" value="${vo.title }"/></li>
				<li><textarea name="content" id="content">${vo.content }</textarea></li>
				<!-- 첫번째 첨부파일 -->
				<li>
					<div>${vo.filename1 } <b>X</b></div>
					<input type="hidden" name="filename1" id="filename1"/>
					<input type="hidden" name="" id="delfile1" value="${vo.filename1 }"/>
				</li>
				<!-- 두번째 첨부파일 -->
				<li>
					<!-- 두 번째 첨부파일이 있을 때  -->
					<c:if test="${vo.filename2!=null }">
						<div>${vo.filename2 } <b>X</b></div>
						<input type="hidden" name="filename2" id="filename2"/>
						<input type="hidden" name="" id="delfile1" value="${vo.filename2 }"/>
					</c:if>
					<c:if test="${vo.filename2==null }">
						<input type="file" name="filename2" id="filename2"/>
					</c:if>
				</li>

				<li><input type="submit" value="자료실 글 수정"/>
					<input type="reset" value="다시쓰기"/>
				</li>
			</ul>
		</form>	
	</div>
</div>

</body>
</html>