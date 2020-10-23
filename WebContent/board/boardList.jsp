<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판목록(MVC)</title> 
<!-- Bootstrap CSS -->
<meta name="viewport" content="width=device, initial-scale=1"/>
<link rel="stylesheet" href="/webMVC/library/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/webMVC/library/bootstrap.js"></script>

<style>
	ul, li{
		margin:0;
		padding:0;
		list-style-type:none;
	}
	#lst>li{
		float:left;
		line-height:35px;
		height:35px; 
		border-bottom:1px solid gray;
		width:10%;
	}
	#lst>li:nth-of-type(5n+2){
		width:60%;
	}
	/* wordCut */
	.wordCut{
		white-space:nowrap;/*줄바꿈 안 함*/		
		overflow:hidden;/*넘침 숨기기*/
		text-overflow:ellipsis;/*넘친 부분을 ...으로 표시*/		
	}
	/*페이지 매기기*/
	#paging ul{
		height:40px;
		overFlow:auto;
		width:100%;
	}
	#paging li{
		float:left;
		width:60px;
		height:40px;
		text-align:center;
		font-size:1.3em;
	}
</style>
</head>
<body>
	<div class="container">
		<h1>게시판</h1>
		<div>총 레코드 수 : ${pageVO.totalRecord}개</div>
		<div>pages : 55/99</div>
		<ul id="lst">
			<li>번호</li>
			<li>제목</li>
			<li>글쓴이</li>
			<li>등록일</li>
			<li>조회수</li>
				<li>22</li>
				<li class="wordCut"><a href="/webJSP/freeboard/boardView.jsp?no=22&nowPage=22">afd</a></li>
				<li>asdf</li>
				<li>2200.10.22</li>
				<li>4</li>
		</ul>
		<div id="paging">
			<ul>
				<!-- 이전 페이지 -->
				<li>
					Prev
				</li>
				<!-- 페이지 넘버 매기기 -->
				<li>1</li>
				<li>2</li>
				<li>
					Next
				</li>
			</ul>
		</div>
		<!-- 검색기능 -->
		<div>
			<form method="get" action="/webMVC/board/boardList.do">
				<select name="searchKey" id="searchKey">
							  <!-- DB의 필드명 -->
					<option value="subject">제목</option>
					<option value="content">글내용</option>
					<option value="userid">작성자</option>
				</select>
				<input type="text" name="searchWord" id="searchWord"/>
				<input type="submit" value="Search"/>
			</form>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/index.do">홈</a>
			<a href="<%=request.getContextPath() %>/board/boardwrite.do">글쓰기</a>
		</div>
	</div>
</body>
</html>