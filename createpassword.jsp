<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String accno = request.getParameter("accno");
String password = request.getParameter("pass1");
try{
	String query = "insert into users values('" + accno + "', '" + password + "', 1, 1)";
	st.executeUpdate(query);
	response.sendRedirect("login.html");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString());
}
finally{
	con.close();
}
%>