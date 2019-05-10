<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<html>
<head>
	<title>Bank App - Admin - Edit Account</title>
	<script type="text/javascript">
		function revealpass(){
			document.getElementById("passworddiv").style.visibility="visible";
		}

		function password(){
			var pass1 = document.getElementById("pass1").value;
			var pass2 = document.getElementById("pass2").value;
			var accno = document.getElementById("accno").innerHTML;
			if(pass1 != pass2){
				alert("Passwords do not match");
				return false;
			}
			else{
				session.setAttribute("accno", accno);
				session.setAttribute("pass1", pass1);
			}
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
		<div style='position: absolute;top: 5%; right: 22%;'>
			<input type="button" onclick="parent.location='http://localhost:8080/JSP/BankApp/admin.jsp'" value="Return to admin page">
		</div>
		<div style="position: absolute;top: 10%;left:5%;font-size: 50;font-weight: bold;text-align: center;">
			Admin - Edit Account
			<div style="position: absolute;top: 55;left:2%;height:100%;width:100%;font-size: 10;text-align: center;">
				<div style="position: absolute;top: 5%;left:2%;font-size: 20;text-align: center;">
					Account Number:<br>
					Name:<br>
					Address:<br>
					Role:<br>
					Active:<br>
				</div>
				<div style="position: absolute;top: 15%;left:45%;font-size: 40;text-align: center;">
				<%
					try{
						if((Integer)session.getAttribute("role") == 2){
							try{
								String query = "select accounts.accno, accounts.name, accounts.address, users.active, users.role from accounts, users where accounts.accno = users.accno  and accounts.accno='" + request.getParameter("user") + "'";
								ResultSet rs = st.executeQuery(query);

								rs.next();
								out.println("<form action='http://localhost:8080/JSP/BankApp/editaction.jsp'>");
								out.println("<input name='accno' value='" + request.getParameter("user") + "' readonly><br>");
								out.println("<input name='name' value='" + rs.getString(2) + "'><br>");
								out.println("<input name='address' value='" + rs.getString(3) + "'><br>");
								out.println("<input name='role' value='" + rs.getInt(5) + "'><br>");
								out.println("<input name='active' value='" + rs.getString(4) + "'><br>");
								out.println("<input type='submit' value='Submit Changes'>");
								out.println("</form>");
							}
							catch(Exception t){
								out.println("<div style='position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);background-color:grey;border:solid black thin;'>" + t.toString() + "</div>");
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
				<div style="position: absolute;top: 300%;left:50%;transform:translate(-50%,-50%);font-size: 40;text-align: center;">
					<input type='button' value='Change Password' onclick="revealpass()">
				</div>
				<div id="passworddiv" style="position: absolute;top:420%;left:50%;transform:translate(-50%,-50%);visibility: hidden;">
					<form onsubmit="return password()" action="http://localhost:8080/JSP/BankApp/passedit.jsp">
						<input type="password" id="pass1" name="pass1"><br>
						<%
							out.println("<input name='accno' id='accno' style='visibility:hidden;' value='" + request.getParameter("user") + "'>");
						%>
						<input type="password" id="pass2" name="pass2"><br>
						<input type="submit" value="Change">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>