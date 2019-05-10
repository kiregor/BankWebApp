<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<html>
<head>
	<title>Bank App - Account</title>
	<script type="text/javascript">
		function goadmin(){
			parent.location="http://localhost:8080/JSP/BankApp/admin.jsp";
		}

		function godeposit(){
			parent.location='http://localhost:8080/JSP/BankApp/deposit.jsp';
		}

		function gowithdraw(){
			parent.location='http://localhost:8080/JSP/BankApp/withdraw.jsp';
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
		<%
			if((Integer)session.getAttribute("role") == 2){
				out.println("<div style='position: absolute;top: 5%; right: 22%;'><input type='button' onclick='goadmin()' value='Return to admin page'></div>");
			}
		%>
		<div style="position: absolute;top: 10%;font-size: 50;font-weight: bold;text-align: center;">
			Account
			<div style="position: absolute;top: 55;left:5%;font-size: 10;text-align: center;">
				<%
					if((Integer)session.getAttribute("role") == 1){
						try{
							String query = "select * from transaction where accno='" + (String)session.getAttribute("username") + "'";
							ResultSet rs = st.executeQuery(query);
							int balance = 0;

							while(rs.next()){
								if(rs.getString(4).equals("W")){
									balance-=rs.getInt(2);
								}
								else if(rs.getString(4).equals("D")){
									balance+=rs.getInt(2);
								}
							}

							int i = 1;
							out.println("<div style='overflow:auto;height:300;'>");
							out.println("<table style='border:solid black thin;background-color:white;'><tr><td>Serial Number</td><td>Balance</td><td>Withdrawals</td><td>Deposits</td><td><div style='width:80'>Date</div></td></tr>");
							while(rs.previous()){
								
								if(rs.getString(4).equals("W")){
									out.println("<tr><td>" + i++ + "</td><td>" + balance + "</td><td>" + rs.getString(2) + "</td><td> - </td><td>" + rs.getString(3) + "</td></tr>");
									balance+=rs.getInt(2);
								}
								else if(rs.getString(4).equals("D")){
									out.println("<tr><td>" + i++ + "</td><td>" + balance + "</td></td><td> - </td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td></tr>");
									balance-=rs.getInt(2);
								}
							}
							out.println("</table></div>");
						}
						catch(Exception t){
							response.sendRedirect("failed.jsp?pass=" + t.toString());
						}
					}
					else if((Integer)session.getAttribute("role") == 2){
						try{
							String query = "select * from transaction where accno='" + request.getParameter("accno") + "'";
							ResultSet rs = st.executeQuery(query);


							Statement st2 = con.createStatement();
							String query2 = "select sum(amount) from transaction where accno='" + request.getParameter("accno") +"' and type = 'D'";
							ResultSet rs2 = st2.executeQuery(query2);
							rs2.next();
							int balance = rs2.getInt(1);

							int i = 1;
							out.println("<div style='overflow:auto;height:300;'>");
							out.println("<table style='border:solid black thin;background-color:white;'><tr><td>Serial Number</td><td>Balance</td><td>Withdrawals</td><td>Deposits</td><td><div style='width:80'>Date</div></td></tr>");
							while(rs.previous()){
								
								if(rs.getString(4).equals("W")){
									out.println("<tr><td>" + i++ + "</td><td>" + balance + "</td><td>" + rs.getString(2) + "</td><td> - </td><td>" + rs.getString(3) + "</td></tr>");
									balance+=rs.getInt(2);
								}
								else if(rs.getString(4).equals("D")){
									out.println("<tr><td>" + i++ + "</td><td>" + balance + "</td></td><td> - </td><td>" + rs.getString(2) + "</td><td>" + rs.getString(3) + "</td></tr>");
									balance-=rs.getInt(2);
								}
							}
							out.println("</table></div>");
						}
						catch(Exception t){
							response.sendRedirect("failed.jsp?pass=" + t.toString());
						}
					}
					else{
						out.println("You do not have access to this page");
					}
				%>
			</div>
		</div>

		<%
		if((Integer)session.getAttribute("role") == 1){
			out.println("<div style='position: absolute;top:45%;right: 5%;height:20%;width:35%;background-color: white;font-size: 20;font-weight: bold;'><u>Actions</u><br><div style='position: absolute;top:42%;left: 50%;transform: translate(-50%,-50%);''><input type='button' value='Deposit' onclick='godeposit()'></div><div style='position: absolute;top:75%;left: 50%;transform: translate(-50%,-50%);'><input type='button' value='Withdraw' onclick='gowithdraw()'></div></div>");
		}
		%>

		<div style="position: absolute;top:23%;right: 5%;height:20%;width:35%;background-color: white;font-size: 20;font-weight: bold;">
			<u>Account Details</u><br>
			<div style="position: absolute;top:25%;left: 2%;height:20%;width:45%;font-size: 13;font-weight: bold;text-align: left;">
				Account Number:<br>
				Name:<br>
				Address:
			</div>
			<div style="position: absolute;top:25%;right: 10%;height:20%;width:30%;font-size: 13;font-weight: bold;text-align: left;">
				<%= (String)session.getAttribute("username") %>
				<%= (String)session.getAttribute("name") %><br>
				<%
					try{
						String query = "select address from accounts where accno='" + (String)session.getAttribute("username") + "'";
						ResultSet rs = st.executeQuery(query);
						rs.next();
						out.println(rs.getString(1));
					}
					catch(Exception t){
						response.sendRedirect("failed.jsp?pass=" + t.toString());
					}
				%>
			</div>
		</div>
	</div>
</body>
</html>