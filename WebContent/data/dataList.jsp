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
<style>
	#content li{
		float:left;
		width:10%;
		line-height:40px;
		border-bottom:1px solid gray;
	}
	#content li:nth-of-type(6n+2){
		width:50%;
	}
</style>
<script>
	$(function(){
		$("#content>ul>li>a>img").click(function(){
			var url = "/webMVC/data/downloadCount.do";
			//레코드 번호
			var params="no="+$(this).attr("alt")
			
			var owner = $(this).parent().parent().next();
			
			$.ajax({
				url: url,
				data:params,
				success:function(result){
					owner.text(result.trim());		// $(owner).text(result.trim());			
				}, error:function(e){
					console.log(e.responseText);
				}
			});
		});
	});
</script>
</head>
<body>
<div class="container">
<%@ include file="../inc/top.jspf" %>
	<h1>자료실목록</h1>
	<div id="content">
		<ul>
			<li>번호</li>
			<li>제목</li>
			<li>작성자</li>
			<li>첨부파일</li>
			<li>다운로드 횟수</li>
			<li>등록일</li>
			<c:forEach var="vo" items="${list }">
				<li>${vo.no }</li>
				<li><a href="<%=request.getContextPath()%>/data/dataView.do?no=${vo.no}">${vo.title }</a></li>
				<li>${vo.userid }</li>
				<li>
					<!-- 첨부파일-->
					<c:forEach var="f" items="${vo.filename }">
						<c:if test="${f!=null }">
						<a href="<%=request.getContextPath() %>/upload/${f}" download><img src="<%=request.getContextPath() %>/img/disk.png" title="${f}" alt="${vo.no }"/></a>					
						</c:if>
					</c:forEach>
					<a href=""><img src=""/></a>
				</li>  
				<li>${vo.downcount }</li>
				<li>${vo.writedate }</li>		
			</c:forEach> 
		</ul>	
	</div>
	<c:if test="${logStatus!=null && logStatus=='Y'}">
		<div><a href="<%=request.getContextPath()%>/data/dataWriteForm.do">자료 올리기</a></div>
	</c:if>
</div>

</body>
</html>
<!-- 
	파일 업로드를 가능하게 하는 프레임워크
	
	servlets.com에서 
	왼족 메뉴에 COS File Upload Library 클릭
	cos-20.08.zip 다운로드하여 압축을 푼 후
	cos.jar를 /WEB-INF/lib에 복사한다. 

 -->