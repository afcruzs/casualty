
<!DOCTYPE html>
<html>

<!-- para que sirvan los botones desplegables y otras funcinalidades-->
<g:javascript src="jquery-1.11.1.min.js" />
<g:javascript src="bootstrap.min.js" />

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" type="text/css"
	href="${resource(dir:'bootstrap/css', file:'style.css')}" />
<link rel="stylesheet"
	href="${resource(dir:'bootstrap/font-awesome/css', file:'font-awesome.min.css')}" />
<!-- para que no se pixeleen los iconos -->
<meta name="viewport" content="width=device-width, initial-escale=1.0" />
<!-- para que sirva el responsive en todos los dispositivos -->
<title>Causality</title>
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-144-precomposed.png')}" />
<!-- para las imagenes iconos -->
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-114-precomposed.png')}" />
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-72-precomposed.png')}" />
<link rel="apple-touch-icon-precomposed"
	href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-57-precomposed.png')}" />
<link rel="shortcut icon"
	href="${resource(dir:'bootstrap/ico', file:'favicon.png')}" />
	
	 <!-- Para que sirva el el autocompletar -->
		<resource:include components="autoComplete" autoComplete="[skin: 'custom']"/>
	
</head>

<body>
<body>
	<!-- inicio menu -->
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="brand" href="index">Causality</a>
				<ul class="nav">
					<li class="divider-vertical"></li>
				</ul>
				<div class="nav-collapse collapse pull-right">
					<ul class="nav">
						<li></li>
						<li class="divider-vertical"></li>
						<li class="active"><a href="index">Eventos</a></li>
						
			<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grupos<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Grupos</li>
					<li><a href="#mylook" data-toggle="modal">Buscar</a></li>         
                  <li><a href="groups">Mis Grupos</a></li>                  
                </ul>
              </li>
		
						<li class="inactive"><a href="contact">Contacto</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> ${username}<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a
									href="${createLink(controller:'auth', action:'signOut')}">Cerrar
										sesión</a></li>
								<li class="divider"></li>
								<li class="nav-header">Perfil</li>
								<li><a href="profile">Mi Perfil</a></li>
								<li><a href="#">Configuración</a></li>
							</ul></li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>

	<!-- Fin menu -->
<!-- create the modal to look up-->
				  
				   <div id="mylook" class="modal hide fade">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3>Iniciar Busqueda</h3>
							</div>
							<div class="modal-body">
							
							
								
				              <g:form class="navbar-form">
								<richui:autoComplete name="group" 
								action="${createLinkTo('dir': 'home/lookAJAX')}"
								onItemSelect="document.location.href = '${createLinkTo(dir: 'home/publicGroupProxy')}?id=' + id;" />
				           	  </g:form>

							  <!--Machete-->							              
							  <br>
							  <br>
							  <br>
							  <br>
							
						</div>
					</div>
			
			<!--end create the modal-->

	<!-- inicio container -->
<body>

	
		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>
		
		

		<div class="row-fluid">
			<div class="span2">
			</div>
		<g:form id = "form1" enctype="multipart/form-data">
			<div class="span2">
				<ul class="thumbnails">
						<!--  <img width="100%" height="100%" alt="img" src="http://localhost:8080/CausalityAppProject/home/showImage/">-->
							<g:if test="${group?.screenshot}">					
								<g:link action ='groups'>
								  <img width="100%" height="100%" alt="img"  src="${createLink(controller:'home', action:'showImageGroupModify')}/${group.nameGroup}">
								</g:link>
							</g:if>	
							<g:else>
								<r:img file="fotoVacia.jpg" alt="" />
							</g:else>							
								
								
											
				</ul>
				<input type="hidden" name="idGroup" id="idGroup" value="${group.id}" />
				<div class="span12">&nbsp;</div>
				<input type="file" id="screenshot" name="screenshot"
						style="display: none"> 
						<a class="btn btn-success" onclick="$('input[id=screenshot]').click();"><i class="fa fa-arrow-up"></i>
							Cargar imagen
						</a>
					<div class="span12">&nbsp;</div>
					<input type="submit" class="btn btn-primary" id="save" name="save"
						value="ver Imagen"
						onclick="this.form.action = 'modifyImage'" />	
				
			</div>
			
			<div class="span4">
			
					
							
				<div class="well">
					
						<label for="">Nombre</label>
						<input type="text" name="nameGroup" id="nameGroup" value ='${group.nameGroup}' >
		
		                <label for="">Descripción</label>
						<textarea class="form-control" name="descripcionGroup" id="descripcionGroup" rows="7">${group.description}</textarea>
						<div class="span12">&nbsp;</div>
						<div class="row-fluid">
							<div class="span1"></div>
							<div class="span3">
								<input type="submit" class="btn btn-primary"
									value="Guardar Cambios"
									onclick="this.form.action = 'modifyImage'" />
									<div class="span12">&nbsp;</div>
									<input type="submit" class="btn btn-warning"
									value="Eliminar Grupo"
									onclick="this.form.action = 'deleteGroup'" />
								<!--  <a href="#"  class="btn btn-primary" onclick = "this.form.action = 'updateProfile'">Guardar Cambios</a> -->
							</div>
						
						</div>
						</div>


						</div>
					</g:form>
				</div>

	<!-- Fin container -->


	<!-- inicio footer -->
	<footer>
	<div class="container">
		<div class="row-fluid">
			<div class="span12">&nbsp;</div>

			<div class="span12">
				<p class="pull-right">
					<a href="#">Back to top</a>
				</p>
				<p>
					&copy; 2014 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
					<a href="#">Terms</a>
				</p>
			</div>
			<div class="span12">&nbsp;</div>

		</div>
		</div>
	</footer>
	<!-- fin footer -->


</body>

<script>
	$().ready(function() {
		$("a").tooltip({
			placement : "right",

		});

	})
</script>
</html>


