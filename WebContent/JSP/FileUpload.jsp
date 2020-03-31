<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import="java.io.*" %>
<%@ page import="com.oreilly.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

// 1. 인코딩 정의
request.setCharacterEncoding("UTF-8");

// 2. 업로드 경로 설정
String saveDirectory = application.getRealPath("/Upload");
// String saveDirectory = request.getSession().getServletContext().getRealPath("/");

// 3. 업로드 사이즈 설정
int maxPostSize = 1024 * 500; // 500kb

// 4. 인코딩 지정
String encoding = "UTF-8";

// 5. 파일명 중복 처리 방식 정의
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

// 6. 객체 생성
MultipartRequest mr = null;

String name = null;
String title = null;
StringBuffer buffer = new StringBuffer();

try {
	// 업로드 파일 생성
	mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	Enumeration filenames = mr.getFileNames();
	while (filenames.hasMoreElements()) {
		
		/****************************************************************** 후처리 및 쓰임새 */
		// 파일명
		String fileName = (String) filenames.nextElement();
		
		// 파일 타입
		/* Returns the content type of the specified file (as supplied by the client browser),
		 * or null if the file was not included in the upload.
		 */
		String fileType = mr.getContentType(fileName);
		
		// 파일 객체
		File f = mr.getFile(fileName);
	}

	
	
} catch (IOException e) {
	e.printStackTrace();
}

%>
<!-- 다음 페이지로 정보 전달 -->
<!-- 
<form action="JSP/FileCheck.jsp" method="post" name="fileCheck">
	<input type="hidden" value="<%=name%>" name="name">
	<input type="hidden" value="<%=name%>" name="name">
	<input type="hidden" value="<%=name%>" name="name">
	<input type="hidden" value="<%=name%>" name="name">
</form>
 -->
</body>
</html>