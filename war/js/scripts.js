
$(document).ready(function(){/* google maps -----------------------------------------------------*/
google.maps.event.addDomListener(window, 'load', initialize);


var map;
var srcPol = 'https://www.worldwideconnects.org/test/police.kml';

var kmlLayer = new google.maps.KmlLayer(null);

var latlng2 = new google.maps.LatLng(46.200013,6.149985);
var locKml = new google.maps.LatLng();
var marker = new google.maps.Marker({
    position: latlng2,
    animation: google.maps.Animation.DROP
  });
var infowindow = new google.maps.InfoWindow({ content: 'Location info:<br/>Country Name:<br/>LatLng:'});

function makeId()
{
    var text = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 200; i++ )
        text += possible.charAt(Math.floor(Math.random() * possible.length));

    text+= Math.floor(Date.now() / 1000);

    
    
    $("#idqrcode").val(text);
    
    return text;
}



function initialize() {
 
	
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
  
  
  
  
  $('a#btnPol').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/police.kml";
	  loadKmlLayer(url, map);   
	      });
  $('a#btnTax').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/taxi.kml";
	  loadKmlLayer(url, map);     
	      });
  $('a#btnPha').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/pharma.kml";
	  loadKmlLayer(url, map);   
	      });
  $('a#btnHop').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/sante.kml";
	  loadKmlLayer(url, map);    
	      });
  $('a#btnPos').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/poste.kml";
	  loadKmlLayer(url, map);     
	      });
  $('a#btnMus').click(function() { 
	  var url ="https://www.worldwideconnects.org/test/culture.kml";
	  loadKmlLayer(url, map);    
	      });
  
 
};



function loadKmlLayer(src, map) {
	//alert("kml started");
	
	kmlLayer.setMap(null);
	 kmlLayer = new google.maps.KmlLayer(src, {
	    suppressInfoWindows: true,
	    preserveViewport: false,
	    map: map
	  });
	  google.maps.event.addListener(kmlLayer, 'click', function(kmlEvent) {
		  
		 locKml = kmlEvent.latLng;
		dropInfo(locKml);
		    /*var content = event.featureData.infoWindowHtml;
		    var testimonial = document.getElementById('capture');
		    testimonial.innerHTML = content;*/
		  });
	};


function placeMarker(location) {
	marker.setPosition(location)

	 marker.setMap(map);
	 
   dropInfo(location);
    
   map.setCenter(location);
};

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
	
	    
	    
	    
	    
	    
};

/* end google maps -----------------------------------------------------*/
});