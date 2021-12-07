<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// 한글데이터 넘어오니까
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="ob" class="com.test.GuestDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>간단한 기본 방명록 작성 실습</h1>
	<hr />
</div>

<div>
	<!-- 결과 -->
	<h1>출력 결과</h1>
	<h2>이름 : <%=ob.getName() %></h2>
	<h2>제목 : <%=ob.getTitle() %></h2>
	<!-- 				---------------이만큼이 String 이니까 String. 하면 String 클래스에 있는거 쓸 수 있음!	 -->
	<% String content = ob.getContent().replaceAll("\n", "<br>"); %>
	<h2>내용 : <%=content %></h2>
	
</div>

</body>
</html>