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
<title>AjaxTest01.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#sendBtn").click(function()
		{
			// data 구성
			var params = "name=" + $.trim($("#name").val()) 
				+ "&content=" + $.trim($("#content").val());
			// javascript 에는 trim 이 없지만 jQuery 에는 있다. 
			//(공백 제거 / 입력하는거 통일하기 위해서!! / 칸에 space 쳐서 공백제거하면 전부 null이 되니까 null 값 검사하려고!!)
			
			// jQuery 의 ajax() 함수 사용(호출)
			// post, get 메소드의 경우 메소드를 선택하는 순간 전달 방식도 정해지지만
			// ajax() 함수의 경우 type 을 지정해줄 수 있다.
			// 내부 속성들의 순서는 뒤바뀌어도 상관 없다.
			// success : function → 콜백 함수
			// beforeSend : 유효성 검사 필요없으면  `beforeSend : true` 와 같이 구성해주면 됨
			$.ajax(
			{
				type : "POST"
				, url : "AjaxTest01_ok.jsp"
				, data : params					// AjaxTest01_ok.jsp 에서 수신하게 되는 데이터
				, success : function(args)	// 정상적으로 처리되었을 때 수행할 부분
				{
					$("#resultDiv").html(args);
					
					$("#name").val("");
					$("#content").val("");
					$("#name").focus();
				}
				, beforeSend : showRequest	// 유효성 검사 true / false 값을 받을 수 있게 구성
				, error : function(e)
				{
					alert(e.responseText);
				}
			});
 			
		});
	});
	
	
	function showRequest()
	{
		if(!$.trim($("#name").val()))
		{
			alert("이름을 입력해야 합니다.");
			$("#name").focus();
			
			return false;
		}
		
		if(!$.trim($("#content").val()))
		{
			alert("내용을 입력해야 합니다.");
			$("#content").focus();
			
			return false;
		}
		
		return true;
	}
	
	
	
</script>
</head>
<body>

<div>
	<h1>jQuery의 ajax() 활용 실습</h1>
	<hr />
</div>

<div>
	이름 : <input type="text" id="name" class="txt"><br><br>
	내용
	<textarea rows="3" cols="50" id="content"></textarea>
	<br><br>
	
	<input type="button" value="등록하기" id="sendBtn"/>
</div>
<br><br>

<div id="resultDiv">

</div>

</body>
</html>