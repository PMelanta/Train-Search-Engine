<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DAO_Implement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Traveling Train</title>
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
				<li><a href="checktrainsvia.jsp"> Check via</a>
				<li><a href="checkroute.jsp">Check Route</a></li>
				<li><a href="login.jsp">Log In</a></li>
			</ul>
		</div>
		<div>
		<br>
		
		<h2
			style="color: #CCFF66; margin-left: 250px; font-family: monospace; font-weight: bold; font-size: 30px;">VIEW ROUTE</h2>
		<%
			DAO_Implement dao = new DAO_Implement();
			String source = "", dest = "";
		%>
		<form action="">
			<table style="margin-left: 50px;" cellspacing="15">
				<thead>
					<tr>
						<td
							style="font-size: 30px; font-weight: bold; color: blue; font-family: monospace;"
							colspan="2">CHECK ROUTE</td>
						<td></td>
					</tr>
				</thead>
				<tr>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">SOURCE</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">DESTINATION</td>
				</tr>
				<tr>
					<td><input type="text" id="source" name="source"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>

					<td><input type="text" id="destination" name="destination"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>

					<td><input type="submit" id="submit" name="submit"
						value="SUBMIT"
						style="float: right; font-weight: bold; color: white; background: #82ab01; height: 30px; width: 100px; border-radius: 10px;"></input></td>
				</tr>
			</table>
		</form>
		<%
			if (request.getParameter("source") != null && request.getParameter("destination") != null) {
				source = request.getParameter("source");
				dest = request.getParameter("destination");

				String sql = "SELECT via FROM viaroute WHERE source = '"
						+ source + "' AND destination = '" + dest + "'";
				System.out.println(sql);
				ResultSet res = dao.getData(sql);
				if (res.next()) {
		%>
		<table style="margin: auto; margin-top: 50px;" cellspacing="10"
			id="cusback_new">
			<tr>
				<td
					style="font-weight: bold; font-size: 25px; color: #CCFF66; font-family: monospace;">SOURCE
				</td>
				<td
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">VIA</td>
				<td
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">DESTINATION</td>
			</tr>
			<%
				do {
			%>
			<tr>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=source%></td>
					<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=res.getString("via")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=dest%></td>

				
			</tr>
			<%
				} while (res.next());
			%>
		</table>
		<%
			} 
			}
					else{
						%>
		<div
			style="color: #FFCC00; font-family: inherit; font-size: 25px; font-weight: bold; text-align: center; margin-top: 100px; margin-left: 30px; font-family: monospace; font-weight: bold;">
			No Trains Available</div>
		<%
					}
		%>
		<br>
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
	</div>
</body>
</html>
