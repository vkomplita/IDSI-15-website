
$('a#btnPol').click(function() { 
	
var url ="http://ge.ch/ags1/rest/services/Administration/MapServer/5/query?text=ptpol&geometry=&geometryType=esriGeometryPoint&inSR=&spatialRel=esriSpatialRelIntersects&relationParam=&objectIds=&where=&time=&returnCountOnly=false&returnIdsOnly=false&returnGeometry=true&maxAllowableOffset=&outSR=&outFields=ADRESSE&f=pjson";

	
	$.getJSON( url , function( data ) {
		
		  var items = [];
		  $.each( data, function( key, val ) {
		    items.push( "<li id='" + key + "'>" + val + "</li>" );
		  });
		 
		  $( "<ul/>", {
		    "class": "my-new-list",
		    html: items.join( "" )
		  }).appendTo( "p#test" );
		  alert("ca marche");
		});
	
	
         
    });

