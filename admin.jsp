<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<html>
<head>
	<title>Bank App - Admin</title>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

	<script type="text/javascript">
		function search(){
			let searchID = document.getElementById("searchBox").value;
			
			for(i of $("tr")){
				if(i.id === searchID || i.id === "head"){
					i.hidden=false;
				}
				else{
					i.hidden=true;
				}
			}
		}

		function clearSearch(){
			for(i of $("tr")){
				i.hidden=false;
			}

			document.getElementById("searchBox").value = "";
		}
	</script>
</head>
<body style="text-align: center;">
	<span style="font-size: 100; position: absolute;display: inline-block;"></span>
	<div style="position: absolute;top:15%;left: 25%;width: 50%;background-color: grey;border: solid black thin;height: 50%;">
		<div style="position: absolute;top:5%;left: 10%;transform: translate(-50%,-50%);">
			<img src="banklogo.png" style="height: 50">
		</div>
		<div style="position: absolute;top: 5%; right: 5%;">
			<%= session.getAttribute("name") %> <input type="button" onclick="parent.location='http://localhost:8080/JSP/BankApp/logout.jsp'" value="Logout">
		</div>
		<div style="position: absolute;top: 10%;left:5%;font-size: 50;font-weight: bold;text-align: center;">
			Admin
			<div style="position: absolute;top: 55;left:2%;font-size: 10;text-align: center;">
				<%
					try{
						if((Integer)session.getAttribute("role") == 2){
							try{
								String query = "select accounts.accno, accounts.name, accounts.address, users.active from accounts, users where accounts.accno = users.accno";
								ResultSet rs = st.executeQuery(query);
								int i = 1;
								out.println("<div style='overflow:auto;height:300;min-width: 100%'>");
								out.println("<table style='border:solid black thin;background-color:white;'><tr id='head'><td>Serial Number</td><td>Account Number</td><td>Name</td><td>Active</td><td>Options</td></tr>");
								while(rs.next()){
									if(rs.getInt(4) == 1){
										out.println("<tr id='" + rs.getString(1) + "'><td>" + i++ + "</td><td><a href='/JSP/BankApp/account.jsp?accno=" + rs.getString(1) + "'>" + rs.getString(1) + "</a></td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(4) + "</td><td><a href='/JSP/BankApp/edit.jsp?user=" + rs.getString(1) + "'>edit</a>,<a href='/JSP/BankApp/block.jsp?user=" + rs.getString(1) + "'>block</a>,<a href='/JSP/BankApp/delete.jsp?user=" + rs.getString(1) + "'>delete</a> </td></tr>");
									}
									else{
										out.println("<tr id='" + rs.getString(1) + "'><td>" + i++ + "</td><td><a href='/JSP/BankApp/account.jsp?accno='" + rs.getString(1) + "'>" + rs.getString(1) + "</a></td><td>" + rs.getString(2) + "</td><td>" + rs.getInt(4) + "</td><td><a href='/JSP/BankApp/edit.jsp?user=" + rs.getString(1) + "'>edit</a>,<a href='/JSP/BankApp/unblock.jsp?user=" + rs.getString(1) + "'>unblock</a>,<a href='/JSP/BankApp/delete.jsp?user=" + rs.getString(1) + "'>delete</a> </td></tr>");
									}
								}
								out.println("</table></div>");
							}
							catch(Exception t){
								response.sendRedirect("failed.jsp?pass=" + t.toString());
							}
							finally{
								con.close();
							}
						}
						else{
							out.println("You do not have access to this page.");
						}
					}
					catch(Exception e){
						out.println(e.toString());
					}
				%>
			</div>
		</div>
		<div style="position: absolute;top:22%;right:5%;font-size: 20;font-weight: bold;text-align: center;">
			Search By ID<br>
			<input id="searchBox"><br>
			<input type="button" value="Search" onclick="search()">
			<input type="button" value="Clear" onclick="clearSearch()">
		</div>
	</div>
</body>
</html>