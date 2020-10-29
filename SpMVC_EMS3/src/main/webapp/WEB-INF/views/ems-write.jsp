<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var = "rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<title>EMS-WRITE</title>
<style>
	* {
		box-sizing: border-box;
		margin: 0;
		padding: 0;
	}

	form{
		display: flex;
		width: 80%;
		margin: 30px auto;
		flex-flow: column;
	}
	
	div {
		display:flex;
		width: 50%;
		margin: 5px auto;
	}
	
	label {
		width: 30%;
		margin: 0 3px;
		text-align: center;
	}
	
	input {
		display: inline-block;
		width: 60%;
	}
}
</style>
</head>
<body>
	<form method="POST" enctype="multipart/form-data">
		<div>
			<label>보내는사람</label>
			<input name="from_email" value="${EMS.from_email}">
		</div>
		
		<div>
			<label>받는사람</label>
			<input name="to_email" value="${EMS.to_email}">
		</div>
		
		<div>
			<label>보낸 날짜</label>
			<input name="s_date" value="${EMS.s_date}" readonly="readonly">
		</div>
		
		<div>
			<label>보낸 시간</label>
			<input name="s_time" value="${EMS.s_time}" readonly="readonly">
		</div>
		
		<div>
			<label>제목</label>
			<input name="s_subject" value="${EMS.s_subject}">
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="s_content" cols="62" rows="5">${EMS.s_content}</textarea>
		</div>
		
		<div>
			<label>첨부파일1</label>
			<input name="file1" type="file" style="margin: 3px auto;"/>
		</div>
		
		<div>
			<img src="${rootPath}/files/${EMS.s_file1}" width="100px">
		</div>
		
		<div>
			<label>첨부파일2</label>
			<input name="file2" type="file" style="margin: 3px auto;"/>
		</div>
		
		<div>
			<img src="${rootPath}/files/${EMS.s_file2}" width="100px">
		</div>			
		<div style="justify-content: right;">
			<button>저장</button>
		</div>
	</form>
</body>
</html>