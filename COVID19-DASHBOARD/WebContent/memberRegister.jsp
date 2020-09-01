<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTRATION</title>
<link rel="stylesheet" href="memberRegisterstyle.css">
</head>
<body>

	<div class="wrap">
		<h2>Register</h2>
	
<form action="Register.jsp" method="post">
		<table>
			<tr>
				<td>UserName</td>
				<td><input type="text" name="uname"></td>
			</tr>
			
			<tr>
				<td>Email</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="Submit"></td>
			</tr>
		</table>
		<div>
			<h5>Already user &nbsp;
			<a href="memberLogin.jsp">signin</a>
			</h5>
		</div>
	</form>
	</div>

</body>
</html>