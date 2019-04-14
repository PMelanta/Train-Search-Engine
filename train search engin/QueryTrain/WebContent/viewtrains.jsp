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
				<li><a href="managetrains.jsp">TRAINS</a></li>
				<li><a href="managestations.jsp">STATIONS</a></li>
				<li><a href="assigntrains.jsp">ASSIGN TRAINS</a></li>
				<li><a href="viewtrains.jsp">VIEW TRAINS</a></li>
				<li><a href="index.jsp">LOGOUT</a></li>
			</ul>
		</div>
		<h2
			style="color: #CCFF66; margin-left: 250px; font-family: monospace; font-weight: bold; font-size: 30px;">MANAGE
			TRAINS</h2>

		<%
			DAO_Implement dao = new DAO_Implement();
		%>
		<%
			String query = "SELECT source , destination , trainname , trains.trainid FROM assigntrains INNER JOIN trains ON assigntrains.trainid = trains.trainid";
			ResultSet resultSet = dao.getData(query);
			if (resultSet.next()) {
		%>
		<table style="margin: auto; margin-top: 50px;" cellspacing="10"
			id="cusback_new">
			<tr>
				<td
					style="font-weight: bold; font-size: 25px; color: #CCFF66; font-family: monospace;">SOURCE
				</td>
				<td
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">DESTINATION</td>
				<td
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">TRAIN
					NAME</td>
			</tr>
			<%
				do {
						String source = resultSet.getString("source");
						String destination = resultSet.getString("destination");
						String train = resultSet.getString("trainname");
						int trainid = resultSet.getInt("trainid");
			%>
			<tr>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=source%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=destination%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=train%></td>
				<td
					style="font-size: 18px; font-weight: bold; font-family: monospace;"><a
					href="viewtrains.jsp?delete_id=<%=trainid%>" onclick="ondelete()"
					style="color: #FFCC00;">Delete</a></td>					
			</tr>
			<%
				} while (resultSet.next());
			%>
		</table>
		<%
			dao.closeConnection();
			} else {
		%>
		<div
			style="color: #FFCC00; font-family: inherit; font-size: 25px; font-weight: bold; text-align: center; margin-top: 100px; margin-left: 30px; font-family: monospace; font-weight: bold;">
			No Trains Added</div>
		<%
			}
		%>

		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footer2_">
			<p>
				This template is under the Creative Commons Attribution 2.5</a> License.<br /> <br /> <span>
					<table class="footer" border="0" cellpadding=0 cellspacing=0 width="100%">
						<tr><font color="red">
							<td align="center"><font color="white">Copyright 2018-2019 Train Search Engine</font></td>
							</font>
						</tr>
					</table>
				</span>
			</p>
		</div>
		<div id="footer3_">&nbsp;</div>
	</div>
</body>
</html>
