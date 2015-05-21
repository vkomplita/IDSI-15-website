/**
 * Initialize script on document load
 */
$(document).ready(function(){
	//Launch google map with a Dom listener
	google.maps.event.addDomListener(window, 'load', initialize);
	
	//creates url of the actual host
	var kmlBaseUrl = "http://"+window.location.hostname+"/kml/";
	var map;
	//Creates kml layer in google maps where our marker will be displayed
	var kmlLayer = new google.maps.KmlLayer(null);
	//Creates a geolocation of Geneva
	var latlng2 = new google.maps.LatLng(46.200013,6.149985);
	//creates an empty location on the map
	var locKml = new google.maps.LatLng();
	//creates a marker for the marker of Geneva
	var marker = new google.maps.Marker({
	    position: latlng2,
	    animation: google.maps.Animation.DROP
	  });
	
	//Displays marker info
	//var infowindow = new google.maps.InfoWindow({ content: 'Location info:<br/>Country Name:<br/>LatLng:'});
	
	/**
	 * Send data to our Spring application to save current marker position
	 * @param qrCodeId
	 * @param longitude
	 * @param latitude
	 * @param description
	 */
	function poster(){	
		   $("button").click(function(){
		        $.post("http://swisstoolweb.cfapps.io/markers",
		        {
		          qrCodeId: $("#idqrcode").val(),
		          longitude: $("#longitude").val(),
		          latitude: $("#latitude").val(),
		          description: $("#description").val()
		        },
		        function(data,status){
		            alert("Data: " + data + "\nStatus: " + status);
		        });
		   });
	}

	//Launch google map
	function initialize() {
		//initialize the click listener for sending marker to server
		poster();
		//center map over Geneva, disable the scrollwheel, set a zoom value
		var mapOptions = {
				center: latlng2,
				scrollWheel: false,
				zoom: 13
		};
		//Displays the map in its block
		map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
		//Enable clicks on the map to place a marker
		google.maps.event.addListener(map, 'click', function(event) {
			placeMarker(event.latLng);
		});
		
		//google.maps.event.addListener(marker, 'click', function(event) {
		//	infowindow.open(map, marker);
		//});
	  
		//If the element is clicked, load placemarks on the 
		//map from the kml of the selected category
		$('a#btnPol').click(function() { 
			var url =kmlBaseUrl+"police.kml";
			loadKmlLayer(url, map);   
		});
		$('a#btnTax').click(function() { 
			var url =kmlBaseUrl+"taxi.kml";
			loadKmlLayer(url, map);     
		});
		$('a#btnPha').click(function() { 
			var url =kmlBaseUrl+"pharma.kml";
			loadKmlLayer(url, map);   
		});
		$('a#btnHop').click(function() { 
			var url =kmlBaseUrl+"sante.kml";
			loadKmlLayer(url, map);    
		});
		$('a#btnPos').click(function() { 
			var url =kmlBaseUrl+"poste.kml";
			loadKmlLayer(url, map);     
		});
		$('a#btnMus').click(function() { 
			var url =kmlBaseUrl+"culture.kml";
			loadKmlLayer(url, map);    
		});
		$('a.navbar-brand').click(function() {
			marker.setMap(null);
			kmlLayer.setMap(null);
		});
	};
	/**
	 * Load placemarks from kml in parameter to map in parameter
	 * @param src --> kml url
	 * @param map
	 */
	function loadKmlLayer(src, map) {
		kmlLayer.setMap(null);
		
		kmlLayer = new google.maps.KmlLayer(src, {
			suppressInfoWindows: true,
		    preserveViewport: false,
		    map: map
		});
		google.maps.event.addListener(kmlLayer, 'click', function(kmlEvent) {
			locKml = kmlEvent.latLng;
			dropInfo(locKml);
		});
	};
	/**
	 * Create a marker with a given position
	 * @param location 
	 */
	function placeMarker(location) {
		//create the marker for the specified location
		marker.setPosition(location);
		//put marker on the map
		marker.setMap(map);
		//load marker information to input fields
		dropInfo(location);
		//center map above the marker
		map.setCenter(location);
	};
	/**
	 * Drop information extracts from the marker to the inputs fields
	 * @param location 
	 */	
	function dropInfo(location){
		//fill #longitude and #latitude with longitude and latitude extracts from location
		$("#longitude").val(location.lng());  
		$("#latitude").val(location.lat());
		//initialize geocoder for address retrieval
		var geocoder = new google.maps.Geocoder();
		//Request address for specified location, if succeeded fill #address
		geocoder.geocode({ 'latLng': location}, function(results, status) {
			if (status == google.maps.GeocoderStatus.OK) {
				$("#address").val(results[0].formatted_address);
			} else {
		    	alert("Geocode was not successful for the following reason: " + status);
		    }
		});
	};
});