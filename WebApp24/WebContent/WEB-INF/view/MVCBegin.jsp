<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCBegin.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>

<div>
	<h1>MVC 실습</h1>
	<hr>
</div>

<div>
	<!-- 이 페이지는 클라이언트에게 보이면 안대니까 WEB-INF/view/MVCBegin.jsp여기에 !! -->
	
	<!-- 컨트롤러로부터 수신한 내용 -->
	<h2>${message }</h2>
</div>

</body>
</html>