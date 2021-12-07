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
<title>MemberInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">

</head>
<body>

<div>
	<h1>JSTL Core 문제</h1>
	<h2>회원 정보 입력</h2>
	<hr>
</div>

<div>
	<form action="MemberInsert.jsp" method="post">
		<!-- 이름, 전화번호, 주소 * 5명 분 -->
		
		<c:forEach var="a" begin="1" end="5" step="1">
			<h3>${a }</h3>
			이름 : <input type="text" name="name${a }" class="txt" /><br><br>
			전화번호 : <input type="text" name="tel${a }" class="txt" /><br><br>
			주소 : <input type="text" name="addr${a }" class="txt" /><br><br>
		</c:forEach>
	
		<button type="submit" class="btn">결과 확인</button>
		<!-- submit 액션 처리 -->
	</form>
</div>

</body>
</html>