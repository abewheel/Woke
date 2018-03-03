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
	String userid = request.getParameter("user");
	String password = request.getParameter("pwd");
	//connect to mysql
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/factory?" + "user=root&password=");
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from userobj where userid='" + userid + "' and pwd='" + password + "'");

	
	if (rs.next()) {
		out.println("Welcome " + userid + "!");
		session.setAttribute("userid", userid);
	}
	else {
		out.println("invalid login");
	}

%>

	<a href="index.html">Go home</a>
</body>
</html>