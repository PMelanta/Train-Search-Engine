<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnect.DAO_Implement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Traveling Train</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="css/assigntrains.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/assigntrains.js"></script>
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
			STATIONS</h2>
		<%
			DAO_Implement dao = new DAO_Implement();
		%>

		<form onsubmit="return onnodes();">
			<table style="margin-top: 50px; margin-left: -100px;"
				cellspacing="15">
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
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">SOURCE</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">DESTINATION</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">TRAIN
					</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">STATION
						POINTS</td>
				</tr>
				<tr>
					<%
						if (request.getParameter("source") != null) {

							String source = request.getParameter("source");
					%>
					<td><input type="text" id="source" name="source"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						value="<%=source%>" required=""></input></td>

					<%
						} else {
					%>
					<td><input type="text" id="source" name="source"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>
					<%
						}
					%>
					<%
						if (request.getParameter("destination") != null) {
							String des = request.getParameter("destination");
					%>
					<td><input type="text" id="destination" name="destination"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						value="<%=des%>" required=""></input></td>

					<%
						} else {
					%>
					<td><input type="text" id="destination" name="destination"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>
					<%
						}
					%>
					<td><select id="trains" name="trains" required="required"
						style="height: 30px; font-weight: bold; width: 200px; border-radius: 10px;">
							<option value="">Select Train</option>
							<%
								int trainid = 0;
								if (request.getParameter("trains") != null) {
									trainid = Integer.parseInt(request.getParameter("trains"));
								}

								ResultSet set = dao.getData("select * from trains");
								while (set.next()) {
									if (trainid == set.getInt("trainid")) {
							%>
							<option value="<%=set.getInt("trainid")%>"
								style="font-weight: bold; font-size: 15px;" selected="selected"><%=set.getString("trainname")%></option>
							<%
								} else {
							%>
							<option value="<%=set.getInt("trainid")%>"
								style="font-weight: bold; font-size: 15px;"><%=set.getString("trainname")%></option>
							<%
								}
								}
							%>

					</select></td>
					<%
						if (request.getParameter("points") != null) {
							String points = request.getParameter("points");
					%>
					<td><input type="text" id="points" name="points"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						value="<%=points%>" required=""></input></td>
					<%
						} else {
					%>
					<td><input type="text" id="points" name="points"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"
						required=""></input></td>
					<%
						}
					%>
					<td><input type="submit" id="submit" name="submit"
						value="SUBMIT"
						style="float: right; font-weight: bold; color: white; background: #82ab01; height: 30px; width: 100px; border-radius: 10px;"></input></td>
				</tr>

			</table>



			<table style="margin: auto; margin-top: 50px;" cellspacing="15">
				<%
					if (request.getParameter("points") != null) {
						int points = Integer.parseInt(request.getParameter("points"));
				%>
				<tr>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">STATIONS</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">ARRIVAL
					</td>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">DEPARTURE</td>
				</tr>

				<%
					for (int i = 1; i <= points; i++) {
				%>
				<tr>
					<td><select id="routes" name="routes" required="required"
						style="height: 30px; font-weight: bold; width: 200px; border-radius: 10px;">
							<option value="">Select Stop</option>
							<%
								ResultSet resultSet = dao.getData("select * from stations");
										while (resultSet.next()) {
							%>
							<option value="<%=resultSet.getInt("stationid")%>"
								style="font-weight: bold; font-size: 15px;"><%=resultSet.getString("stationname")%></option>
							<%
								}
							%>

					</select></td>
					<td><input type="text" id="arrivaltime" name="arrivaltime"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"></td>
					<td><input type="text" id="departuretime" name="departuretime"
						style="width: 200px; height: 25px; border-radius: 10px; font-size: 20px; font-weight: bold;"></td>
					<%
						}
					%>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td><input type="submit" id="save" name="save" value="SAVE"
						style="float: right; font-weight: bold; color: white; background: #82ab01; height: 30px; width: 100px; border-radius: 10px;"></td>
				</tr>
				<%
					}
				%>
			</table>
		</form>
		<%
			if (request.getParameter("save") != null) {

				String source = request.getParameter("source");
				String des = request.getParameter("destination");
				int traind = Integer.parseInt(request.getParameter("trains"));
				int points = Integer.parseInt(request.getParameter("points"));
				String route[] = request.getParameterValues("routes");
				String arrtime[] = request.getParameterValues("arrivaltime");
				String deptime[] = request.getParameterValues("departuretime");

				String sql = "insert into assigntrains (source , destination , trainid , points) values ('" + source
						+ "' , '" + des + "' , '" + traind + "' , '" + points + "')";
				int res = dao.putData(sql);
				if (res > 0) {
					int assignid = 0;
					String qry = "SELECT assignid FROM assigntrains ORDER BY assignid DESC LIMIT 1";
					ResultSet resultSet = dao.getData(qry);
					while (resultSet.next()) {
						assignid = resultSet.getInt("assignid");
					}

					for (int i = 0; i < route.length; i++) {
						String query = "insert into routes ( stationid , assignid , arrival , dept) values ( '"
								+ route[i] + "' , " + assignid + " , '" + arrtime[i] + "' , '" + deptime[i] + "')";
						dao.putData(query);
					}
		%>
		<script type="text/javascript">
			alert("Train Routes has been Sucessfuly Added");
			window.location.href = "assigntrains.jsp";
		</script>
		<%
			} else {

				}
			}
		%>
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
