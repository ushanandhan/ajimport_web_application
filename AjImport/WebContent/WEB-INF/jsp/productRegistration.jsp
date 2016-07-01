<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html ng-app="productionRegistration">
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
<script type="text/javascript" src="<c:url value="/resources/js/pages/productRegistration.js"/>"></script>
<style type="text/css">
.welcomeTabClass{
	min-height: 350px;
}

/* body {
	font-family: Arial;
}

table {
	border-collapse: collapse;
}

td {
	border: 1px solid black;
}

th {
	border: 1px solid black;
	padding: 5px;
	text-align: left;
	cursor: pointer;
} */

.gridStyle {
    border: 1px solid rgb(212,212,212);
    width: 1000px; 
    height: 300px;
}
</style>
<script type="text/javascript">


//$(document).ready(function(){
// For Tabs	
//	$('#myTabs').tabs({fx: {opacity: "toggle",duration:"slow"}});
// For Dialog
//	$( "#successMsg" ).dialog({autoOpen: false,show: "blind",hide: "blind"});	
// To check Login
	/*$('#addProduct').click(function(){
		var productName = $('#productName').val();
		var productQuantity = $('#productQuantity').val();
		var productPricePerEach = $('#productPricePerEach').val();
		
		$.ajax({
			type:"POST",
			url:"/AjImport/productRegistration/add.htm",
			data:"productName="+productName+"&productQuantity="+productQuantity+"&productPricePerEach="+productPricePerEach,
			success:function(response){
				alert(response);
				var jsonObject = eval('(' + response +')');
				setGridData(grid,jsonObject);
				$( "#successMsg" ).dialog("open");
				$('#productName').val('');
				$('#productQuantity').val('');
				$('#productPricePerEach').val('');
			},
			error:function(e){
				alert("Product Failed to Save. Caused due to : "+e);
			}
		});
	});*/

//	To submit form with html5 validtions 
	/* $('#productAdditionFrom').submit(function(e){
		e.preventDefault();
		var productName = $('#productName').val();
		var productQuantity = $('#productQuantity').val();
		var productPricePerEach = $('#productPricePerEach').val();
		
		$.ajax({
			type:"POST",
			url:"/AjImport/productRegistration/add.htm",
			data:"productName="+productName+"&productQuantity="+productQuantity+"&productPricePerEach="+productPricePerEach,
			success:function(response){
				alert(response);
				var jsonObject = eval('(' + response +')');
				setGridData(grid,jsonObject);
				$( "#successMsg" ).dialog("open");
				$('#productName').val('');
				$('#productQuantity').val('');
				$('#productPricePerEach').val('');
			},
			error:function(e){
				alert("Product Failed to Save. Caused due to : "+e);
			}
		});
	}); */

// To Clear Fields
	/* $('#clearField').click(function(){
		$('#productName').val('');
		$('#productQuantity').val('');
		$('#productPricePerEach').val('');
	}); */

//});



</script>
</head>
<body ng-controller="productionRegisCtrl"  ng-cloak>

<%-- <div id="loaderDiv">
    <img src="<c:url value="/resources/images/loading.gif"/>" class="ajax-loader"/>
</div> --%>

<div id="productAddDiv" align="center">
		<h1>Product Addition</h1>

		<input type="text" id="productName" tabindex="1"
			placeholder="Product Name" ng-model="product.productName" /> 
		<input type="text" id="productQuantity" tabindex="2"
			placeholder="Product Quantity" ng-model="product.productQuantity" />
		<input type="text" id="productPricePerEach" tabindex="3"
			placeholder="Product Price" ng-model="product.productPrice" /> 
		<input type="button" value="Add" ng-click="addProduct()" /> 
		<input type="button" value="Clear" ng-click="clear()" /> 
		<br />
		<br />

		<!-- <table class="gridTable">
			<thead>
				<tr>
					<th ng-click="sortData('productId')">Product Id
						<div ng-class="getSortClass('productId')"></div>
					</th>
					<th ng-click="sortData('date')">Date Ordered
						<div ng-class="getSortClass('date')"></div>
					</th>
					<th ng-click="sortData('productName')">Name
						<div ng-class="getSortClass('productName')"></div>
					</th>
					<th ng-click="sortData('productQuantity')">Quantity
						<div ng-class="getSortClass('productQuantity')"></div>
					</th>
					<th ng-click="sortData('productPrice')">Price
						<div ng-class="getSortClass('productPrice')"></div>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr ng-repeat="product in products | orderBy:sortColumn:reverseSort">
					<td>{{product.productId}}</td>
					<td>{{product.date | date:"dd/MM/yyyy"}}</td>
					<td>{{product.productName}}</td>
					<td>{{product.productQuantity}}</td>
					<td>{{product.productPrice | currency:'INR'}}</td>
				</tr>
			</tbody>
		</table> -->
		<div class="gridStyle" ng-grid="gridOptions"></div>
	</div>
	<br/><br/>
</body>
</html>