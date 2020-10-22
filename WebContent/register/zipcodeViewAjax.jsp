<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="vo" items="${zipList }">
	<li><span class="zip">${vo.zipcode }</span> <span class="addr">${vo.sido }<c:if test=" ${vo.sigungu!=null }"> ${vo.sigungu }</c:if> <c:if test="${vo.um!=null }"> ${vo.um }</c:if> ${vo.doro } ${vo.b_num1 }<c:if test="${vo.b_num2!=0 }">-${vo.b_num2 }</c:if><c:if test="${vo.dong!=null && vo.building!=null}">(${vo.dong}, ${vo.building })</c:if><c:if test="${vo.dong!=null && vo.building==null}">(${vo.dong})</c:if><c:if test="${vo.dong==null && vo.building!=null}">(${vo.building})</c:if><c:if test="${vo.dong==null && vo.building==null}"></c:if></span></li>

</c:forEach>