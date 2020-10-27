<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<link href="${rootPath}/static/css/detail.css?ver=1027" rel="stylesheet" />

<script>
	$(function() {
		$("#list").click(function() {
			document.location.href = "${rootPaht}/ems/list"
		})

		$("button").click(function(e) {
			let url = "${rootPath}/ems/${EMSVO.id}/"
			if (e.target.id === 'delete') {
				if (confirm("삭제하시겠습니까?")) {
					document.location.href = url + e.target.id;
				}
				return false;
			}
			document.location.href = url + e.target.id;
		})
	})
</script>

<section id="detail-header">
	<article>
		<div class="title">날짜</div>
		<div class="content">${EMSVO.s_date}</div>
		<div class="title">시간</div>
		<div class="content">${EMSVO.s_time}</div>
		<div class="title">받는사람</div>
		<div class="content">${EMSVO.to_email}</div>
		<div class="title">보낸사람</div>
		<div class="content">${EMSVO.from_email}</div>
	</article>
</section>

<section id="detail-body">
	<div class="title">${EMSVO.s_subject}</div>
	<div class="content">${EMSVO.s_content}</div>
</section>
<section id="attach-images">
	<c:if test="${not empty EMSVO.s_file1}">
		<img src="${rootPath}/upload/${EMSVO.s_file1}" height="100px" />
	</c:if>

	<c:if test="${not empty EMSVO.s_file2}">
		<img src="${rootPath}/upload/${EMSVO.s_file2}" height="100px" />
	</c:if>
</section>

<section id="btn-box">
	<button id="list">리스트</button>
	<button id="update">수정</button>
	<button id="delete">삭제</button>
</section>
