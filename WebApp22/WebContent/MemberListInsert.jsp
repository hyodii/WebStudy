<%@page import="java.util.ArrayList"%>
<%@page import="com.test.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// MemberListInsert.jsp
	
	// 5명분 데이터 수신 → 객체구성 → 자료구조 구성 → setAttribute()
	//						MemberDTO
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	for(int i=1; i<6; i++)
	{
		
		String name = request.getParameter("name" + i);
		String tel = request.getParameter("tel" + i);
		String addr = request.getParameter("addr" + i);
		
		MemberDTO dto = new MemberDTO(name, tel, addr);
		lists.add(dto);
	}

	
	request.setAttribute("lists", lists);
	
	// MemberList.jsp 를  요청할 수 있도록 안내
	
	
	RequestDispatcher rd = request.getRequestDispatcher("MemberList.jsp");
	rd.forward(request, response);
	
%>

<%-- <jsp:forward page="MemberList.jsp"></jsp:forward> --%>

