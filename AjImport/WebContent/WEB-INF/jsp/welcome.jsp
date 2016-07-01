<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="StyleSheet" href="<c:url value="/resources/css/jquery/jquery-ui.css"/>" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-ui.js"/>"></script>
<script>
  $(document).ready(function() {
    $("#datepicker").datepicker();
  });
</script>
</head>
<body>
<div id="datepicker"></div>
	<div align="center">
		<h1>Hi '${username}' Welcome to Aj Import Web Application.....</h1>
	</div>
</body>
</html>