<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String witValue = request.getParameter("withdraw");
try{
	String query = "insert into transaction values('" + (String)session.getAttribute("username") + "', '" + Integer.parseInt(witValue) + "', current_timestamp, 'W')";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/account.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "withdraw");
}
finally{
	con.close();
}

%>