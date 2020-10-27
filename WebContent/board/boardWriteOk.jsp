<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${cnt>0 }">
	<script>
		alert("글 등록이 완료 되었습니다.");
		location.href="/webMVC/board/boardList.do";
	</script>
</c:if>
<c:if test="${cnt<=0 }">
	<script>
		alert("글 등록 실패하였습니다.");
		history.back();
	</script>
</c:if>