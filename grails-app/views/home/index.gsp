<!DOCTYPE html>
	<!-- includes map javascript functions. -->
	<g:javascript src="maps.js" />
	<!-- para que sirvan los botones desplegables y otras funcinalidades-->
 	<g:javascript src="jquery-1.11.1.min.js"/> 
 	<g:javascript src="bootstrap.min.js"/>
 	<g:javascript src="bootstrap-datepicker.js"/>
 	
 	

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    	<link rel="stylesheet" href="${resource(dir:'css',file:'home_index.css')}" />
    	<link rel="stylesheet" type="text/css" href="${resource(dir:'bootstrap/css', file:'style.css')}" />
    	<link rel="stylesheet" type="text/css" href="${resource(dir:'bootstrap/css', file:'datepicker.css')}" />
    	<link rel="stylesheet" href="${resource(dir:'bootstrap/font-awesome/css', file:'font-awesome.min.css')}" /><!-- para que no se pixeleen los iconos -->
	    
	    <title>Casualty</title>
	    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-144-precomposed.png')}" /><!-- para las imagenes iconos -->
  		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-114-precomposed.png')}"/>
  		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-72-precomposed.png')}" />
  		<link rel="apple-touch-icon-precomposed" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-57-precomposed.png')}"/>
  		<link rel="shortcut icon" href="${resource(dir:'bootstrap/ico', file:'favicon.png')}"/>
	    
	    <!-- Housekeeping before insert the map div -->
	    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	    
	    
	    
	    <!-- Call to google maps api -->
	    <script type="text/javascript"
	      src="http://maps.googleapis.com/maps/api/js?key=AIzaSyC5hrTO3Yea1wH40Oolq1YQCzSjPdZYedI&sensor=false">
	    </script>

	    
	    <style>
			.datepicker{z-index:1151;}
		</style>
	    
	    <!-- Para que sirva el el autocompletar -->
		<resource:include components="autoComplete" autoComplete="[skin: 'default']"/>
	    
	    
	</head>
	

<!-- when the load is done initialize the map. -->
<body onload="initialize(${events},'${username}')" >

<!-- inicio menu -->
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="#">Causality</a>
          <ul class="nav">
          	  <li class="divider-vertical"></li>
              <li>
              <g:form class="navbar-form">
              	 <richui:autoComplete name="event" action="${createLinkTo('dir': 'home/searchAJAX')}" style="width:500px;height:20px"/>
 				<!--  <input type="search" class="search-query" placeholder="Buscar"><!--puntas redondeadas-->
           	  </g:form>
              </li>
          </ul>
          <div class="nav-collapse collapse pull-right">
            <ul class="nav">
			  <li class="divider-vertical"></li>
              <li class="active"><a href="#">Eventos</a></li>
              
              
             <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grupos<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Grupos</li>
					<li><a href="#mylook" data-toggle="modal">Buscar</a></li>         
                  <li><a href="groups">Mis Grupos</a></li>                  
                </ul>
              </li>
              
              
              <li><a href="#contact">Contacto</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${username}<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href = "${createLink(controller:'auth', action:'signOut')}" >Cerrar sesión</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Perfil</li>
                  <li><a href="profile">Mi Perfil</a></li>
                  <li><a href="#">Configuración</a></li>                  
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
  	</div>
</div>

		
			<!-- create the modal-->
				<div id="myModal" class="modal hide fade">
						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal">salir</button>
							
							<h4 class="text-center">Agregar Evento</h4>
							<div class="row-fluid">
								

								<div class="span12">
									
									<label for="">Nombre del evento</label>
									<input type="text" id = "nombre_evento"><br>
									<label for="">Fecha de inicio</label>

									<input type="date" id="date2"><br>
									
									<label for="">Hora Inicial</label>
									<input type="time" id="start_hour"><br>
									<br>
									<label for="">Fecha de finalización</label>
									<input type="date" id="date"><br>
									<br>
									<label for="">Hora Final</label>
									<input type="time" id="end_hour"><br>
									<label for="">Descripción</label>
									<input type="text" id="descripcion"><br>
									<label for="">Etiquetas</label>
									<input type="text" id="tags"><br>
									<!--
									<label for="">Creado por (?)</label>
									<input type="text"><br> -->

								</div>

								
							</div>


						</div>
					
						<div class="modal-footer"> 
							<button type="button" class ="btn" data-dismiss="modal" >Cerrar</button>
							<button type="button" class ="btn btn-primary" onclick="buildNewEventInMap()" >Guardar</button>
						</div>
					</div>
			<!--end create the modal-->
			
			
<!-- create the modal to look up-->
	  
	   <div id="mylook" class="modal hide fade">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h3>Iniciar Busqueda</h3>
				</div>
				<div class="modal-body">
				    <div class="row-fluid">
				       <div class="span12">
				   	      
					   
					    <form action="">
      					<div class="input-append input-prepend">
      					<label for="">Nombre del Grupo</label>
        			    <input type="text" id = "nombre_grupo">
        			    <span class="add-on">@</span>
       					</div>
       					<br>
					      
					      
					   </div>
					</div>	
					
				</div>
				<div class="modal-footer">
					<button tyoe="button" data-dismiss="modal" class="btn">Close</button>
					<button tyoe="button" class="btn btn-primary">Send</button>
				</div>
			</div>

<!--end create the modal-->




<!-- fin menu -->


			


			<!-- actually loads the map -->
			
			<div id="map_canvas"></div> 
	<div class="pagination pagination-large pagination-centered">
		<div class="well">
			<div class="container">
			     <!-- inicio footer -->
			      <footer>
			      	<div class="row-fluid">
			      		<div class="span12">&nbsp;</div>
			      		<div class="span12">
			        		<p class="pull-right"><a href="#">Back to top</a></p>
			        		<p>&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
			       		 </div>
			       		 <div class="span12">&nbsp;</div>
			        </div>
			      </footer>
				 <!-- fin footer -->
			</div>
		</div>
	</div>
	
	<!-- fin actually loads the map -->
	
	
	
	<script>
		$().ready(function(){
			// me sirve para que sirvan los date
			//jQuery('#date').datepicker();	

			$("#date").on("click",function(e){
				$('#date').datepicker();
					//$(".dp3").("show");
					//$('#datepicker').datepicker();
					e.preventDefault();
					//jQuery('#date').datepicker();
					//$('#datepicker').datepicker();
					$('#date').datepicker();
					

					console.log("hola");	
				});	


			$("#date2").on("click",function(e){
					//$(".dp3").("show");
					//$('#datepicker').datepicker();
					e.preventDefault();
					//jQuery('#date').datepicker();
					//$('#datepicker').datepicker();
					$('#date2').datepicker();
					console.log("hola");	
				});	
		});


	</script>
		
</body>
</html>