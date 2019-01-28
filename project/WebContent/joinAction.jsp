<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- 유저빈을 사용하는데, 현재 페이지에서만 사용이 되도록 설정 -->

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>rive your dream</title>

</head>
<body>

<% 
	String userID=null;

	if(session.getAttribute("userID") != null){

	userID=(String) session.getAttribute("userID");
	
	} if(userID != null){
	//로그인을 한 사람이 또 하지 않도록 막아 주는 것
	  
	  PrintWriter script = response.getWriter();
	  script.println("<script>");
	  script.println("alert('이미 로그인 상태입니다')");
	  script.println("location.href='main.jsp'");
	  //이전 페이지로 사용자를 이동시킴(로그인 페이지로)
	   
	   script.println("</script>");

	}

	
	if(user.getUserID()== null || user.getUserPassword()== null || user.getUserName()== null || 
	user.getUserGender()== null || user.getUserEmail()== null){
		
		 PrintWriter script = response.getWriter();
		 script.println("<script>");  
		 script.println("alert('입력이 안 된 사항이 있습니다')");
		 //입력을 하는 공간이 null 값일 때 출력될 메시지 출력
		 
		 script.println("history.back()");
		 //하나라도 입력이 안 됐을 때에는 이전 페이지로 사용자를 이동시킴(회원가입 페이지로)
		 
		 script.println("</script>");
		
	} else{
		
		UserDAO userDAO =new UserDAO();
		
		   int result = userDAO.join(user);
		   //UserDAO에 있는 로그인 처리에 대한 함수의 값이 여기에 담기게 됨(로그인 함수에 넣어서 실행)
			
		   if(result == -1){
			   
			   PrintWriter script = response.getWriter();
			   script.println("<script>");  
			   script.println("alert('이미 존재하는 아이디입니다')");
			   //데이터베이스 오류가 나는 경우는 프라이머 키로 설정한 아이디가 존재할 때이므로 해당 메시지를 출력하도록 함
			   
			   script.println("history.back()");
			   //이전 페이지로 사용자를 이동시킴(로그인 페이지로)
			   
			   script.println("</script>");
			   
		   } else{
			   
			   session.setAttribute("userID", user.getUserID());
			   //세션을 부여한 다음 메인페이지로 이동할 수 있도록 함
			   
			   PrintWriter script = response.getWriter();
			   script.println("<script>");  
			   script.println("location.href='main.jsp'");
			   script.println("</script>");
			   
		
	}
}
		

	%>

	
</body>
</html>