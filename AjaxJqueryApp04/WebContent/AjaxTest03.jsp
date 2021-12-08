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
<title>AjaxTest03.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   
   $(function()
   {
      $("#sendBtn").click(function()
      {
         //alert("확인");
         var params = "title=" + $.trim($("#title").val()) 
             + "&content=" + $.trim($("#content").val());
         
         $.ajax(
         {
            /* 본인 스스로 해결한 내용*/
            /* 
            type : "POST"
            , url : "AjaxTest03_ok.jsp"
            , data : params
            , dataType : "xml"
            , success : function(args)
            {
               var out ="";
               
               $(args).find("records").each(function()
               {
                  var item = $(this);
                  var id = item.attr("id");
                  var title = item.find("title").text();
                  var content = item.find("content").text();
                  
                  out += "<br> >> id = " + id; 
                  out += "<br> - title : " + title;
                  out += "<br> - content : " + content + "<br>";
               });
               
               $("#resultDiv").html(out);
               
               $("#title").val("");
               $("#content").val("");
               $("#title").focus;
               
            }
            , beforeSend : showRequest
            , error : function(e)
            {
               alert(e.reponseText);
            }
             */
             
             /* 선생님 풀이*/
             type : "POST"
            , url : "AjaxTest03_ok.jsp"
            , data : params
            , dataType : "xml"
            , success : function(xml)
            {
               
               $(xml).find("status").each(function()
               {
                  var status = $(this).text();
                  //alert(status);       //--확인
               });
               
               var str = "";
               
               $(xml).find("records").each(function()
               {
                  var records = $(this);
                  var id = records.attr("id");
                  var title = $(this).find("title").text();
                  var content = $(this).find("content").text();
                  
                  str += "<br> >> id = " + id + "<br> - title : " + title
                  + "<br> - content : " + content + "<br><br>";
               });
               
               $("#resultDiv").html(str);
               
            }
            , beforeSend : showRequest
            , error : function(e)
            {
               alert(e.reponseText);
            }
         });
         
      });
   });
   
    //유효성 검사 처럼 사용 
   function showRequest() // 일반적으로 조건에 맞으면 true를 반환하는 식으로 사용 
   {
       var flag = true;
       
      if(!$.trim($("#title").val()))
      {
         alert("이름을 입력해야 합니다.");
         $("#title").focus();
         flag = false;
         
      }
      
      if(!$.trim($("#content").val()))
      {
         alert("내용을 입력해야 합니다.");
         $("#content").focus();
         flag = false;
      }
      
      return flag;
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
   이름 : <input type="text" id="title" class="txt"><br>
   내용 : <input type="text" id="content" class="txt"><br>
   <br><br>
   
   <input type="button" value="등록하기" id="sendBtn">
</div>
<br><br>

<div id="resultDiv">
<!-- 
>> id=1
- title= aaa
- content= bbb

>> id=2
- title= aaa
- content= bbb
 -->
</div>

</body>
</html>