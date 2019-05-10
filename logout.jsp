<%@ page import="java.sql.*" %>

<%

	session.removeAttribute("username");
	session.removeAttribute("role");
	session.removeAttribute("name");
	response.sendRedirect("login.html");

%>