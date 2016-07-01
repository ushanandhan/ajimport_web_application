<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script type="text/javascript"
            src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC1T-2wns9ATUMNjiDpg8B8APLtkzf41u0&sensor=false">
</script>
<script type="text/javascript">
window.onload = function() {
	var mapDiv = document.getElementById('map');
	var latlng = new google.maps.LatLng(6.965442122766578, 79.87026327075205);
	var image = "<c:url value="/resources/images/googleMap/Map_Marker.png"/>";
	
	
//	Creating an object literal containing the properties you want to pass to the map
	var options = {
		center: latlng,
		zoom: 15,
		mapTypeId: google.maps.MapTypeId.ROADMAP,
		scaleControl: true
	};
	
//	Creating the map
	var map = new google.maps.Map(mapDiv, options);
	
//	Adding a marker to the map
	var marker = new google.maps.Marker({
		position: new google.maps.LatLng(6.965173218985779, 79.8698233884736),
		map: map,
		title: 'Address',
		icon:image
	});
	
//	Creating an InfoWindow with the content text: "Address"
	var infowindow = new google.maps.InfoWindow({
		content: "<div style='padding:5px'><h3 style='color:blue'>Aj Import's Pvt Ltd.</h3><br>731/1, Aluth mawatha Rd,<br> Modera.<br> Colombo-15.<br>Srilanka.</div>"
	});
	
// 	Adding a click event to the marker
	google.maps.event.addListener(marker, 'click', function() {
// 		Calling the open method of the infoWindow
		infowindow.open(map, marker);
	});	
	
}
</script>
<style>
#map {
	width: 100%;
	height: 400px;
	border: 1px solid #000;
}
</style>
</head>
<body>
<div id="map"></div>
</body>
</html>