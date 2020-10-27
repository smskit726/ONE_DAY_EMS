<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form"  prefix="form"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>

<link href="${rootPath}/static/css/write.css?ver=1026" rel="stylesheet" />

<script>
	$(function(){
		var toolbar = [
			['style',['bold','italic','underline'] ],
			['fontsize',['fontsize']],
			['font Style',['fontname']],
			['color',['color']],
			['para',['ul','ol','paragraph']],
			['height',['height']],
			['table',['table']],
			['insert',['link','hr','picture']],
			['view',['fullscreen','codeview']]
			
		]
		
		$("#s_content").summernote({
				lang:"ko-KR",
				width:"80%",
				height:"200px",
				toolbar : toolbar
				})
	})
</script>

<form:form id="write-form" modelAttribute="EMSVO" enctype="multipart/form-data">
	<fieldset>
		<legend>메일작성</legend>
			<div>
				<form:input path="id" type="hidden"/>
			</div>
			<div>
				<label for="s_date">날짜</label>
				<form:input path="s_date" readonly="true" style="outline:none;"/>
			</div>
			
			<div>
				<label for="s_time">시간</label>
				<form:input path="s_time" readonly="true" style="outline:none;"/>
			</div>

			<div>
				<label for="to_email">TO</label>
				<form:input path="to_email"/>
			</div>
						
			<div>
				<label for="from_email">FROM</label>
				<form:input path="from_email"/>
			</div>
			
			<div>
				<label for="s_subject">제목</label>
				<form:input path="s_subject"/>
			</div>
			
			<div style="display:flex; justify-content: center; padding: 5px;">
				<form:textarea id="s_content" rows="5" cols="20" path="s_content"/>
			</div>
			
			<div style="margin-top: 10px;">
				<label for="file1">첨부파일1</label>
				<input name="file1" type="file" accept="image/*"/>
				<label for="file2">첨부파일2</label>
				<input name="file2" type="file" accept="image/*"/>
			</div>
			
			<div class="btn-box">
				<button type="button" id="list">리스트</button>
				<button type="submit" id="save">전송</button>
			</div>
	</fieldset>
</form:form>
