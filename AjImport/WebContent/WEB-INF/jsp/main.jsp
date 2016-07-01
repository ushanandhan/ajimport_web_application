<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>AJ IMPORT'S (PVT) LTD COLOMBO</title>
<link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel=icon/>
<link href="<c:url value="/resources/images/AjImport1.png"/>" type=image/x-icon rel="shortcut icon"/>
<link rel="StyleSheet" href="<c:url value="/resources/css/dtree.css"/>" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/dtree.js"/>"></script>
<script type="text/javascript">
$(document).ready(function(){
  $('#openAndClose').toggle(
    function(){d.openAll();},
    function(){d.closeAll();}
  );
});
</script>
<style type="text/css">
BODY {
    MARGIN: 0px;
    FONT-SIZE: 12px; 
    FONT-FAMILY: Trebuchet MS ;
    BACKGROUND-COLOR: #ece9d8
}
</style>
</head>
<body>
	<div id="imageDiv"><img src="<c:url value="/resources/images/A_J_Imports_Logo.png"/>"></div>
		<h3>Message : ${message}</h3>
		<h3>Username : ${username}</h3>
	<div class="dtree">
		<p id="openAndClose">|<a href="#">Toggle Between Open and Close</a>|</p>
		<script type="text/javascript">
			d = new dTree('d');
			d.add(0, -1, "AjImport's Application");
			d.add(1, 0, 'Business Applications');
			d.add(2, 1, 'Product Registration', '', '','','/AjImport/resources/images/node.png');
			d.add(3, 1, 'Bill Book', '', '', '', '/AjImport/resources/images/node.png');
			d.add(4,0,'Home Applications');
			d.add(5, 4, 'Expense History');
			d.add(6, 0, 'Administration');
			d.add(7, 6, 'User Registration');
			d.add(8, 0, 'Future Enhancement');
			d.add(9, 8, 'Testing...');
			d.add(10, 0, 'Recycle Bin','','','','/AjImport/resources/images/dtree/trash.gif');
			d.add(9, 0, 'Logout', '<c:url value="/j_spring_security_logout" />', '', '','/AjImport/resources/images/dtree/Logout-icon.png');
			document.write(d);
		</script>
	</div>
</body>
</html>