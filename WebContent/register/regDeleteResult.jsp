<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${result==0}">
	<script>
		alert("회원탈퇴실패 하였습니다.");
		history.back();
	</script>
</c:if>
<c:if test="${result>0 }">
<script>
	alert("회원탈퇴 완료했습니다. 홈페이지로 이동합니다.");
	location.href="<%=request.getContextPath()%>/index.do"
</script>
</c:if>