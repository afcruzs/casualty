
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
    <style type="text/css">
      html { height: 100% }
      body { height: 100%; margin: 0; padding: 0 }
      #map_canvas { height: 100% }
    </style>
    <!-- Call to google maps api -->
    <script type="text/javascript"
      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC5hrTO3Yea1wH40Oolq1YQCzSjPdZYedI&sensor=false">
    </script>
    
</head>
	<!-- when the load is done initialize the map. -->
	<body onload="initialize()" >
		<!-- Puts the div map with full screen.-->
		<h1>Welcome to CasualtyApp</h1>
		<div id="map_canvas" style="width:100%; height:100%"></div>
		
	</body>
</html>