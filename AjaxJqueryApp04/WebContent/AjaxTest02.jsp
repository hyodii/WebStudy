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
<title>AjaxTest02.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
      $("#sendBtn").click(function()
      {
         //alert("확인");
         var params = "name=" + $.trim($("#name").val()) 
                   + "&content=" + $.trim($("#content").val());
         
         $.ajax(
         {
            type : "POST"
            , url : "AjaxTest02_ok.jsp"
            , data : params 
            //, async : false        // -- 동기방식 (true 비동기)
            , dataType : "xml"     // --check~!!! default는 text
            , success : function(args)
            {
               var out = "";
               out = ">> 게시물 갯수 : " + $(args).find("total_dataCount").text() + "<br>";
               
               $(args).find("comment").each(function()
               {
                  var item = $(this); //<comment>
                  var num = item.attr("num"); //-- 1  -- <comment num="1"> 
                  var name = item.find("name").text(); //<name>홍길동</name>
                  var content = item.find("content").text(); //<content>안녕하세요</content>
                  
                  out += "<br>===========================";
                  out += "<br> 번호 : " + num;
                  out += "<br> 이름 : " + name;
                  out += "<br> 내용 : " + content;
                  out += "<br>===========================<br>";
               });
               
               $("#resultDiv").html(out);
               
               $("#name").val("");
               $("#content").val("");
               $("#name").focus;
               
               
               
            }
            , beforeSend : showRequest
            , error : function(e)
            {
               alert(e.reponseText);
            }
         });
         
      });
   })
    //유효성 검사 처럼 사용 
   function showRequest() // 일반적으로 조건에 맞으면 true를 반환하는 식으로 사용 
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
   <p> xml control </p>
   <hr>
</div>

<div>
   이름 : <input type="text" id="name" class="txt"><br><br>
   내용
   <textarea rows="3" cols="50" id="content"></textarea>
   <br><br>
   
   <input type="button" value="등록하기" id="sendBtn">
</div>

<br><br>
<div id="resultDiv">
</div>

</body>
</html>