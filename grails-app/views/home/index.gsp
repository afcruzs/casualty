
<!DOCTYPE html>
<!-- includes map javascript functions. -->

<g:javascript src="maps.js" />

<html>
	<head>
		
		<!-- [Flat UI] Loading Bootstrap -->
	
		<link rel="stylesheet" href="${resource(dir:'flat-ui/bootstrap/css',file:'bootstrap.css')}" />
		<link rel="stylesheet" href="${resource(dir:'flat-ui/bootstrap/css',file:'prettify.css')}" />
		
		<!-- [Flat UI] Loading Flat UI -->
		
		<link rel="stylesheet" href="${resource(dir:'flat-ui/css',file:'flat-ui.css')}" />
		<link rel="stylesheet" href="${resource(dir:'flat-ui/css',file:'docs.css')}" />
		
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
		
		<!-- lods user name from the params passed by the controller -->
		<h2>Bienvenido ${username}.</h2>
		
		<!-- Navigation bar -->
		<nav class="navbar navbar-inverse navbar-embossed" role="navigation">
		  <div class="navbar-header">
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-01">
		      <span class="sr-only">Toggle navigation</span>
		    </button>
		    <a class="navbar-brand" href="#">Casualty App</a>
		  </div>
		  <div class="collapse navbar-collapse" id="navbar-collapse-01">
		    <ul class="nav navbar-nav">           
	
		    </ul>           
		    <form class="navbar-form navbar-left" action="#" role="search">
		      <div class="form-group">
		        <div class="input-group">
		          <input class="form-control" id="navbarInput-01" type="search" placeholder="Buscar Evento">
		          <span class="input-group-btn">
		            <button type="submit" class="btn"><span class="fui-search"></span></button>
		          </span>            
		        </div>
		      </div>               
		    </form>
		    
		    <ul class="nav navbar-nav">     
		    
		    <!-- buttons -->
		      <li ><a href="#">Crear Evento</a></li>      
		      <li><a href="#">Sus Eventos</a></li>
		      <li><a href="#">Ahora Mismo</a></li>
		      <li><a href="#">Recomendados</a></li>
		      <li><a href="#">Grupos</a></li>
		      <li class="active"><a href=/CausalityAppProject/auth/signOut>Cerrar sesion</a></li>
		    </ul>
		    
		  </div><!-- /.navbar-collapse -->
		</nav><!-- /navbar -->
		
		<!-- actually loads the map -->
		<div id="map_canvas"></div> 
		
		
	</body>
</html>