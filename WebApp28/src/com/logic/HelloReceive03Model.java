package com.logic;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HelloReceive03Model
{
	public String actionCount(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException
	{
		String result="";
		
		request.setCharacterEncoding("UTF-8");
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		
		request.setAttribute("firstName", firstName);
		request.setAttribute("lastName", lastName);
		
		result = "WEB-INF/view/HelloReceive03.jsp";
		
		return result;
	}
}
