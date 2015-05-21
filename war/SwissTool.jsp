<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<meta charset="utf-8">
		<title>Swiss Tool</title>
		<meta name="generator" content="Bootply" />
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<!--[if lt IE 9]>
			<script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->
		<link href="css/styles.css" rel="stylesheet">
      
        	<script type="text/javascript" src="js/qrcode.min.js"></script>
      	 	<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
			<script src="js/scripts.js"></script>
        	
	</head>
	<body > 
<!-- begin template -->
<div class="navbar navbar-custom navbar-fixed-top">
 <div class="navbar-header"><a class="navbar-brand" href="#">Geneva Toolbox</a>
      <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
    </div>
    <!-- Navigation bar -->
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a id="btnTax" href="#">Taxi</a></li>
        <li><a id="btnPol" href="#">Postes de Police</a></li>
        <li><a id="btnPha" href="#">Pharmacies</a></li>
        <li><a id="btnHop" href="#">Hopitaux & Cliniques</a></li>
        <li><a id="btnPos" href="#">Bureaux de Poste</a></li>
        <li><a id="btnMus" href="#">Musées</a></li>
        <li>&nbsp;</li>
      </ul>
    </div>
</div>
<!-- Map block -->
<div id="map-canvas" style="z-index: 1;"></div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
     <form id="createForm" action="/new" method="post" accept-charset="utf-8">
            <table id="tResult" style="display:table-block">
            	<tr>
            		<td>Description</td>
            		<td><textarea rows="1" cols="40" name="description0"  id="description"></textarea></td>
            	</tr>
                <tr id="row0"  style="display:none;">
                    
              		 <td>Latitude</td>
                    <td><input disabled type="text" name="latitude0" id="latitude" size="66" /></td>
                </tr>
                <tr style="display:none;">
                 <td>Longitude</td>
                    <td><input disabled type="text" name="longitude0" id="longitude" size="66" /></td>
                    </tr>
                    <tr>
               <td>Address</td>
                    <td><input disabled type="text" name="address0" id="address" size="40" /></td>
                    </tr>
                    <tr style="display:none;">
                <td>QrID</td>
                    <td><input disabled type="text" name="address0" id="idqrcode" size="66" /></td>
                    </tr>
                    
               
            </table><br/><br/>
            <!--  <input type="submit" value="Save"/> -->
        </form>
      
	<button id="button">Store Location</button>
		<div id="qrcode"></div>
		<script type="text/javascript">
		/**
		 * Generate a random String id
		 * @return String
		 * source : http://stackoverflow.com/questions/1349404/generate-a-string-of-5-random-characters-in-javascript
		 */
		function makeId()
		{
			//Ininitalise returned variable 
		    var text = "";
		    //Character set
		    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			//Add 180 character sequencely 
		    for( var i=0; i < 180; i++ ){
		    	//pick a random charactere from the set
		        text+= possible.charAt(Math.floor(Math.random() * possible.length));}
				//add date to id
		    	text+= Math.floor(Date.now() / 1000);

		    $("#idqrcode").val(text);
		    
		    return text;
		}
		//Creates Id and display corresponding qrCode in div#qrcode
		var resultId = makeId();
		new QRCode(document.getElementById("qrcode"), resultId);
		</script>

           

    </div>
    <div class="col-xs-4"><!--map-canvas will be postioned here--></div>
    
  </div>
</div>
<!-- end template -->

	<!-- script references -->
	
	
		
	</body>
</html>