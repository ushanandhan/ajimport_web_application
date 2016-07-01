<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>AJ IMPORT'S LOGIN PAGE</title>
<link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel=icon/>
<link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel="shortcut icon"/>
<link rel="StyleSheet" href="<c:url value="/resources/css/global.css"/>" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/slides.min.jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/imageSlider.js"/>"></script>
<style>
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
}
BODY {
    MARGIN: 0px;
    FONT-SIZE: 12px; 
    FONT-FAMILY: Trebuchet MS ;
    BACKGROUND-COLOR: #ece9d8
}
input:required:invalid, input:focus:invalid {
  background-image: url(<c:url value="/resources/images/invalid.png" />);
  background-position: right top;
  background-repeat: no-repeat;
}
input:required:valid {
  background-image: url(<c:url value="/resources/images/valid.png" />);
  background-position: right top;
  background-repeat: no-repeat;
}
#footer {
	background-color: #675c47;
	color: #efe5d0;
	text-align: center;
	padding: 15px;
	margin: 10px;
	font-size: 90%;
	clear: left;
}

</style>

<script type="text/javascript">
function startTime(){
		var today=new Date();
		var h=today.getHours();
		var m=today.getMinutes();
		var s=today.getSeconds();
		// add a zero in front of numbers<10
		var timedomain;
		if (h>=12){
			h-=12;
			timedomain="PM";
		}else{
			timedomain="AM";	
		}
		if (h==0)
			h=12;
		if (s<10)
			s="0"+s;
		if (m<10)
			m="0"+m;
		document.getElementById('starttimeDiv').innerHTML = h+":"+m+":"+s+" " +timedomain ;
		t=setTimeout('startTime()',500);
	}
	
	$(document).ready(function(){
		startTime();
	});  
</script>
</head>
<body onload='document.f.j_username.focus();'>

<div id="imageDiv" align="center"><img src="<c:url value="/resources/images/A_J_Imports_Logo.png"/>">

	<h3 align="center">Login with Username and Passwords</h3>
<div align="center" id="starttimeDiv"></div>
	<c:if test="${not empty error}">
		<div class="errorblock">
			Your login attempt was not successful, try again.<br /> Caused :
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
		</div>
	</c:if>

	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>

		<table align="center">
			<tr>
				<td>Username:</td>
				<td><input type='text' name='j_username' value='' required autocomplete="off"/>
				</td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password'  required/>
				</td>
			</tr>
			<tr>
				<td><input name="submit" type="submit" value="submit" /></td>
				<td><input align="middle" name="reset" type="reset" /></td>
			</tr>
		</table>

	</form>
	</div>
	<div id="container">
		<div id="example">
			<img src="<c:url value="/resources/images/slider/new-ribbon.png"/>" width="112" height="112" alt="New Ribbon" id="ribbon">
			<div id="slides">
				<div class="slides_container">
					<div class="slide">
						<img src="<c:url value="/resources/images/slider/slide1.jpg"/>" width="570" height="270" alt="Slide 1">
						<div class="caption" style="bottom:0">
							<p>Water Fall</p>
						</div>
					</div>
					<div class="slide">
						<img src="<c:url value="/resources/images/slider/slide2.jpg"/>" width="570" height="270" alt="Slide 2">
						<div class="caption">
							<p>Spring</p>
						</div>
					</div>
					
					<div class="slide">
						<img src="<c:url value="/resources/images/slider/slide3.jpg"/>" width="570" height="270" alt="Slide 4">
						<div class="caption">
							<p>My Cute Pet Tony</p>
						</div>
					</div>
					<div class="slide">
						<img src="<c:url value="/resources/images/slider/slide4.jpg"/>" width="570" height="270" alt="Slide 5">
						<div class="caption">
							<p>&ldquo;I must go down to the sea again, to the lonely sea and the sky...&rdquo;</p>
						</div>
					</div>
				</div>
				<a href="#" class="prev"><img src="<c:url value="/resources/images/slider/arrow-prev.png"/>" width="24" height="43" alt="Arrow Prev"></a>
				<a href="#" class="next"><img src="<c:url value="/resources/images/slider/arrow-next.png"/>" width="24" height="43" alt="Arrow Next"></a>
 
			</div>
		<img src="<c:url value="/resources/images/slider/example-frame.png"/>" width="739" height="341" alt="Example Frame" id="frame">
		</div>
	</div>
<div id="footer">
 Copyright &copy; 2013 Aj Imports's (Pvt) Ltd. All rights reserved.
</div>
</body>
</html>