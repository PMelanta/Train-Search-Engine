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
			if (request.getParameter("edit_id") == null) {
		%>
		<form onsubmit="return validate();">
			<table style="margin: auto; margin-top: 50px;" cellspacing="15">
				<thead>
					<tr>
						<td
							style="font-size: 30px; font-weight: bold; color: blue; font-family: monospace;"
							colspan="2">ADD TRAINS</td>
						<td></td>
					</tr>
				</thead>
				<tr>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">TRAIN
						NAME</td>
					<td><input type="text" id="trainname" name="trainname"
						required=""
						style="width: 200px; height: 25px; border-radius: 10px;"></input></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" id="submit" name="submit"
						value="SUBMIT"
						style="float: right; font-weight: bold; color: white; background: #82ab01; height: 30px; width: 100px; border-radius: 10px;"></input></td>
				</tr>
			</table>

		</form>
		<%
			}
		%>
		<%
			if (request.getParameter("submit") != null) {
				String trainname = request.getParameter("trainname");

				String sql = "select * from trains where trainname = '" + trainname + "'";
				ResultSet set = dao.getData(sql);
				if (set.next()) {
		%>
		<script type="text/javascript">
			alert("Train Already Exists");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			} else {
					String query = "insert into trains ( trainname ) values ('" + trainname + "') ";
					//System.out.println(query);
					int rows = dao.putData(query);
					dao.closeConnection();
					if (rows > 0) {
		%>
		<script type="text/javascript">
			alert("Train has been Added Successfully");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			} else {
		%>
		<script type="text/javascript">
			alert("Train Has Not been Added");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			}
				}
			}
		%>

		<%
			if (request.getParameter("edit_id") != null) {
				int id = Integer.parseInt(request.getParameter("edit_id"));
				String query = "select * from trains where trainid = " + id;
				ResultSet resultSet = dao.getData(query);
				if (resultSet.next()) {
					String trainname = resultSet.getString("trainname");
		%>
		<form onsubmit="return validaterack_up();" id="editform">
			<table style="margin: auto; margin-top: 50px;" cellspacing="10">
				<thead>
					<tr>
						<td
							style="font-size: 30px; font-weight: bold; color: blue; font-family: monospace;"
							colspan="2">ADD TRAINS</td>
						<td></td>
					</tr>
				</thead>
				<tr>
					<td
						style="color: #734633; font-weight: bold; font-size: 20px; color: #FFCC00; font-family: monospace;">TRAIN
						NAME</td>
					<td><input type="text" id="trainname_up" name="trainname_up"
						value="<%=trainname%>"
						style="width: 200px; height: 25px; border-radius: 10px;"
						required=""></input></td>
				</tr>
				<tr>
					<td><input type="hidden" value="<%=id%>" id="update_id"
						name="update_id"></input></td>
					<td><input type="submit" id="submit_up" name="submit_up"
						value="UPDATE"
						style="float: right; font-weight: bold; color: white; background: #82ab01; height: 30px; width: 100px; border-radius: 10px;"></input>
						<a href="managetrains.jsp"
						style="margin-right: 50px; color: #FFCC00; font-size: 15px;">CANCEL</a></td>
				</tr>
			</table>
			<div id="message" name="message"
				style="color: red; font-size: 15px; margin-left: 50px; margin-top: 30px; font-weight: bold;"></div>
		</form>
		<%
			}
			}
			if (request.getParameter("submit_up") != null) {
				String name = request.getParameter("trainname_up");
				int id = Integer.parseInt(request.getParameter("update_id"));
				String query = "update trains set trainname = '" + name + "' where trainid = " + id;
				//System.out.println(query);
				int rows = dao.putData(query);
				dao.closeConnection();
				if (rows > 0) {
		%>
		<script type="text/javascript">
			alert("Train details Has been Updated");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			} else {
		%>
		<script type="text/javascript">
			alert("Train Has Not been  Updated");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			}
			}
		%>
		<%
			if (request.getParameter("delete_id") != null) {
				int id = Integer.parseInt(request.getParameter("delete_id"));
				String query = "delete from trains where trainid = " + id;
				int rows = dao.putData(query);
				dao.closeConnection();
				if (rows > 0) {
		%>
		<script type="text/javascript">
			alert("Train has been Deleted");
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			} else {
		%>
		<script type="text/javascript">
			alert("Train Has Not been Deleted")
			window.location.href = "managetrains.jsp" + "#col-left";
		</script>
		<%
			}
			}
		%>
		<%
			String query = "select * from trains";
			ResultSet resultSet = dao.getData(query);
			if (resultSet.next()) {
		%>
		<table style="margin: auto; margin-top: 50px;" cellspacing="10"
			id="cusback_">
			<tr>
				<td
					style="font-weight: bold; font-size: 25px; color: #CCFF66; font-family: monospace;">TRAIN
					NAME</td>
				<td
					style="font-weight: bold; font-size: 15px; font-family: monospace; color: #CCFF66;">Edit</td>
				<td
					style="font-weight: bold; font-size: 15px; font-family: monospace; color: #CCFF66;">Delete</td>

			</tr>
			<%
				do {
						int trainid = resultSet.getInt("trainid");
						String trainname = resultSet.getString("trainname");
			%>
			<tr>
				<td
					style="font-size: 18px; color: #FFCC00; font-weight: bold; font-family: monospace;"><%=trainname%></td>
				<td
					style="font-size: 18px; font-weight: bold; font-family: monospace;"><a
					href="managetrains.jsp?edit_id=<%=trainid%>"
					style="color: #FFCC00;">Edit</a></td>
				<td
					style="font-size: 18px; font-weight: bold; font-family: monospace;"><a
					href="managetrains.jsp?delete_id=<%=trainid%>" onclick="ondelete()"
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
