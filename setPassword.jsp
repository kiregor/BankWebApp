<html>
<head>
	<title>Bank App - Set Account Password</title>
</head>
<body style="text-align: center;">
	<span style="font-size: 100; position: absolute;display: inline-block;"></span>
	<div style="position: absolute;top:50%;left: 50%;transform:translate(-50%,-50%);background-color: grey;border: solid black thin;height: 50%;width: 50%">
		<div style="position: absolute;top:5%;left: 10%;transform: translate(-50%,-50%);">
			<img src="banklogo.png" style="height: 50">
		</div>
		<form action="http://localhost:8080/JSP/BankApp/createpassword.jsp">
			<div style="position: absolute;top: 25%;left: 50%;height: 30%;width:100%;transform:translate(-50%,-50%);border: solid black thin;">
				<div style="position: absolute;top: -35%;right: 1%;font-size: 40;font-weight: bold;text-align: left">
					Password for Account: 
					<%=
						request.getParameter("accno")
					%>
				</div>
				<div style="position: absolute;top: 50%;left: 35%;transform:translate(-50%,-50%);font-size: 50;font-weight: bold;text-align: left">
					Password:<br>
					Re-Try Password:<br>
				</div>
				<div style="position: absolute;top: 50%;left: 85%;transform:translate(-50%,-50%);font-size: 50;font-weight: bold;">
					<div style="position: absolute;top: -50%;left: 50%;transform:translate(-50%,-50%);">
						<input type="password" name="pass1">
					</div>
					<div style="position: absolute;top: 200%;left: 50%;transform:translate(-50%,-50%);">
						<input type="password" name="pass2">
					</div>
					<%
						out.println("<input name='accno' value='" + request.getParameter("accno") + "' style='visibility: hidden;'>");
					%>
				</div>
			</div>
			<input type="submit" style="position: absolute;top: 75%;left: 50%;transform:translate(-50%,-50%);font-size: 20;font-weight: bold;">
		</form>
	</div>
</body>
</html>