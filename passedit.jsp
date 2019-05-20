<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
	String accno = request.getParameter("accno");
	String password = request.getParameter("pass1");
	try{
		String query = "update users set password='" + password + "' where accno='" + accno + "'";
		st.executeUpdate(query);
		response.sendRedirect("admin.jsp?name=" + query);
	}
	catch(Exception t){
		out.println("<html>" + t.toString() + "</html>");
	}
	finally{
		con.close();
	}
%>