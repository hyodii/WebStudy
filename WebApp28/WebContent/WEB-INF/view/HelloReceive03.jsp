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
<title>HelloReceive03.jsp</title>
</head>
<body>

<div>
	<!-- 컨트롤러부터 수신한 내용 -->
	<h2> first Name : ${firstName }</h2>
	<h2> last Name : ${lastName }</h2>
</div>

</body>
</html>