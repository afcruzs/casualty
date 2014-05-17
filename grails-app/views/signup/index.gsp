
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
          <a class="brand" href="#">Causality</a>
          <ul class="nav">
          <li class="divider-vertical"></li>
          </ul>
          <div class="nav-collapse collapse pull-right">
            <ul class="nav">
              <li class="active"><a href="loginaux">Inicio</a></li>
              <li><a href="#about">Acerca de</a></li>
              <li><a href="#contact">Contacto</a></li>
              <li class="dropdown">
                
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
  	</div>
</div>
<!-- fin menu -->

<!-- inicio container -->
<div class="container">
	<div class="span12">&nbsp;</div>
	<div class="span12">&nbsp;</div>
	<div class="row-fluid">
	<div class="span2"></div>
		<div class="span8">
		<!-- inicio well -->
		<div class="well">
			  <h1 class="text-center">Registro</h1>
				  <g:hasErrors bean="${user}">
				    <div class="alert-alert-error">
				        <g:renderErrors bean="${user}" as="list"/>
				    </div>
				  </g:hasErrors>
			  <div class="container">
				  <div class="row-fluid">
					  <div class="span2"></div>
						  	<div class="span8">
							  	<g:form class = "form text-center">
								    <table>
								      <tbody>
								        <tr>
								          <td>Nombre:</td>
								          <td><input type="text" name="username" value="${username}" /></td>
								        </tr>
								        <tr>
								          <td>Contraseña:</td>
								          <td><input type="password" name="password" value="" /></td>
								        </tr>
								        <tr>
								          <td>Confirmar Contraseña:</td>
								          <td><input type="password" name="password2" value="" /></td>
								        </tr>
										<tr>
								          <td>Correo:</td>
								          <td><input type="email" name="email" value="" /></td>
								        </tr>
								        <tr>
								          <td />
								          <td><input type="submit" value="Registrarse" onclick = "this.form.action = 'register'"/>
								          </td>
								        </tr>
								      </tbody>
								    </table>
							 	</g:form>
							</div>
					 <div class="span2"></div>
				 </div>
			 </div>
		 </div>
		 <!-- fin well -->
		 <div class="span2"></div>
  	</div>
  </div>
  <!-- fin container -->
  
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  
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
</body>

</html>