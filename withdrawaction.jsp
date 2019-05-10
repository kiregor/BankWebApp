<%@ page import="java.sql.*" %>

<%
String witValue = request.getParameter("withdraw");
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankwebapp", "root", "");
	Statement st = con.createStatement();
	String query = "insert into transaction values('" + (String)session.getAttribute("username") + "', '" + Integer.parseInt(witValue) + "', current_timestamp, 'W')";
	st.executeUpdate(query);
	response.sendRedirect("http://localhost:8080/JSP/BankApp/account.jsp");
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString() + "withdraw");
}
%>