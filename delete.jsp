<%@ page import="java.sql.*" %>

<%
String user = request.getParameter("user");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp", "root", "");
	Statement st = con.createStatement();
	String query = "delete from users where accno='" + user + "'";
	st.executeUpdate(query);
	query = "delete from accounts where accno='" + user + "'";
	st.executeUpdate(query);
	query = "delete from transaction where accno='" + user + "'";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/admin.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "delete");
}
%>