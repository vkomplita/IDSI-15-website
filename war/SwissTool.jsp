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
        
           
        
            
        
	</head>
	<body > 
<!-- begin template -->
<div class="navbar navbar-custom navbar-fixed-top">
 <div class="navbar-header"><a class="navbar-brand" href="#">Brand</a>
      <a class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a id="btnPol" href="#">Police</a></li>
        <li><a href="#">Link</a></li>
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
    
      <h2>Geneva Toolbox</h2>
      
      <!-- item list -->
      <div class="panel panel-default">
        <div class="panel-heading"><a href="">Check and Save</a></div>
      </div>
     <form id="createForm" action="/new" method="post" accept-charset="utf-8">
            <table>
                <tr>
                    <td>Title</td>
                    <td><input type="text" name="title" id="title" size="66"/></td>
                </tr>
                <tr>
                    <td>Description</td>
                    <td><textarea rows="4" cols="50" name="description"    id="description"></textarea>
                </tr>
                <tr>
                    <td>Latitude</td>
                    <td><input type="text" name="latitude" id="latitude" size="66" /></td>
                </tr>
                <tr>
                    <td>Longitude</td>
                    <td><input type="text" name="longitude" id="longitude" size="66" /></td>
                </tr>
                <tr>
                    <td>Address</td>
                    <td><input type="text" name="address" id="address" size="66" /></td>
                </tr>
            </table><br/><br/>
            <input type="submit" value="Save"/>
        </form>
      
     
      <hr>
      <!-- /item list -->
      
      <p>
      <a href="http://www.bootply.com/render/129229">Demo</a> | <a href="http://bootply.com/129229">Source Code</a>
      </p>
      
      <p id="test">
      </p>
           

    </div>
    <div class="col-xs-4"><!--map-canvas will be postioned here--></div>
    
  </div>
</div>
<!-- end template -->

	<!-- script references -->
		<script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="http://maps.googleapis.com/maps/api/js?sensor=false&extension=.js&output=embed"></script>
		<script src="js/scripts.js"></script>
		<script src="js/locImporter.js"></script>
	</body>
</html>