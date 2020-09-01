<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>connection</title>
</head>
<body>
<%
String Name = request.getParameter("Name");
String email = request.getParameter("email");
String password = request.getParameter("password");
String confirmpassword = request.getParameter("confirmpassword");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login","root","root123");
	PreparedStatement ps = conn.prepareStatement("insert into registration(Name, email, password,confirmpassword) values(?,?,?,?);");
    ps.setString(1,Name);
    ps.setString(2,email);
    ps.setString(3,password);
    ps.setString(4,confirmpassword);
    
    int x = ps.executeUpdate();
    if(x>0){
    	response.sendRedirect("login.jsp");
    }
    else{
    	out.println("Registration Failed...");
    }
	
}catch(Exception e){
	out.println(e);
}
%>
</body>
</html>