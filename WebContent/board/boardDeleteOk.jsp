<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${pVO.searchWord!=null }">
	<c:set var="url">&searchKey=${pVO.searchKey}&searchWord=${pVO.searchWord }</c:set>
</c:if>
<c:if test="${result>0 }">
	<script>
		alert("글이 삭제되었습니다. 글목록으로 이동합니다.");
		location.href="/webMVC/board/boardList.do?nowPage=${pVO.nowPage}${url}"
	</script>
</c:if>
<c:if test="${result<=0}">
	<script>
		alert("글 삭제 실패했습니다.");
		history.back();
	</script>
</c:if>
