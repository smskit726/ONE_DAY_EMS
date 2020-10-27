<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>
<link href="${rootPath}/static/css/list.css?ver=1026" rel="stylesheet" />
<script>
	document.addEventListener("DOMContentLoaded", function(){
		document.querySelector("#ems-write").addEventListener("click", function(){
			document.location.href="${rootPath}/ems/write"
		});
		
		document.querySelector("table").addEventListener("click", function (event) {
		    let tag_name = event.target.tagName;
		    if(tag_name ==="TD"){
		    	
		    	let seq = event.target.closest("TR").dataset.seq;
		    	if(seq){
		    		document.location.href="${rootPath}/ems/detail/" + seq;
		    	}
		    }
		});
	})
</script>

<table id="ems-list">
	<thead>
		<tr>
			<th>NO</th>
			<th>시간</th>
			<th>TO</th>
			<th>FROM</th>
			<th>제목</th>
			<th>첨부파일</th>
		</tr>
	</thead>
	
	<tbody>
		<c:if test="${empty EMS_LIST}">
			<tr><td colspan="6">데이터가 없습니다.</td></tr>
		</c:if>
		<c:forEach items="${EMS_LIST}" var="vo" varStatus="i">
			<tr class="ems-item" data-seq="${vo.id}">
					<td>${i.count}</td>
					<td>${vo.s_date}<br/>${vo.s_time}</td>
					<td>${vo.to_email}</td>
					<td>${vo.from_email}</td>
					<td>${vo.s_subject}</td>
					<td> <c:if test="${not empty vo.s_file1}">
							<img src="${rootPath}/upload/${vo.s_file1}" width="50px;">
						</c:if>
						<c:if test="${not empty vo.s_file2}">
							<img src="${rootPath}/upload/${vo.s_file2}" width="50px;">
						</c:if>
					</td>
			</tr>
		</c:forEach>
	</tbody>	
</table>

<div class="btn-box">
	<button id="ems-write" type="button">새로작성</button>
</div>