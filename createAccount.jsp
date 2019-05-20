<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String accountType = request.getParameter("accounttype");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
try{
	String query = "select LPAD(ifnull(max(substring(accno,3,5))+1,'001'),3,'0') from (select * from accounts where accno like '" + accountType + "%') as t1";
	ResultSet rs = st.executeQuery(query);
	rs.next();
	String accountNumber = accountType + gender + rs.getString(1);
	String redirect = "setPassword.jsp?accno=" + accountNumber + "&name=" + name;
	if(accountNumber.length()==5){
		query = "insert into accounts values('" + accountNumber + "', '" + name + "', '" + address + "')";
		st.executeUpdate(query);
		response.sendRedirect(redirect);
	}
	else{
		response.sendRedirect("failed.jsp?pass=" + accountNumber);
	}
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString());
}
finally{
	con.close();
}

%>