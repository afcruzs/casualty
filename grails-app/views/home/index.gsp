
<!DOCTYPE html>
<!-- includes map javascript functions. -->

<g:javascript src="maps.js" />

<html>
	<head>
		

		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    	<link rel="stylesheet" href="${resource(dir:'css',file:'home_index.css')}" />
	
	
	    <title>Casualty</title>
	    
	    <!-- Housekeeping before insert the map div -->
	    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	    
	    
	    
	    <!-- Call to google maps api -->
	    <script type="text/javascript"
	      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC5hrTO3Yea1wH40Oolq1YQCzSjPdZYedI&sensor=false">
	    </script>
	    
	</head>
	

	<!-- when the load is done initialize the map. -->
	<body onload="initialize(${params.events})" >
		<input id="clickMe" type="button" value="AÑADIR MARKER TEST!" onclick="loadMarkerTest();" />
		
		
		<!-- actually loads the map -->
		<div id="map_canvas"></div> 
		
		
	</body>
</html>