
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
				<a class="brand" href="index">Causality</a>
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


		<div id="Modal" class="modal hide">
			<div class="modal-header">

				<button type="button" class="close" data-dismiss="modal">salir</button>

				<h4 class="text-center">Cambio de contraseña</h4>
				<div class="row-fluid">


					<div class="span12">

						<label for="">contraseña anterior</label>
						<input type="text" name="vieja" >
						<label for="">nueva contraseña</label>
						<input type="text" name="nueva" >


					</div>


				</div>


			</div>

			<div class="modal-footer">
				<button type="button" class="btn" data-dismiss="modal">
					Volver</button>
				<input type="submit" data-dismiss="modal" class="btn btn-primary"
									value="Guardar" onclick="action = 'changePassword'" />				

			</div>
		</div>





		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>
		<div class="row-fluid">
			<div class="span8">
				<div class="page-header">
					<h4>Información de Mis Grupos</h4>
				</div>
			</div>
		</div>

		<div class="row-fluid">
			<div class="span2">
				<ul class="thumbnails">
					<li class="span12"><a href="#" class="thumbnail"> 
					<r:img
								  file="perfilVacior.png" alt="" />
								  		      

					</a></li>
				    <div class="row-fluid">
					    <li class="span6"><a href="#"> 
					    <p class="">${username}</p>
				        </a></li>
				        <li class="span6"><a href="profile"> 
					    <p class="">Editar perfil</p>
				        </a></li>
				     </div>	
				</ul>
			</div>
			
			<div class="span6">
				<div class="well">
					<g:form id = "form1">
						<h4>Crear Grupo</h4>
                        
						<label for="">Nombre</label>
						<input type="text" name="name">
		
		                <label for="">Descripción</label>
						<textarea class="form-control" name="biography" rows="7"></textarea>
		
					
						<div class="row-fluid">
							<div class="span9"></div>
							<div class="span3">
								<input type="submit" class="btn btn-primary"
									value="Crear"
									onclick="this.form.action = 'updateProfile'" />
								<!--  <a href="#"  class="btn btn-primary" onclick = "this.form.action = 'updateProfile'">Guardar Cambios</a> -->
							</div>
						
						
						<hr>


						<div class="accordion" id="main">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a href="#com1" class="accordion-toggle" data-toggle="collapse"
										data-parent="#main">Mis Grupos</a>
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
						
						</div>
					</g:form>
				</div>

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
</script>
</html>


