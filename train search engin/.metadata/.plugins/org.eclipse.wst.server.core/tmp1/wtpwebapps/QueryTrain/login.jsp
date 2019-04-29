<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DAO_Implement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Travelling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/login.js"></script>
</head>
<body>
	<div id="Container">
		<div id="header_">
			&nbsp;
			<ul class="navi">
				<li><a href="index.jsp">Home Page</a></li>
				<li><a href="checktrains.jsp">Check Trains</a></li>
				<li><a href="checktrainsvia.jsp"> Check via</a></li>
				<li><a href="checkroute.jsp">Check Route</a></li>
				<li><a href="login.jsp">Log In</a></li>
			</ul>
		</div>
		<div id="right_">
			<h2>Welcome To Travelling Train!</h2>
			<form action="" onsubmit="return validate()" method="post">
				<table cellpadding="5px" style="margin: auto; margin-top: 50px;"
					cellspacing="15px">
					<thead>
						<tr>
							<td colspan="2"
								style="font-weight: bold; font-size: 25px; color: #CCFF66; font-family: monospace;">
								LOGIN</td>
						</tr>
					</thead>
					<tr>
						<td
							style="font-size: 20px; font-weight: bold; color: #CCFF66; font-family: monospace;">USERNAME</td>
						<td><input type="text" id="username" name="username"
							style="height: 18px; border-radius: 5px;" required="" /></td>
					</tr>
					<tr>
						<td
							style="font-size: 20px; font-weight: bold; color: #CCFF66; font-family: monospace;">PASSWORD</td>
						<td><input type="password" id="password" name="password"
							style="height: 18px; border-radius: 5px;" required="" /></td>
					</tr>

					<tr>
						<td></td>
						<td style="float: right;"><input type="submit" id="submit"
							name="submit" value="SUBMIT"
							style="height: 30px; background: #990000; color: #ffffff; width: 75px; border-radius: 5px;" /></td>
					</tr>
				</table>
			</form>
			<%!DAO_Implement dao = new DAO_Implement();
	String username = "", password = "";%>
			<%
				if (request.getParameter("submit") != null) {
					username = request.getParameter("username");
					password = request.getParameter("password");
					String query = "SELECT * FROM admin where adminid = '" + username + "' and password = '" + password
							+ "'";
					System.out.println(query);
					ResultSet resultSet = dao.getData(query);
					if (resultSet.next()) {
						session.setAttribute("admin", username);
						response.sendRedirect("managetrains.jsp");
					} else {
			%>
			<script type="text/javascript">
				alert("Invalid Username and Password");
			</script>
			<%
				}
				}
			%>
		</div>
		<div id="footer1_">&nbsp;</div>
		<div id="footer2_">
			<center>
				<p>
					This template is under the Creative Commons Attribution 2.5
					License.<br /> <br /> <span> <font color="white">Copyright
							2018-2019 Train Search Engine</font>
					</span>
				</p>
			</center>
		</div>
		<div id="footer3_">&nbsp;</div>
	</div>
</body>
</html>
