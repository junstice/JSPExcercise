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

// 1. ���ڵ� ����
request.setCharacterEncoding("UTF-8");

// 2. ���ε� ��� ����
String saveDirectory = application.getRealPath("/Upload");
// String saveDirectory = request.getSession().getServletContext().getRealPath("/");

// 3. ���ε� ������ ����
int maxPostSize = 1024 * 500; // 500kb

// 4. ���ڵ� ����
String encoding = "UTF-8";

// 5. ���ϸ� �ߺ� ó�� ��� ����
DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();

// 6. ��ü ����
MultipartRequest mr = null;

String name = null;
String title = null;
StringBuffer buffer = new StringBuffer();

try {
	// ���ε� ���� ����
	mr = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
	
	Enumeration filenames = mr.getFileNames();
	while (filenames.hasMoreElements()) {
		
		/****************************************************************** ��ó�� �� ���ӻ� */
		// ���ϸ�
		String fileName = (String) filenames.nextElement();
		
		// ���� Ÿ��
		/* Returns the content type of the specified file (as supplied by the client browser),
		 * or null if the file was not included in the upload.
		 */
		String fileType = mr.getContentType(fileName);
		
		// ���� ��ü
		File f = mr.getFile(fileName);
	}

	
	
} catch (IOException e) {
	e.printStackTrace();
}

%>
<!-- ���� �������� ���� ���� -->
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