<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String accno = request.getParameter("accno");
String name = request.getParameter("name");
String address = request.getParameter("address");
String role = request.getParameter("role");
String active = request.getParameter("active");
try{
	String query = "update users set active=" + active + ", role=" + role +  " where accno='" + accno + "'";
	st.executeUpdate(query);
	query = "update accounts set name='" + name + "', address='" + address +  "' where accno='" + accno + "'";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/edit.jsp?user=" + accno);
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "edit");
}
finally{
	con.close();
}

%>