<%@ page import="java.sql.*" %>

<%
	Connection con = null;
	Statement st = null;
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp", "root", "");
		st = con.createStatement();
	}
	catch(Exception e){
		response.sendRedirect("failed.jsp?pass=" + e.toString() + "connection");
	}
%>