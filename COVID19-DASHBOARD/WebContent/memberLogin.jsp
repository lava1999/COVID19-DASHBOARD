<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>REGISTRATION</title>
<link rel="stylesheet" href="memberRegisterstyle.css">
</head>
<body>
<div class="wrap">
<h2> Login</h2>
<form action="login.jsp" method="post">
		<table>
			<tr>
				<td>UserName</td>
				<td><input type="text" name="uname1"></td>
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
				<h5>Don't have account &nbsp;
				<a href="memberRegister.jsp">signup</a>
				</h5>
		</div>
	</form>
	</div>
</body>
</html>