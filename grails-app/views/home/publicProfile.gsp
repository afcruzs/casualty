
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
				<a class="brand" href="#">Causalty</a>
				<ul class="nav">
					<li class="divider-vertical"></li>
				</ul>
				<div class="nav-collapse collapse pull-right">
					<ul class="nav">
						<li></li>
						<li class="divider-vertical"></li>
						<li class="active"><a href="index">Eventos</a></li>
						<li><a href="#about">Grupos</a></li>
						<li><a href="#contact">Contacto</a></li>
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


	<!-- inicio container -->
<body
	onload="initialize('${user}','${username}','${ names}','${desc }','${tam}')">




	<div class="container">

		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>
		<div class="row-fluid">
			<div class="span8">
				<div class="page-header">
					<h1>Información del Usuario</h1>
				</div>
			</div>
		</div>

		<div class="row-fluid">
		<g:form id="form1">
			<div class="span2">
				<ul class="thumbnails">
					<li class="span12"><a href="#" class="thumbnail">
							
						<g:if test="${user?.screenshot}" >						
								<g:link action="showImage" id="${user.id}"  >
								  <img width="100%" height="100%" alt="img" src="http://localhost:8080/CausalityAppProject/home/showImage/${user.id} ">
								</g:link>			
						</g:if>
					</a></li>

				</ul>

			</div>
			
			<div class="span6">
				<div class="well">
					

						<label for=""><h3>Nombre</h3></label>
						<p class="form-control-static">${user.name}</p>
						
						<label for=""><h3>Apellido</h3></label>
						<p class="form-control-static">${user.lastName}</p>
						<hr>
						<div class="accordion" id="main">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#com1" class="accordion-toggle" data-toggle="collapse"
										data-parent="#main">Mis Eventos</a>
								</div>
								
								<div id="com1" class="accordion-body collapse">
									<div class="accordion-inner">
										<div class="accordion" id="main2">
											<div class="accordion-group">
												
												<script>
													var veces=0;
													var k = "${tam}";
													var cadNames = "${names}"
													var splitNames=cadNames.split("@")
													var cadDesc = "${desc}"
													var splitDesc = cadDesc.split("@")
													
													while (veces<k){	
																		
														document.write("<div class='accordion-heading'>");
														document.write("<a href='#"+veces+"'class='accordion-toggle' data-toggle='collapse' data-parent='#main2'>"+splitNames[veces]+"</a>");
														document.write("</div>");
														document.write("<div id='"+veces+"'class='accordion-body collapse'>");
														document.write("<div class='accordion-inner'>"+ splitDesc[veces] +"</div>");
														document.write("</div>");
														veces++;
													}
												</script>
											
											</div>
										</div>
									</div>
								</div>
								
							</div>
						</div>

						<hr>

						
						<label for="">ubicacion</label>
						<p class="form-control-static">${user.ubication}</p>
						<hr>
						<label for="">Biografia</label>
						<div class="well">
							<p>${user.biography}</p>
						</div>
						
						<h3>
							Eventos Recientes <br><small> última semana </small>
						</h3>
				</div>




				<div class="span5">&nbsp;</div>
			</div>
		</g:form>
		</div>


	</div>



	<!-- Fin container -->


	<!-- inicio footer -->
	<footer>
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
	</footer>
	<!-- fin footer -->


</body>

<script>
	$().ready(function() {
		$("a").tooltip({
			placement : "right",

		});

	})
	
	$('input[id=screenshot]').change(function() {
		
				

	});
</script>
</html>


