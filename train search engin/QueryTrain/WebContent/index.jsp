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
				<li><a herf="#"> Check Routes</a>
				<li><a href="contact.jsp">Contact Us</a></li>
				<li><a href="login.jsp">Log In</a></li>
			</ul>
		</div>
		<div id="left_">
			<h2>Reminder</h2>
			<p>
				<span>T S E,</span> a web application for help user who want the information about the train 
			</p>
			<p>&nbsp;</p>
			<p>-------- </p>
			<p>&nbsp;</p>
			<p>
				<a href="#">read more</a>
			</p>
			<p>&nbsp;</p>
			<p>
				<span>Dear User,</span> all the information is for in this Information retrival is for testing 
			</p>
			<p>&nbsp;</p>
		</div>
		<div id="right_">
			<h2>Welcome To T S E</h2>
			
			<div class="w3-content w3-section" style="max-width:500px">
  <img class="mySlides" src="images/img1.jpg" style="width:100%">
  <img class="mySlides" src="images/img2.jpg" style="width:100%">
  <img class="mySlides" src="images/img3.jpg" style="width:100%">
</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
			
			
		</div>
		<div id="footer1_">&nbsp;</div>
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
