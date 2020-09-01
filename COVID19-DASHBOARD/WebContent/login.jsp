<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String uname=request.getParameter("uname1");
session.putValue("uname",uname);
String password=request.getParameter("password");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","root123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("Select * from member where uname='"+uname+"'");
if(rs.next())
{
	if(rs.getString(2).equals(password))
	{
		response.sendRedirect("home.html");
	}
	else
	{
		out.println("Invalid");
	}
}
else
%>

</body>
</html>