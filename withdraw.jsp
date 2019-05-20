<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>

<html>
<head>
	<title>Bank App - Withdraw</title>
	<script type="text/javascript">
		function withdrawCheck(){
			let balancestring = document.getElementById("balance").innerHTML;
			let balancevalue = parseInt(balancestring);
			let withdrawvalue = parseInt(document.getElementById("withdraw").value);
			if(document.getElementById("withdraw").value === ""){
				alert("You have not provided a withdraw value");
				document.getElementById("number").focus();
			}
			else if(balancevalue >= withdrawvalue){
				parent.location="http://localhost:8080/JSP/BankApp/withdrawaction.jsp?withdraw=" + withdrawvalue;
			}
			else{
				alert("You do not have the requisit funds in your account to make this withdrawal!");
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
		<div style="position: absolute;top: 10%;font-size: 50;font-weight: bold;text-align: center;">
			Withdraw
			<div style="position: absolute;top: 55;left:5%;font-size: 10;text-align: center;width: 80%">
				<div style="position: absolute;top: 20%;left:5%;font-size: 30;width:200%;text-align: left;">
					Account Number:<br>
					Balance:
				</div>
				<div style="position: absolute;top: 20%;left:210%;font-size: 30;text-align: left;">
					<%= session.getAttribute("username") %>
					<%
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

							out.println("<span id='balance'>" + balance + "<span>");
						}
						catch(Exception t){
							response.sendRedirect("failed.jsp?pass=" + t.toString());
						}
					%>
				</div>
			</div>
			<div style="position: absolute;top: 250%;left:10%;font-size: 30;text-align: left;">
				<form onsubmit="">
					<input type="number" name="withdraw" id="withdraw">
					<input type="button" value="submit" onclick="withdrawCheck()">
				</form>
			</div>
		</div>
	</div>
</body>
</html>