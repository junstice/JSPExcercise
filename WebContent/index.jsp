<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>JSP 샘플 코드</h2>
<div class="file">
	<p>1. 파일 업로드와 다운로드</p>
	
	<!-- 파일 업로드를 위해서는 method="post" enctype="Multipart/form-data">가 필수  -->
	<form action="JSP/FileUpload.jsp" method="post" enctype="Multipart/form-data">
		
		<!-- name이 지정되어야만 함 -->
		<input type="file" name="fileUp">
		<br>
		<input type="submit" id="exeUpload" value="업로드 실행" />
	</form>
</div>

</body>
</html>