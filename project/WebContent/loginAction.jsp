<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO"%>
<%@ page import="java.io.PrintWriter"%>
<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="user" class="user.User" scope="page"/>
<!-- 유저빈을 사용하는데, 현재 페이지에서만 사용이 되도록 설정 -->

<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

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

	UserDAO userDAO = new UserDAO();

	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	//UserDAO에 있는 로그인 처리에 대한 함수의 값이 여기에 담기게 됨(로그인 함수에 넣어서 실행)
	
		if(result == 1){
	   
	 	  session.setAttribute("userID", user.getUserID());
	 	  //해당 아이디를 세션값으로 줄 수 있도록 함
	   
	 	  PrintWriter script = response.getWriter();
	 	  script.println("<script>");
	 	  //스크립트 문장을 유동적으로 실행하게 함
	 	  
	 	  script.println("location.href='main.jsp'");
	 	  //main.jsp로 이동할 수 있도록 함
	 	  //로그인에 성공했을 때 이동할 경로
	   
	      script.println("</script>");
	   
	} else if(result == 0){
	 
	   PrintWriter script = response.getWriter();
	   script.println("<script>");  
	   script.println("alert('비밀번호가 일치하지 않습니다')");
	   //값이 0인 경우는 비밀번호 오류라고 설정
	   //출력 메시지를 설정해서 비밀번호 오류인 것을 알림
	   
	   script.println("history.back()");
	   //이전 페이지로 사용자를 이동시킴(로그인 페이지로)
	   
	   script.println("</script>");
	   
	}    else if(result == -1){
	 
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('아이디가 존재하지 않습니다')");
	   //값이 -1인 경우는 아이디 오류라고 설정
	   //출력 메시지를 설정해서 아이디 오류인 것을 알림
	   
	   script.println("history.back()");
	   //이전 페이지로 사용자를 이동시킴(로그인 페이지로)
	   
	   script.println("</script>");
	   
	}    else if(result == -2){
	 
	   PrintWriter script = response.getWriter();
	   script.println("<script>");
	   script.println("alert('데이터베이스 오류')");
	   //값이 -2인 경우는 비밀번호 오류라고 설정
	   //출력 메시지를 설정해서 데이터베이스 오류인 것을 알림
	   
	   script.println("history.back()");
	   //이전 페이지로 사용자를 이동시킴
	   
	   script.println("</script>");
	}
	%>
	
</body>
</html>