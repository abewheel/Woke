<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<% 
	try {
		String userid = request.getParameter("userid");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		
		//connect to mysql
		Class.forName("com.mysql.jdbc.Driver");
		java.sql.Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/factory?" + "user=root&password=");
		
		Statement st = con.createStatement();
		ResultSet rs; 
		int i = st.executeUpdate("insert into userobj values ('"+userid+"','"+fname+"','"+lname+"',	'"+pwd+"','"+email+"')");
		
		out.println("Successfully signed up!");
		
		
	} catch (Exception e) {
		out.println("e - " + e.getMessage());
	}


%>

	<a href="index.html">Go home</a>
</body>
</html>