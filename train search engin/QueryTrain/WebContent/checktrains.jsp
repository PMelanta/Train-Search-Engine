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
				<li><a href="checktrainsvia.jsp"> Check via</a></li>
				<li><a href="checkroute.jsp">Check Route</a></li>
				<li><a href="login.jsp">Log In</a></li>
			</ul>
		</div>
		<h2
			style="color: #CCFF66; margin-left: 250px; font-family: monospace; font-weight: bold; font-size: 30px;">VIEW
			TRAINS</h2>
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
							colspan="2">SEARCH TRAINS</td>
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

				String sql = "SELECT assignid , trainname FROM assigntrains INNER JOIN trains ON assigntrains.trainid = trains.trainid WHERE source = '"
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
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">DESTINATION</td>
				<td
					style="font-weight: bold; font-size: 25px; font-family: monospace; color: #CCFF66;">TRAIN
					NAME</td>
			</tr>
			<%
				do {
			%>
			<tr>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=source%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=dest%></td>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=res.getString("trainname")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><a
					href="checktrains.jsp?source=<%=source%>&destination=<%=dest%>&assignid=<%=res.getInt("assignid")%>"
					style="color: #CCFF66">CLICK HERE</a></td>
			</tr>
			<%
				} while (res.next());
			%>
		</table>
		<%
			} else {
					String sqlquery = "SELECT DISTINCT assignid FROM routes WHERE stationid="
									+ "(SELECT stationid FROM stations WHERE stationname='"+source
									+"') AND (SELECT stationid FROM stations WHERE stationname='"+dest+"') IN"
									+"(SELECT stationid FROM routes WHERE assignid=assignid)";
					System.out.println(sqlquery);
					ResultSet resultSet = dao.getData(sqlquery);
					if(resultSet.next()){
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
						do{
						sqlquery = "SELECT trainname,source,destination FROM trains INNER JOIN assigntrains ON assigntrains.trainid"
								 + "=trains.trainid WHERE assignid="+resultSet.getInt("assignId")
								 + " AND (SELECT routesid FROM routes WHERE stationid=(SELECT stationid FROM stations WHERE "
								 +"stationname='"+dest+"') AND  assignid="+resultSet.getInt("assignId")+")"
								 +"> (SELECT routesid FROM routes WHERE stationid=(SELECT stationid FROM stations"
								 +" WHERE stationname='"+source+"') AND  assignid="+resultSet.getInt("assignId")+")";
						System.out.println(sqlquery);
						ResultSet rs = dao.getData(sqlquery);
						if(rs.next()){				
		%>
			<tr>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("source")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("destination")%></td>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("trainname")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><a
					href="checktrains.jsp?source=<%=source%>&destination=<%=dest%>&assignid=<%=resultSet.getInt("assignid")%>"
					style="color: #CCFF66">CLICK HERE</a></td>
			</tr>
			<%
						}
				} while (resultSet.next());
			%>
		</table>
		<%
			}else{
						%>
		<div
			style="color: #FFCC00; font-family: inherit; font-size: 25px; font-weight: bold; text-align: center; margin-top: 100px; margin-left: 30px; font-family: monospace; font-weight: bold;">
			No Trains Available</div>
		<%
					}
		%>
		<%
			}
			}
		%>
		<%
			if (request.getParameter("assignid") != null) {
		%>
		<table style="margin-left: 50px;" cellspacing="15">
			<thead>
				<tr>
					<td
						style="font-size: 30px; font-weight: bold; color: blue; font-family: monospace;"
						colspan="2">ASSIGN TRAINS</td>
					<td></td>
				</tr>
			</thead>
			<tr>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">STATION</td>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">ARRIVAL</td>

				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">DEPARTURE</td>
			</tr>
			<%
				int id = Integer.parseInt(request.getParameter("assignid"));
					String qry = "SELECT stationname , arrival , dept FROM routes INNER JOIN stations ON stations.stationid = routes.stationid WHERE assignid = "+id+" AND routesid BETWEEN" 
							+"(SELECT routesid FROM routes WHERE assignid = "+id+" and stationid = (SELECT stationid FROM stations WHERE stationname = '"+source+"')) AND "
							+"(SELECT routesid FROM routes WHERE assignid = "+id+" and stationid = (SELECT stationid FROM stations WHERE stationname = '"+dest+"'))";
					ResultSet rs = dao.getData(qry);
					while (rs.next()) { 
			%>
			<tr>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("stationname")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("arrival")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=rs.getString("dept")%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
		<div id="footercus_">&nbsp;</div>
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
