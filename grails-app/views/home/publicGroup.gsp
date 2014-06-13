
<!DOCTYPE html>
<html>

<!-- para que sirvan los botones desplegables y otras funcinalidades-->
<g:javascript src="jquery-1.11.1.min.js" />
<g:javascript src="bootstrap.min.js" />
<g:javascript src="groups.js" />

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
<resource:include components="autoComplete"
	autoComplete="[skin: 'custom']" />

</head>


<body>

	<!-- Create a custom alert for when the event has been deleted-->
	<div id="ustedesAdminAlert" class="modal hide fade">
		<div id="customAlert" class="donatoAlert donatoAlert-error">
			<h4>Oops!!!</h4>
			Usted es el Administrador, no puede abandonar el grupo... intente
			eliminarlo.
		</div>
	</div>
	<!-- end creating cutos alert -->

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

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown">Grupos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li class="divider"></li>
								<li class="nav-header">Grupos</li>
								<li><a href="#mylook" data-toggle="modal">Buscar</a></li>
								<li><a href="groups">Mis Grupos</a></li>
							</ul></li>

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
	<!-- create the modal to look up-->

	<div id="mylook" class="modal hide fade">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h3>Iniciar Busqueda</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span12">




					<ul class="nav">
						<li class="divider-vertical"></li>
						<li><g:form class="navbar-form">
								<richui:autoComplete name="group"
									action="${createLinkTo('dir': 'home/lookAJAX')}"
									onItemSelect="goToLocation(id)" />
							</g:form></li>
					</ul>


				</div>
			</div>

		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn">Close</button>
			<button type="button" class="btn btn-primary">Send</button>
		</div>
	</div>

	<!--end create the modal-->

	<!-- inicio container -->
<body>


	<div class="span12">&nbsp;</div>
	<div class="span12">&nbsp;</div>



	<div class="row-fluid">
		<div class="span2"></div>
		<g:form id="form1" enctype="multipart/form-data">
			<div class="span2">
				<ul class="thumbnails">
					<!--  <img width="100%" height="100%" alt="img" src="http://localhost:8080/CausalityAppProject/home/showImage/">-->
					<g:if test="${group?.screenshot}">
						<g:link action='groups'>
							<img width="100%" height="100%" alt="img"
								src="${createLink(controller:'home', action:'showImageGroupModify')}/${group.nameGroup}">
						</g:link>
					</g:if>
					<g:else>
						<r:img file="fotoVacia.jpg" alt="" />
					</g:else>



				</ul>

			</div>

			<div class="span4">
				<div class="well">

					<label for=""><h3>Nombre</h3></label>
					<p class=form-control-static>
						${group.nameGroup}
					</p>
					<label for=""><h3>Descripción</h3></label>
					<div class="well">
						<p>
							${group.description}
						</p>
					</div>
					
					
					
					<div class="accordion" id="main">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#com1" class="accordion-toggle" data-toggle="collapse"
										data-parent="#main">Eventos</a>
								</div>

								<div id="com1" class="accordion-body collapse">
									<div class="accordion-inner">

										<div class="accordion" id="main2">
											<div class="accordion-group">

												<script>
												var veces=0;
												var k = "${tam}";
												var cadNames = "${names}"
												var splitNames=cadNames.split("@");
												var cadDesc = "${desc}";
													var splitDesc = cadDesc.split("@");

													while (veces < k) {

														document
																.write("<div class='accordion-heading'>");
														document
																.write("<a href='#"+veces+"'class='accordion-toggle' data-toggle='collapse' data-parent='#main2'>"
																		+ splitNames[veces]
																		+ "</a>");
														document
																.write("</div>");
														document
																.write("<div id='"+veces+"'class='accordion-body collapse'>");
														document
																.write("<div class='accordion-inner'>"
																		+ splitDesc[veces]
																		+ "</div>");
														document
																.write("</div>");
														veces++;
													}
												</script>

											</div>

										</div>


									</div>
								</div>
							</div>
						</div>
						
						
						
						
						<div class="accordion" id="main2">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#com2" class="accordion-toggle" data-toggle="collapse"
										data-parent="#main">Miembros del Grupo</a>
								</div>

								<div id="com2" class="accordion-body collapse">
									<div class="accordion-inner">

										<div class="accordion" id="main2">
											<div class="accordion-group">

												<script>
												var veces=0;
												var k = "${tamUser}";
												var cadNames = "${nameUser}";
												var splitNames=cadNames.split("@");
											
													
												document.write("<ul class='nav nav-list well'>");
												while (veces<k){	
													document.write("<li>")
													document.write("<a href='publicProfile?username="+splitNames[veces]+"'>"+splitNames[veces]+"</a>")
													document.write("</li>")
													
													veces++;
												}
												document.write("</ul>");
												
											</script>

											</div>

										</div>


									</div>
								</div>
							</div>
						</div>
					
					
					
					
					<g:if test="${inGroup == true}">
						<button id="joinBtn" onclick="leaveGroup('${group.nameGroup}')"
							class="btn btn-warning">Abandonar Grupo</button>
					</g:if>
					<g:else>
						<button id="joinBtn2" onclick="joinToGroup('${group.nameGroup}')"
							class="btn btn-info">Unirse a Grupo</button>
					</g:else>

					<hr>
				</div>


			</div>




		</g:form>
	</div>

	<!-- Fin container -->


	





</body>

</html>


