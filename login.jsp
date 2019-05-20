<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
try{
	String query = "select * from users where accno='" + username + "' and password = '" + password + "'";
	ResultSet rs = st.executeQuery(query);
	if(rs.next()){
		Statement st2 = con.createStatement();
		String query2 = "select name from accounts where accno='" + username + "'";
		ResultSet rs2 = st2.executeQuery(query2);
		rs2.next();
		if(rs.getInt(3)==2){
			session.setAttribute("username", username);
			session.setAttribute("role", 2);
			session.setAttribute("name", rs2.getString(1));
			response.sendRedirect("admin.jsp");
		}
		else if(rs.getInt(4)==0){
			response.sendRedirect("blocked.html");
		}
		else{
			session.setAttribute("username", username);
			session.setAttribute("role", 1);
			session.setAttribute("name", rs2.getString(1));
			response.sendRedirect("account.jsp");
		}
	}
	else{
		response.sendRedirect("noaccount.html");
	}
}
catch(Exception t){
	response.sendRedirect("failed.jsp?pass=" + t.toString());
}
finally{
	con.close();
}
%>