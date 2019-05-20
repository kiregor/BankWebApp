<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String user = request.getParameter("user");
try{
	String query = "update users set active=1 where accno='" + user + "'";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/admin.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "unblock");
}
finally{
	con.close();
}
%>