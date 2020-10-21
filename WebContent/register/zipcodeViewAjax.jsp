<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="vo" items="${zipList }">
	<li>${vo.zipcode } ${vo.sido } ${vo.sigungu } ${vo.um } ${vo.doro } ${vo.b_num1 }-${vo.b_num2 }(${vo.dong}, ${vo.building })</li>

</c:forEach>