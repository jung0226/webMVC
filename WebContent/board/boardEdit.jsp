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
<script src="<%=request.getContextPath() %>/library/ckeditor/ckeditor.js"></script>
<style>
	#subject{
		width:600px;
	}
</style>
<script>
	$(function(){
		CKEDITOR.replace("content");
		$('#editFrm').submit(function(){
			if($('#subject').val()==""){
				alert("제목을 입력하세요");
				return false;
			}
			if(CKEDITOR.instances.content.getData()==""){
				alert("글 내용을 입력하세요.");
				return false;
			}
			return true;
		});	
	})
	
	
</script>
</head>
<body>
	<div class="container">	
	<%@ include file="../inc/top.jspf" %>
		<h1>글 수정하기</h1>
		<form method="post" action="<%=request.getContextPath() %>/board/boardEditOk.do" id="editFrm">
		<input type="hidden" name="no" value="${vo.no }"/>
		<input type="hidden" name="nowPage" value="${pVO.nowPage }"/>
		<c:if test="${pVO.searchWord!=null }">
			<input type="hidden" name="searchKey" value="${pVO.searchKey }"/>
			<input type="hidden" name="searchWord" value="${pVO.searchWord }"/>
		</c:if>
			<ul>
				<li>글 제목</li>
				<li><input type="text" name="subject" id="subject" value="${vo.subject }"/></li>
				<li>글 내용</li>
				<li><textarea name="content" id="content" >${vo.content}</textarea></li>
				<li>
					<input type="submit" value="글수정">
					<input type="reset" value="다시쓰기">
				</li>
			</ul>
		</form>
	</div>

</body>
</html>