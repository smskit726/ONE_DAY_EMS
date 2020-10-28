<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>EMS</title>
<style>
	
	*{
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}
	
	html,body {
		width: 100%;
		height: 100%;
	}
	
	h3 {
		text-align: center;
	}
	
	table#ems-list {
		width: 80%;
		margin: 10px auto;
		border-collapse: collapse;
		border: 1px solid #ccc;
	}
	
	td, th {
		border: 1px solid #ccc;
		text-align: center;
	}
</style>
</head>
<body>
<h3>EMS 2020</h3>
<table id="ems-list">
	<tr>
		<th>발송 메일</th>
		<th>수신 메일</th>
		<th>발송 일자</th>
		<th>발송 시각</th>
		<th>제목</th>
		<th>삭제</th>
		
		<c:if test="${empty EMS_LIST}">
			<tr><td colspan="6">데이터가 없습니다.</td></tr>
		</c:if>
		
		<c:forEach items="${EMS_LIST}" var="vo">
			<tr>
				<td>${vo.from_email}</td>
				<td>${vo.to_email}</td>
				<td>${vo.s_date}</td>
				<td>${vo.s_time}</td>
				<td>
					<a href="${rootPath}/update?id=${vo.id}">
					${vo.s_subject}
					</a>
				</td>
				<td>
					<a href="${rootPath}/delete?id=${vo.id}">삭제</a>
				</td>
			</tr>
		</c:forEach>
</table>

<div style="text-align:right; width: 80%; margin: 10px auto;">
	<a href="${rootPath}/write" style="text-decoration: none;">메일작성</a>
</div>
</body>
</html>