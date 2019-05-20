<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String depValue = request.getParameter("deposit");
try{
	String query = "insert into transaction values('" + (String)session.getAttribute("username") + "', '" + Integer.parseInt(depValue) + "', current_timestamp, 'D')";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/account.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString());
}
finally{
	con.close();
}

%>