<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>rive your dream</title>

</head>
<body>

<% 
	
	session.invalidate();
	//현재 이 페이지에 접속한 회원이 세션을 빼앗도록 함

%>

	<script>
	
	location.href='main.jsp';
	 
	</script>

	
</body>
</html>