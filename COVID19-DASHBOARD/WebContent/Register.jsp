<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String username=request.getParameter("uname");
session.putValue("uname",username);
String password=request.getParameter("password");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb","root","root123");
Statement st=con.createStatement();
ResultSet rs;
int i=st.executeUpdate("insert into member values('"+username+"','"+password+"','"+email+"','"+phone+"')");
session.setAttribute("message","successful");
response.sendRedirect("memberLogin.jsp");
%>

</body>
</html>