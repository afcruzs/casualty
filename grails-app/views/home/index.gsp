
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
	<body onload="initialize()" >
	<section class = "section">
		<!-- Puts the div map with full screen.-->
		<header>
			<h1>Welcome to CasualtyApp</h1>
		</header>
		<nav>
			Aqui va el menu
		</nav>
		<div id="map_canvas"></div>
	</section>
	</body>
</html>