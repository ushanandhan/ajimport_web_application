/**
 * 
 */

var app = angular.module("productionRegistration",['ngGrid','ui.bootstrap']);

/*app.config(function ($httpProvider) {
	  $httpProvider.responseInterceptors.push('myHttpInterceptor');

	  var spinnerFunction = function spinnerFunction(data, headersGetter) {
		$("#loaderDiv").show();
		return data;
	  };

	  $httpProvider.defaults.transformRequest.push(spinnerFunction);
	});

	app.factory('myHttpInterceptor', function ($q, $window) {
	  return function (promise) {
		return promise.then(function (response) {
			$("#loaderDiv").hide();
		  return response;
		}, function (response) {
			$("#loaderDiv").hide();
		  return $q.reject(response);
		});
	  };
	});*/

app.controller("productionRegisCtrl",function($scope,$rootScope,$http,$log,$location,$window){
	
	$scope.sortColumn = "date";
	$scope.reverseSort = false;
	$scope.product={};
	$scope.products=[];
	
	$scope.getAllProducts = function(){
		
		var responsePromise = $http.get("productRegistration/getAllProducts");
		
		responsePromise.success(function(data, status, headers, config) {
			$scope.products =data;
			$log.info('[ERGC] Datas retrived '+angular.toJson($scope.products));
		});
		
		responsePromise.error(function(data, status, headers, config) {
			alert( "Exception details: " + JSON.stringify({data: data}));
		});
	}
	
	
	$scope.gridOptions = { 
			data: 'products', 
			columnDefs: [
              	{field: "productId", displayName: "ID"},
              	{field: "date", displayName: "Date",cellFilter: "date:'dd-MM-yyyy'"},
              	{field: "productName", displayName: "Product Description",width:"200px"},
              	{field: "productQuantity", displayName: "Product Quantity"},
              	{field: "productPrice", displayName: "Price"}
              ] ,
              multiSelect: false,
              enableColumnResize: true
	};
	
	$scope.addProduct = function(){
		
		var responsePromise = $http.post("productRegistration/addProduct" , $scope.product);
		
		responsePromise.success(function(data, status, headers, config) {
			$log.info('[ERGC]  Created successfully');
			/*$scope.products=[];
			$scope.products = data;*/
			$scope.gridOptions = { data: 'data' };
			$log.info('[ERGC] Datas retrived '+angular.toJson($scope.products));
			$scope.clear();
		});
		
		responsePromise.error(function(data, status, headers, config) {
			alert( "Exception details: " + JSON.stringify({data: data}));
		});
	}
	
	$scope.sortData = function(column){
		$scope.reverseSort = ($scope.sortColumn == column)?!$scope.reverseSort:false;
		$scope.sortColumn == column
	}
	
	$scope.getSortClass = function(column){
		if($scope.sortColumn == column){
			return $scope.reverseSort ? "arrow-down":"arrow-up";
		}
		return '';
	}
	
	$scope.clear = function(){
		$scope.product="";
	}
	
//	Fetch all the products from backend
	$scope.getAllProducts();
});