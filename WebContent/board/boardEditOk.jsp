<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${pVO.searchWord!=null }">
	<c:set var="url">&searchKey=${pVO.searchKey }&searchWord=${pVO.searchWord }</c:set>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("글 수정이 실패하였습니다. 수정페이지로 다시 이동합니다.");
		history.back();
	</script>
</c:if>
<c:if test="${cnt>0 }">
	<script>
		location.href="<%=request.getContextPath()%>/board/boardView.do?no=${no}&nowPage=${pVO.nowPage}${url}";
	</script>
</c:if>