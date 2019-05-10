<html>
<head>
	<title>Bank App - Account</title>
</head>
<body style="text-align: center;">
	<span style="font-size: 100; position: absolute;display: inline-block;"></span>
	<div style="position: absolute;top:15%;left: 25%;width: 50%;background-color: grey;border: solid black thin;height: 50%;">
		<div style="position: absolute;top:5%;left: 10%;transform: translate(-50%,-50%);">
			<img src="banklogo.png" style="height: 50">
		</div>
		<div style="position: absolute;top: 20%;font-size: 50;font-weight: bold;text-align: center;">
			<u>Fail</u>
			<div>
			<%
				String output = request.getParameter("pass");
				out.println(output);
			%>
			</div>
		</div>
	</div>
</body>
</html>