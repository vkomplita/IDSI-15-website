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
      <form class="navbar-form">
        <div class="form-group" style="display:inline;">
          <div class="input-group">
            <div class="input-group-btn">
              <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-chevron-down"></span></button>
              <ul class="dropdown-menu">
                <li><a href="#">Category 1</a></li>
                <li><a href="#">Category 2</a></li>
                <li><a href="#">Category 3</a></li>
                <li><a href="#">Category 4</a></li>
                <li><a href="#">Category 5</a></li> 
              </ul>
            </div>
            <input type="text" class="form-control" placeholder="What are searching for?">
            <span class="input-group-addon"><span class="glyphicon glyphicon-search"></span> </span>
          </div>
        </div>
      </form>
    </div>
</div>

<div id="map-canvas"></div>
<div class="container-fluid" id="main">
  <div class="row">
  	<div class="col-xs-8" id="left">
    
      <h2></h2>
      
      <!-- item list -->
      <div class="panel panel-default">
        <div class="panel-heading"><a href=""></a></div>
      </div>
     <form id="createForm" action="/new" method="post" accept-charset="utf-8">
            <table id="tResult" style="display:table-block">
            	<th>
            		<td>Description</td><td>Latitude</td> <td>Longitude</td><td>Address</td><td>QrID</td>
            		
            	</th>
                <tr id="row0">
                    
                    <td><textarea rows="1" cols="20" name="description0"  id="description0"></textarea></td>
               
                    <td><input disabled type="text" name="latitude0" id="latitude0" size="66" /></td>
                
                    <td><input disabled type="text" name="longitude0" id="longitude0" size="66" /></td>
               
                    <td><input disabled type="text" name="address0" id="address0" size="66" /></td>
                
                    <td><input disabled type="text" name="address0" id="idqrcode0" size="66" /></td>
                </tr>
            </table><br/><br/>
            <!--  <input type="submit" value="Save"/> -->
        </form>
      
     
      <hr>
      <!-- /item list -->
      
      <p>
      <!--  <div id="idqrcode"></div> -->
  		<div id="qrcode"></div>
		<script type="text/javascript">
		
		function makeId()
		{
		    var text = "";
		    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

		    for( var i=0; i < 180; i++ )
		        text += possible.charAt(Math.floor(Math.random() * possible.length));

		    text+= Math.floor(Date.now() / 1000);

		    
		    
		    $("#idqrcode").val(text);
		    
		    return text;
		}
		var resultId = makeId();
		new QRCode(document.getElementById("qrcode"), resultId);
		</script>
      </p>
           

    </div>
    <div class="col-xs-4"><!--map-canvas will be postioned here--></div>
    
  </div>
</div>
<!-- end template -->

	<!-- script references -->
	
	
		
	</body>
</html>