<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 페이지(List.jsp → 목록 페이지)로부터 데이터(num, pageNum) 수신
	String pageNum = request.getParameter("pageNum");			//-- 페이지 번호
	String strNum = request.getParameter("num");				//-- 게시물 번호
	int num = Integer.parseInt(strNum);
	
	// 해당 게시물의 조회수 증가
	dao.updateHitCount(num);
	
	// 이전, 다음 게시물 번호 확인
	// 이전 게시물이 존재하지 않을 경우 -1 반환
	int beforeNum = dao.getBeforeNum(num);				//  -1  22
	int nextNum = dao.getNextNum(num);					//      22  -1
	
	BoardDTO dtoBefore = null;
	BoardDTO dtoNext = null;
	
	if(beforeNum != -1)
		dtoBefore = dao.getReadData(beforeNum);
	
	if(nextNum != -1)
		dtoNext = dao.getReadData(nextNum);
	
	
	// 해당 게시물의 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// check~!!! 아래 두가지 방지하는 코드
	// 1. 게시물보려고 클릭할때 게시글을 지웠을 때   
	// 2. 링크에 http://localhost:8090/WebApp20/Article.jsp?pageNum=1&num=592 했을 때 에러 떨어지는 것 방지
	if(dto==null)
		response.sendRedirect("List.jsp");
	
	// 게시물 본문 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물 내용
	dto.setContent(dto.getContent().replaceAll("\n","<br>"));
	// 안녕하세요\n반갑습니다\n맛접하세요\n
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/style.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/article.css">
</head>
<body>

<div id="bbs">
<%-- 
<%= pageNum%>
<%= num%>  
--%>
<%=beforeNum %>
<%=nextNum  %>
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<div id="bbsArticle">
	
		<div id="bbsArticle_header">
			<!-- 게시물의 제목입니다. -->
			<%=dto.getSubject() %>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<di>
				<dt>작성자</dt>
				<!-- <dd>정미화</dd> -->
				<dd><%=dto.getName() %></dd>
				
				<dt>라인수</dt>
				<!-- <dd>1</dd> -->
				<dd><%=lineSu %></dd>
			</di>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<dl>
				<dt>등록일</dt>
				<!-- <dd>2021-11-05</dd> -->
				<dd><%=dto.getCreated() %></dd>
				
				<dt>조회수</dt>
				<!-- <dd>251</dd> -->
				<dd><%=dto.getHitCount() %></dd>
			</dl>
		</div>
		
		<div id="bbsArticle_content">
			<table style="width: 600">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150">
						<!-- 어쩌구 저쩌구 이러쿵 저러쿵 내용입니다. -->
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div>
		
		<div class="bbsArticle_bottomLine">
			<!-- 이전글 : (104) 취미 분야 게시물 -->
			<%
			if (beforeNum != -1)
			{
			%>
			<!-- <a>이전 글 : (104) 취미분야 게시물</a> -->
			<a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=beforeNum%>">
			이전 글 : (<%=beforeNum %>) <%=dtoBefore.getSubject() %></a>
			<%
			}
			else
			{
			%>
			이전 글 : 없음
			<%
			}
			%>
		</div>
		
		<div class="bbsArticle_noLine">
			<!-- 다음글 : (106) 학습 분야 게시물 -->
			<%
			if (nextNum != -1)
			{
			%>
			 <!-- <a>다음 글 : Test </a> -->
			 <a href="<%=cp%>/Article.jsp?pageNum=<%=pageNum%>&num=<%=nextNum%>">
			 다음 글 : (<%=nextNum %>) <%=dtoNext.getSubject() %></a>
			<%
			}
			else
			{
			%>
			다음 글 : 없음
			<%
			}
			%>
		</div>
		
	</div><!-- close #bbsArticle -->
	
	
	<div class="bbsArticle_noLine" style="text-align: right;">
		<!-- From : 211.238.142.150 -->
		From : <%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2"
			onclick="javasctipt:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=1'"/>
			<input type="button" value="삭제" class="btn2"
			onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>&status=2'"/>
		</div>
		
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2"
			onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%>'"/>
			<!-- 리스트로 돌아오고 내가 읽었던 게시물 표시해주려면 pageNum 뿐만 아니라 num 도 받아와서 구분표시 처리 코드해주면됨! -->
		</div>
		
	</div><!-- close #bbsArticle_footer -->
	
			
</div><!-- close #bbs -->

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

</body>
</html>




















