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
  <title>Casualty</title>
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-144-precomposed.png')}" /><!-- para las imagenes iconos -->
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-114-precomposed.png')}"/>
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-72-precomposed.png')}" />
  <link rel="apple-touch-icon-precomposed" href="${resource(dir:'bootstrap/ico', file:'apple-touch-icon-57-precomposed.png')}"/>
  <link rel="shortcut icon" href="${resource(dir:'bootstrap/ico', file:'favicon.png')}"/>
</head>

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
          <a class="brand" href="#">Causality</a>
          <ul class="nav">
          <li class="divider-vertical hidden-desktop"></li>
          </ul>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Inicio</a></li>
              <li><a href="#about">Acerca</a></li>
              <li><a href="#contact">Contacto</a></li>
              <!--<li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li> -->
            </ul>
            <g:form class="navbar-form pull-right">
            	<input type="hidden" name="targetUri" value="${targetUri}" /> <!-- esto nose que hace (esto lo genero el shiro creo) -->
              	<input class="span2" type="text" name="username" placeholder="usuario" value="${username}" />
             	<input class="span2" type="password" name="password" placeholder="contraseña" value="${password}" />
            	<!-- <label>Remember me?:</label> -->
            	<button  type="submit" value="Sign in" onclick = "this.form.action = 'signIn'" class="btn">Iniciar Sesión</button>
            	<g:checkBox class="span1" name="rememberMe" value="${rememberMe}" />
            </g:form>
          </div><!--/.nav-collapse -->
        </div>
  	</div>
</div>
<!-- fin menu -->

		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>
		<div class="span12">&nbsp;</div>

<div class="container">

	<div class="row-fluid">
			<!-- inicio alerta -->
			<div class="span4">&nbsp;</div>
			<div class="span4">
            <g:if test="${flash.message}">
   				 <div class="message text-center">
							<div class="alert alert-error">
								<button tupe="button" class="close" data-dismiss="alert">&times;</button><!--equis para cerrar-->
								<h4>Alert!!!</h4>
								${flash.message}
							</div>
						</div>
  			</g:if>
  			</div>
  			<div class="span4">&nbsp;</div>
  			<!-- fin alerta -->
	</div>

	<!-- inicio slide y well -->
	 	<div class="row-fluid">
 		
		  <div class="span7">
			<div id="myslide" class="carousel slide">
				<!--para colocar los punticos-->
				<ol class="carousel-indicators">
					<li data-target="#myslide" data-slide-to="1" class="active"></li>
					<li data-target="#myslide" data-slide-to="2"></li>
					<li data-target="#myslide" data-slide-to="3"></li>
				</ol>
				<div class="carousel-inner">
					<div class="item active"><!--esta inicialmente-->
						<r:img  file="poker2.png" alt=""/>		
						<div class="carousel-caption">
							<h4>Poker en la casa de Fabian</h4>
							<p>Mesa de Poker en la casa de Fabian, apuesta mínima $5.000. Hay trago, lleven comida.  </p>
						</div>
					</div>
					<div class="item">
						<r:img  file="fumaton.png" alt=""/>	
						<div class="carousel-caption">
							<h4>Fumatón en la playita</h4>
							<p>Vengan a manifestarse contra el imperio paramilitar que se está formando en la universidad, hay crespa, metralla, creepi  y pepas</p>
						</div>
					</div>
					<div class="item">
						<r:img  file="micro.jpg" alt=""/>
						<div class="carousel-caption">
							<h4>Micro en las canchas del Cyt</h4>
							<p>Micro ya en las canchas del CyT, dos equipos (Meluk vs Tito) de 7 cada uno, apuren que ya hay 5</p>
						</div>
					</div>
				</div>
				<a href="#myslide" data-slide="prev" class="carousel-control left">&lsaquo;</a>
				<a href="#myslide" data-slide="next" class="carousel-control right">&rsaquo;</a>
			</div>
			<div class="pager">
				<ul>
					<li class="active"><a href="#" id="pagcero" class="btn-primary">1</a></li>
					<li><a href="#" id="paguno" class="btn-primary">2</a></li>
					<li><a href="#" id="pagdos" class="btn-primary">3</a></li>
				</ul>
			</div>
		</div>
	  	<div class="span5 text-center hero-unit">
			<h1>Causality</h1>
       		 <p>Bienvenido a Casuality™, una herramienta que te permitirá convocar a eventos de tu interes y lo mejor de todo, de forma casual. No importa si no conoces
       		 a nadie que tenga tus mismos gustos, no te preocupes, convoca a un evento y espera, la gente llegará.</p>
        	<p><a href="registeraux" class="btn btn-large btn-success btn-large btn-block">Registrate &raquo;</a></p>
      	</div>	
