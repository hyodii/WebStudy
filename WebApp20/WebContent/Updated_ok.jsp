<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<jsp:useBean id="dto" class="com.test.BoardDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	// Updated_ok.jsp
	
	// 추가
	String pageNum = request.getParameter("pageNum");
	
	// 데이터베이스 연결해서 DAO conn 받게
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	
	// 수정한것 담기 updateDate → num 넘어오는 것 없음! → 그래서 update.jsp 에서 hidden으로 받기
	int result = dao.updateData(dto);
	
	// result 값에 따른 분기 처리 가능
	
	
	// 데이터 베이스 연결 종료
	DBConn.close();
	
	// 안내
	
	//response.sendRedirect(cp + "List.jsp?num" + dto.getNum() + "&pageNum=" + ???????);
	// 이거 하려면 이전페이지에서 값 넘겨받아야하니까 → updated.jsp에서 pageNum 받아와야하는데 그러려면 → Article.jsp 에서 pageNum 받아와야함
	response.sendRedirect(cp + "/List.jsp?num=" + dto.getNum() + "&pageNum=" + pageNum);

	
%>