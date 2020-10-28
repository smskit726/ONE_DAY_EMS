<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>EMS-VIEW</title>
</head>
<body>
	<div>
		<p>보낸사람 : ${EMS.from_email}</p>
		<p>받는사람 : ${EMS.to_email}</p>
		<p>보낸날짜 : ${EMS.s_date}</p>
		<p>보낸시각 : ${EMS.s_time}</p>
		<p>제목 : ${EMS.s_subject}</p>
		<p>내용 : ${EMS.s_content}</p>
		<a href="${rootPath}/" style="text-decoration: none;">처음으로</a>
	</div>
</body>
</html>