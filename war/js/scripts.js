
$(document).ready(function(){/* google maps -----------------------------------------------------*/
google.maps.event.addDomListener(window, 'load', initialize);

var map;
var latlng2 = new google.maps.LatLng(46.200013,6.149985);
var marker = new google.maps.Marker({
    position: latlng2,
    animation: google.maps.Animation.DROP
  });

var infowindow = new google.maps.InfoWindow({ content: 'Location info:<br/>Country Name:<br/>LatLng:'});

function initialize() {

  /* position Amsterdam */
  

  var mapOptions = {
    center: latlng2,
    scrollWheel: false,
    zoom: 13
  };
  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  
 
  google.maps.event.addListener(map, 'click', function(event) {
      placeMarker(event.latLng);
  });
  google.maps.event.addListener(marker, 'click', function(event) {
	  infowindow.open(map, marker);
  });
  
  
};

function placeMarker(location) {
	marker.setPosition(location)

	 marker.setMap(map);
	 
   dropInfo(location);
    
   map.setCenter(location);
}

function dropInfo(location){
	
	 $("#longitude").val(location.lng());  
	    $("#latitude").val(location.lat());
	    var geocoder = new google.maps.Geocoder();
	    geocoder.geocode( 
	    		{ 'latLng': location
	    			}, function(results, status) {
	        if (status == google.maps.GeocoderStatus.OK) {
	        	
	        	//alert("resultat: " + results[0].formatted_address);
	        	
	            $("#address").val(results[0].formatted_address);
	        } else {
	            alert("Geocode was not successful for the following reason: " + status);
	        }
	    });
	
}

/* end google maps -----------------------------------------------------*/
});