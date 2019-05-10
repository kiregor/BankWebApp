<%@ page import="java.sql.*" %>

<%
String accno = request.getParameter("accno");
String name = request.getParameter("name");
String address = request.getParameter("address");
String role = request.getParameter("role");
String active = request.getParameter("active");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp", "root", "");
	Statement st = con.createStatement();
	String query = "update users set active=" + active + ", role=" + role +  " where accno='" + accno + "'";
	st.executeUpdate(query);
	query = "update accounts set name='" + name + "', address='" + address +  "' where accno='" + accno + "'";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/edit.jsp?user=" + accno);
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "edit");
}
%>