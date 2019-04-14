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
				<li><a herf="checktrainsvia.jsp"> Check via</a></li>
				<li><a href="contact.jsp">Contact Us</a></li>
				<li><a href="login.jsp">Log In</a></li>
			</ul>
		</div>
		<h2
			style="color: #CCFF66; margin-left: 250px; font-family: monospace; font-weight: bold; font-size: 30px;">VIEW
			TRAINS</h2>
		<%
			DAO_Implement dao = new DAO_Implement();
			String source1 = "", dest1 = "", source2 = "", dest2 = "";
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
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">VIA</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">DESTINATION</td>
				</tr>
				<tr>
					<td><input type="text" id="source" name="source"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>

					<td><input type="text" id="via" name="via"
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
			if (request.getParameter("submit") != null) {
				source1 = request.getParameter("source");
				dest1 = request.getParameter("via");
				String d = request.getParameter("destination");
				String sql1 = "SELECT assignid , trainname FROM assigntrains INNER JOIN trains ON assigntrains.trainid = trains.trainid WHERE source = '"
						+ source1 + "' AND destination = '" + dest1 + "'";
				System.out.println(sql1);
				ResultSet set1 = dao.getData(sql1);

				if (set1.next()) {
		%>
		<table style="float: left;" cellspacing="10" id="cusback_new">
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
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=source1%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=dest1%></td>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=set1.getString("trainname")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><a
					href="checktrainsvia.jsp?source=<%=source1%>&via=<%=dest1%>&assignid1=<%=set1.getInt("assignid")%>&destination=<%=d %>&submit"
					style="color: #CCFF66">CLICK HERE</a></td>
			</tr>
			<%
				} while (set1.next());
					}
				else {
					String sqlquery = "SELECT DISTINCT assignid FROM routes WHERE stationid="
									+ "(SELECT stationid FROM stations WHERE stationname='"+source1
									+"') AND (SELECT stationid FROM stations WHERE stationname='"+dest1+"') IN"
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
								 +"stationname='"+dest1+"') AND  assignid="+resultSet.getInt("assignId")+")"
								 +"> (SELECT routesid FROM routes WHERE stationid=(SELECT stationid FROM stations"
								 +" WHERE stationname='"+source1+"') AND  assignid="+resultSet.getInt("assignId")+")";
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
					href="checktrainsvia.jsp?source=<%=source1%>&via=<%=dest1%>&assignid1=<%=resultSet.getInt("assignid")%>&destination=<%=d %>&submit"
					style="color: #CCFF66">CLICK HERE</a></td>
			</tr>
			<%
						}
				} while (resultSet.next());
			%>
		</table>
		<%
			}
					else{
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
		</table>
		<%
			if (request.getParameter("assignid1") != null) {
				String source = request.getParameter("source");
				String dest = request.getParameter("via");
		%>
		<table style="margin-left: 50px;" cellspacing="15">
			<tr>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">STATION</td>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">ARRIVAL</td>

				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">DEPARTURE</td>
			</tr>
			<%
				int id = Integer.parseInt(request.getParameter("assignid1"));
					String qry = "SELECT stationname , arrival , dept FROM routes INNER JOIN stations ON stations.stationid = routes.stationid WHERE assignid = "
							+ id + " AND routesid BETWEEN" + "(SELECT routesid FROM routes WHERE assignid = " + id
							+ " and stationid = (SELECT stationid FROM stations WHERE stationname = '" + source + "')) AND "
							+ "(SELECT routesid FROM routes WHERE assignid = " + id
							+ " and stationid = (SELECT stationid FROM stations WHERE stationname = '" + dest + "'))";
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
		<%
			if (request.getParameter("submit") != null)
			{
			String src = request.getParameter("source");	
			source2 = request.getParameter("via");
			dest2 = request.getParameter("destination");
			String sql2 = "SELECT assignid , trainname FROM assigntrains INNER JOIN trains ON assigntrains.trainid = trains.trainid WHERE source = '"
					+ source2 + "' AND destination = '" + dest2 + "'";

			ResultSet set2 = dao.getData(sql2);

			if (set2.next()) {
		%>
		<table style="margin: auto; float: right;" cellspacing="10"
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
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=source2%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=dest2%></td>

				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=set2.getString("trainname")%></td>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><a
					href="checktrainsvia.jsp?source=<%=src%>&via=<%=source2%>&assignid2=<%=set2.getInt("assignid")%>&destination=<%=dest2 %>&submit"
					style="color: #CCFF66">CLICK HERE</a></td>
			</tr>
			<%
				} while (set2.next());
				}
			else {
				String sqlquery = "SELECT DISTINCT assignid FROM routes WHERE stationid="
								+ "(SELECT stationid FROM stations WHERE stationname='"+source2
								+"') AND (SELECT stationid FROM stations WHERE stationname='"+dest2+"') IN"
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
							 +"stationname='"+dest2+"') AND  assignid="+resultSet.getInt("assignId")+")"
							 +"> (SELECT routesid FROM routes WHERE stationid=(SELECT stationid FROM stations"
							 +" WHERE stationname='"+source2+"') AND  assignid="+resultSet.getInt("assignId")+")";
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
				href="checktrainsvia.jsp?source=<%=src%>&via=<%=source2%>&assignid2=<%=resultSet.getInt("assignid")%>&destination=<%=dest2 %>&submit"
				style="color: #CCFF66">CLICK HERE</a></td>
		</tr>
		<%
					}
			} while (resultSet.next());
		%>
	</table>
	<%
		}
				else{
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
		</table>
		<%
			if (request.getParameter("assignid2") != null) {
				String source = request.getParameter("via");
				String dest = request.getParameter("destination");
		%>
		<table style="margin-left: 50px;" cellspacing="15">
			<tr>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">STATION</td>
				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">ARRIVAL</td>

				<td
					style="color: #734633; font-weight: bold; font-size: 20px; color: #CCFF66; font-family: monospace;">DEPARTURE</td>
			</tr>
			<%
				int id = Integer.parseInt(request.getParameter("assignid2"));
					String qry = "SELECT stationname , arrival , dept FROM routes INNER JOIN stations ON stations.stationid = routes.stationid WHERE assignid = "
							+ id + " AND routesid BETWEEN" + "(SELECT routesid FROM routes WHERE assignid = " + id
							+ " and stationid = (SELECT stationid FROM stations WHERE stationname = '" + source + "')) AND "
							+ "(SELECT routesid FROM routes WHERE assignid = " + id
							+ " and stationid = (SELECT stationid FROM stations WHERE stationname = '" + dest + "'))";
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
	</div>
</body>
</html>
