<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String firstName = request.getParameter("firstName");
	String lastName = request.getParameter("lastName");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HelloReceive01.jsp</title>
</head>
<body>

<div>
	<h1>최종결과 수신 페이지</h1>
	<h2>HelloReceive01.jsp</h2>
</div>


<div>
	<ul>
		<li><b>FirstName : </b><%=firstName %></li>
		<li><b>LastName : </b><%=lastName %></li>
	</ul>
</div>


</body>
</html>