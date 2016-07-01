/**
 * 
 */

var app = angular.module("expenseHistory",['ngGrid','ui.bootstrap']);


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

app.controller("expenseHistoryCtrl",function($scope,$rootScope,$http,$log,$location,$window){
	
	$scope.expenseDetail={};
	$scope.expenseDetails=[];
	$scope.selectedItems=[];
	
	$scope.getAllExpenseDetails = function(){
		
		var responsePromise = $http.get("expenseHistory/getAllExpenseDetails");
		
		responsePromise.success(function(data, status, headers, config) {
			$scope.expenseDetails =data;
			$log.info('[ERGC] Datas retrived '+angular.toJson($scope.expenseDetails));
		});
		
		responsePromise.error(function(data, status, headers, config) {
			alert( "Exception details: " + JSON.stringify({data: data}));
		});
	}
	
	$scope.generateReport = function(){
		
		var responsePromise = $http.get("expenseHistory/generateReport");
		
		responsePromise.error(function(data, status, headers, config) {
			alert( "Exception details: " + JSON.stringify({data: data}));
		});
	}
	
	
	$scope.gridOptions = { 
			data: 'expenseDetails', 
			columnDefs: [
              	{field: "productId", displayName: "ID"},
              	{field: "date", displayName: "Date",cellFilter: "date:'dd-MM-yyyy'"},
              	{field: "productName", displayName: "Product Description",width:"200px"},
              	{field: "productQuantity", displayName: "Product Quantity"},
              	{field: "productPrice", displayName: "Price"}
              ] ,
              multiSelect: false,
              selectedItems:$scope.selectedItems,
              enableColumnResize: true
	};
	
	
	
	
//	Fetch all the expense details from backend
	$scope.getAllExpenseDetails();
});