</div>
	<!-- fin slide y well -->
	<!-- inicio datos de mas -->
	<div class="row-fluid">
        <div class="span4 text-center">
          <r:img class="img-circle" file="marker.png" alt=""/>		
          <h2>Eventos</h2>
          <p>Los markers en los mapas te mostrarán los eventos que estan ocurriendo actualmente, dales click y descubre toda la información que necesitas para poder asistir.</p>
          
          
          <p><a class="btn" href="#">Ver más &raquo;</a></p>
        </div><!-- /.span4 -->
        <div class="span4 text-center">
          <h2 >Grupos</h2>
          <p>Causality te permite tambien crear grupos y añadir usuarios a ellos para así poder publicar eventos a nombre del grupo. Si eres parte de una equipo de futbol, o de
          maratones de programación, o eres miembro de una compañia de teatro esto es para ti, entra y descubre más.</p>
          
          <p><a class="btn" href="#">Ver más &raquo;</a></p>
          <r:img class="img-circle" file="groups.png" alt=""/>	
        </div><!-- /.span4 -->
        <div class="span4 text-center">
          <r:img class="img-circle" file="crono.png" alt=""/>	
          <h2>Aprovecha tu tiempo</h2>
          <p>Si tienes cuatro horas de hueco en el horario y no sabes que hacer : facil, registrate en causality y busca entre los eventos alguno de tu interes, hay para todos los gustos
           en casuality encontrarás eventos de deportes, ocio, estudio y otras "cosas". Qué esperas? entra ya!</p>
          <p><a class="btn" href="#">Ver más &raquo;</a></p>
        </div><!-- /.span4 -->
     </div><!-- /.row -->
	<!-- fin datos de mas -->
	
     <!-- inicio footer -->
      <footer>
      	<div class="row-fluid">
      		<div class="span12">&nbsp;</div>
      		<div class="span12">
        		<p class="pull-right"><a href="#">Volver al inicio</a></p>
        		<p>&copy; 2014 Casuality, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
       		 </div>
       		 <div class="span12">&nbsp;</div>
        </div>
      </footer>
	 <!-- fin footer -->
</div>

<script>

	/*para el slide*/
	$().ready(function(){
		/*$(".carousel").*//*para todos*/
		$("#myslide").carousel({
			interval: 7000, /*tiempo de cambio*/
			pause: "hover", /*se detiene si el usuario pone el mouse dentro*/

		});


		$("#pagcero").on("click",function(e){
			e.preventDefault();
			//$("#myslide").carousel("next");/*la manda al siguiente*/
			//$("#myslide").carousel("prev");/*la manda ala anterior*/
			$("#myslide").carousel(0);/*va a un slide fijo*/
			//$("#myslide").carousel("pause");/*pausa*/
		});
		$("#paguno").on("click",function(e){
			e.preventDefault();
			//$("#myslide").carousel("next");/*la manda al siguiente*/
			//$("#myslide").carousel("prev");/*la manda ala anterior*/
			$("#myslide").carousel(1);/*va a un slide fijo*/
			//$("#myslide").carousel("pause");/*pausa*/
		});
		$("#pagdos").on("click",function(e){
			e.preventDefault();
			//$("#myslide").carousel("next");/*la manda al siguiente*/
			//$("#myslide").carousel("prev");/*la manda ala anterior*/
			$("#myslide").carousel(2);/*va a un slide fijo*/
			//$("#myslide").carousel("pause");/*pausa*/
		});

		$("#myslide").on("slide",function(){
			console.log("se ha invocado un slide");
		});
		$("#myslide").on("slide",function(){
			console.log("se ha terminado el slide");
		});
	});
	
</script>
	

</body>

</html>
