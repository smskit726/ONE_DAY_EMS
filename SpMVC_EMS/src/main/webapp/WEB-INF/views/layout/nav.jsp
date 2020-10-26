<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>

<script>
	document.addEventListener("DOMContentLoaded", function(){
		document.querySelector("#nav-ems").addEventListener("click", function(){
			document.location.href = "${rootPath}/ems/list"
		})
		
		document.querySelector("#nav-home").addEventListener("click",function(){
			document.location.href = "${rootPath}/"
		})
	})
</script>
<nav>
	<ul>
		<li id="nav-home">Home</li>
		<li id="nav-ems">메일관리</li>
	</ul>
</nav>