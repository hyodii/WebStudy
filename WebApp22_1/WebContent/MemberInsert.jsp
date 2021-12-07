<%@page import="org.apache.catalina.tribes.MembershipListener"%>
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
	// MemberInsert.jsp
	
	// 5명분 데이터 수신 → 객체 구성 → 자료구조 구성 → setAttribute()
	//						MemberDTO
	List<MemberDTO> lists = new ArrayList<MemberDTO>();

 	for(int i=1; i<=5; i++)
 	{
 		MemberDTO ob = new MemberDTO(request.getParameter("name"+i)
 									, request.getParameter("tel"+i)
 									, request.getParameter("addr"+i));
 		
 		lists.add(ob);
 	}
 	
 	request.setAttribute("lists", lists);
	
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>

