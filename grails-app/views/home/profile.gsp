
<!DOCTYPE html>
<html>

	<!-- para que sirvan los botones desplegables y otras funcinalidades-->
 	<g:javascript src="jquery-1.11.1.min.js"/> 
 	<g:javascript src="bootstrap.min.js"/>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="${resource(dir:'bootstrap/css', file:'style.css')}" />
  <link rel="stylesheet" href="${resource(dir:'bootstrap/font-awesome/css', file:'font-awesome.min.css')}" /><!-- para que no se pixeleen los iconos -->
  <meta name="viewport" content="width=device-width, initial-escale=1.0" /><!-- para que sirva el responsive en todos los dispositivos -->
  <title>Causality</title>
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-144-precomposed.png')}" /><!-- para las imagenes iconos -->
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-114-precomposed.png')}"/>
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-72-precomposed.png')}" />
  <link rel="apple-touch-icon-precomposed" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-57-precomposed.png')}"/>
  <link rel="shortcut icon" href="${resource(dir:'bootstrap/ico', file:'favicon.png')}"/>
</head>

<body>

<body>
<!-- inicio menu -->
<div class="navbar navbar-fixed-top">
		     <div class="navbar-inner">
		        <div class="container">
		          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		            <span class="icon-bar"></span>
		          </button>
		          <a class="brand" href="#">Causalty</a>
		          <ul class="nav">
		          <li class="divider-vertical"></li>
		          </ul>
		          <div class="nav-collapse collapse pull-right">
		            <ul class="nav">
		              <li>
		              
		              </li>
					  <li class="divider-vertical"></li>
		              <li class="active"><a href="index">Eventos</a></li>
		              <li><a href="#about">Grupos</a></li>
		              <li><a href="#contact">Contacto</a></li>
		              <li class="dropdown">
		                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${username}<b class="caret"></b></a>
		                <ul class="dropdown-menu">
		                  <li><a href = "${createLink(controller:'auth', action:'signOut')}" >Cerrar sesión</a></li>
		                  <li class="divider"></li>
		                  <li class="nav-header">Perfil</li>
		                  <li><a href="myModal">Mi Perfil</a></li>
		                  <li><a href="#">Configuración</a></li>                  
		                </ul>
		              </li>
		            </ul>
		          </div><!--/.nav-collapse -->
		        </div>
		  	</div>
		</div>
		
		<!-- Fin menu -->


<!-- inicio container -->


<body onload="initialize('${user}','${username}')" >

<div class="container">


			<div id="Modal" class="modal hide">
						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal">salir</button>
							
							<h4 class="text-center">Ver eventos</h4>
							<div class="row-fluid">
								

								<div class="span12">
									
									<label for="">Por implementar</label>
								
									

								</div>

								
							</div>


						</div>
					
						<div class="modal-footer"> 
							<button type="button" class ="btn" data-dismiss="modal" > Volver</button>
							
						</div>
			</div>





			<div class="span12">&nbsp;</div>
			<div class="span12">&nbsp;</div>
			<div class="row-fluid">
				<div class="span8">
					<div class="page-header">
						<h4>Información de Perfil</h4>
					</div>
				</div>
			</div>
				
					<div class="row-fluid">
							<div class="span2">
								<ul class="thumbnails">
									 <li class="span12">
									    <a href="#" class="thumbnail">
									    	<r:img  file="fumaton.png" alt=""/>	

									    </a>
									  </li>
								</ul>
								<a href="#"  class="btn btn-success">Cargar Imagen</a> 
							</div>
							<div class="span6">
								<div class="well">
									<form action="">
										
										<label for="">Nombre</label>
										<input type="text" value ='${user.name}' >
										<label for="">Apellidos</label>
										<input type="text" value ='${user.lastName}'>
										<label for="">Email</label>
										<g:form action="" class="form-inline" >
											<input type="text" value ='${user.emailUser}'>
											<!--<span class="add-on">@unal.edu.co</span>-->
										</g:form>
										<hr>
										<a href="#Modal" data-toggle="modal" class="btn btn-success">mis Eventos</a> 
										<hr>
										<label for="">Ubicación</label>
										<input type="text" value ='${user.ubication}'>
										<label for="">Biografia</label>
										<textarea class="form-control" rows="3" >'${user.biography}'</textarea>
										
										<label for="">Nombre de usuario</label>
										<p class="">${username}</p>
										<br>
										<a href="#myModal"  class="btn btn-success">cambio de contraseña</a> 
										


										
									<!-- <a href="#myModal" data-toggle="modal" class="btn">Modal</a> -->
									</form>
									<hr>	
									<br>
									<div class="row-fluid">
										<div class="span9">
										</div>
										<div class="span3">
											<a href="#"  class="btn btn-primary">Guardar Cambios</a> 
										</div>
										

									</div>
								</div>

							
							<div class="span5">
								&nbsp;
							</div>
					</div>
				</div>


		</div>



<!-- Fin container -->


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
	 
	 
</body>

</html>	 


