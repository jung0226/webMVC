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

</head>
<body>
<h1>글내용보기</h1>
<ul>
	<li>번호</li>
	<li>${vo.no }</li>
	<li>작성자</li>
	<li>${vo.userid }</li>
	<li>조회수</li>
	<li>${vo.hit }</li>
	<li>등록일</li>
	<li>${vo.writedate }</li>
	<li>제목</li>
	<li>${vo.subject }</li>
	<li>글내용</li>
	<li>${vo.content }</li>
</ul>
<a href="/webMVC/index.do">홈</a>
<a href="/webMVC/board/boardList.do?nowPage=${pVO.nowPage }<c:if test="${pVO.searchWord!=null }">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:if>">목록</a>
<c:if test="${logStatus!=null && logStatus=='Y' && vo.userid == logId}">
	<a href="">수정</a>
	<a href="">삭제</a>
</c:if>
</body>
</html>