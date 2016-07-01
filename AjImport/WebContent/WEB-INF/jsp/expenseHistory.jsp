<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html ng-app="expenseHistory">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="StyleSheet" href="<c:url value="/resources/css/jquery/jquery-ui.css"/>" type="text/css" />
<link rel="StyleSheet" href="<c:url value="/resources/css/angular/ng-grid.css"/>" type="text/css" />
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-ui.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/angular.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/ng-grid-2.0.13.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/ng-grid-layout.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/ui-bootstrap-tpls-0.11.0.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/angular.ng-modules.js"/>"></script>	
<script type="text/javascript" src="<c:url value="/resources/js/pages/expenseHistory.js"/>"></script>
<style type="text/css">
.gridStyle {
    border: 1px solid rgb(212,212,212);
    width: 1000px; 
    height: 300px;
}

#loaderDiv {  
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    z-index:1000;
    background-color:grey;
    opacity: .8;
 }

.ajax-loader {
    position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -32px; /* -1 * image width / 2 */
    margin-top: -32px;  /* -1 * image height / 2 */
    display: block;     
}

.selectedItems{
    float: left; 
}
</style>
<script>
  $(document).ready(function() {
    /* $("#fromDate").datepicker();
    $("#toDate").datepicker(); */
    
    $('#generateReport').click(function(e){
		e.preventDefault();
		var fromDate = $('#fromDate').val();
		var toDate = $('#toDate').val();
		
		$.ajax({
			type:"GET",
			url:"/AjImport/expenseHistory/generateReport",
			data:"fromDate="+fromDate+"&toDate="+toDate,
			/*success:function(response){
				
			},*/
			error:function(e){
				alert("Report Failed to Save. Caused due to : "+e);
			}
		});
	});
  });
</script>
</head>
<body><div align="center">
<div ng-controller="expenseHistoryCtrl" ng-cloak>
<%-- <div id="loaderDiv">
    <img src="<c:url value="/resources/images/loading.gif"/>" class="ajax-loader"/>
</div> --%>
	
	<br/><br/>
	<div class="gridStyle" ng-grid="gridOptions"></div>
	<br/><br/>
	<form>
		<fieldset>
			<legend>Date Range :</legend>
			<table>
			<input type="hidden" ng-model="selectedItems[0].productId"/>
			<tr>
				<td>Product Name:</td><td> <input type="text" id="fromDate" ng-model="selectedItems[0].productName"></td>
			</tr>
			<tr>
				<td>Quatity:</td><td> <input type="text" ng-model="selectedItems[0].productQuantity"></td>
			</tr>
			<tr>
				<td>Price:</td><td> <input type="text" ng-model="selectedItems[0].productPrice"></td>
			</tr>
			<tr>
				<td>Date:</td><td> <input type="text" ng-model="selectedItems[0].date"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" id="generateReport" value="Generate Report"/></div></td>
			</tr>
			</table>
		</fieldset>
	</form>
	<br/><br/>
	<h3><a href="/AjImport/expenseHistory/generateReport">Download Excel Document</a></h3>
	</div>
	</div>
	
</body>
</html>
