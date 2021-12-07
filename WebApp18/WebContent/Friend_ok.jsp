<%@ page contentType="text/html; charset=UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>		
<%-- 
<%
	/* 
	String genderStr = request.getParameter("gender");
	String[] idelTypeArr = request.getParameterValues("idelType");
	
	String gender ="";
	if(genderStr.equals("남자"))
		gender = "남자";
	else if(genderStr.equals("여자"))
		gender = "여자";
	else
		gender = "확인불가";
	
	String idelType="";
	if(idelTypeArr != null)
	{
		for(String item : idelTypeArr)
			idelType += "[" + item + "]";
	}
	*/
%>	
--%>
<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob"/>

<!-- 반복문 필요(다중 선택으로 넘어온 결과값을 출력하기 위한 처리)  -->
<%
	String str="";
	if(ob.getIdelType() != null)	// ob.getIdelType() check~!!!
	{
		for(String temp : ob.getIdelType() )
			str += temp + " ";
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>등록 수신결과 확인</h1>
	<hr />
</div>


<div>
	<!-- 결과 -->
	<h1>출력 결과</h1>
	<h2>이름 : <%=ob.getName() %></h2>
	<h2>나이 : <%=ob.getAge() %></h2>
	<h2>성별 : <%=ob.getGender() %></h2>
	<h2>이상형 : <%=str %></h2>
	
</div>

</body>
</html>