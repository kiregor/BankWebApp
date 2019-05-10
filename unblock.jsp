<%@ page import="java.sql.*" %>

<%
String user = request.getParameter("user");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp", "root", "");
	Statement st = con.createStatement();
	String query = "update users set active=1 where accno='" + user + "'";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/admin.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "unblock");
}
%>