
<!DOCTYPE html>
<html>

	<!-- para que sirvan los botones desplegables y otras funcinalidades-->
 	<g:javascript src="jquery-1.11.1.min.js"/> 
 	<g:javascript src="bootstrap.min.js"/>
 	
 	<!-- para que sirva el captcha -->
 	<g:javascript src="jquery-1.3.2.js"/>
    <g:javascript src="ui.core.js"/>
    <g:javascript src="ui.sortable.js"/>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" type="text/css" href="${resource(dir:'css', file:'captcha.css')}" />
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
								          <td>Nombre de usuario:</td>
								          <td><input type="text" name="username" value="${username}" /></td>
								        </tr>
								        <tr>
								          <td>Nombre:</td>
								          <td><input type="text" name="name" value="${name}" /></td>
								        </tr>
								        <tr>
								          <td>Apellido:</td>
								          <td><input type="text" name="lastname" value="${lastname}" /></td>
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
								          <td>Ubicación:</td>
								          <td><input type="text" name="ubication" value="${ubication}" /></td>
								        </tr>
								        <tr>
								          <td>Biografía:</td>
								          <td><textarea name="biography" rows="5" cols="10">${biography}</textarea></td>
								        </tr>
								        <tr>
								        	<td></td>
												<td>
												<div class="row-fluid">
												 <div class="span8"></div>
												  <div class="span2">
														<div class="captcha_wrap">
										                    <div class="captcha">
																	Arrastre para ordenar
										                    </div>
										                    <ul id="sortable">
										                        <li class="captchaItem">1</li>
										                        <li class="captchaItem">2</li>
										                        <li class="captchaItem">3</li>
										                        <li class="captchaItem">4</li>
										                        <li class="captchaItem">5</li>
										                        <li class="captchaItem">6</li>
										                    </ul>
										                </div>
									                </div>
									                <div class="span2"></div>
								                </div>
								                </td>
								        </tr>
								        <tr>
								         	<td>&nbsp;</td>
								        </tr>
								        <tr>
								          <td></td>
								          <td><input type="submit" value="Registrarse &raquo;" class="btn btn-success btn-large" onclick = "this.form.action = 'register'" id="formsubmit"/>
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
        		<p class="pull-right"><a href="#">Volver al inicio</a></p>
        		<p>&copy; 2014 Casuality, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
       		 </div>
       		 <div class="span12">&nbsp;</div>
        </div>
      </footer>
	 <!-- fin footer -->

</body>

<script type="text/javascript">
            (
            function($){

                $.fn.shuffle = function() {
                    return this.each(function(){
                        var items = $(this).children();

                        return (items.length)
                            ? $(this).html($.shuffle(items,$(this)))
                        : this;
                    });
                }

                $.fn.validate = function() {
                    var res = false;
                    this.each(function(){
                        var arr = $(this).children();
                        res =    ((arr[0].innerHTML=="1")&&
                            (arr[1].innerHTML=="2")&&
                            (arr[2].innerHTML=="3")&&
                            (arr[3].innerHTML=="4")&&
                            (arr[4].innerHTML=="5")&&
                            (arr[5].innerHTML=="6"));
                    });
                    return res;
                }

                $.shuffle = function(arr,obj) {
                    for(
                    var j, x, i = arr.length; i;
                    j = parseInt(Math.random() * i),
                    x = arr[--i], arr[i] = arr[j], arr[j] = x
                );
                    if(arr[0].innerHTML=="1") obj.html($.shuffle(arr,obj))
                    else return arr;
                }

            })(jQuery);

            $(function() {
                $("#sortable").sortable();
                $("#sortable").disableSelection();
                $("#sortable").shuffle();

                $("#formsubmit").click(function(){
                    ($("#sortable").validate()) ? alert("Si, usted es humano!") : alert("Captcha invalido, acaso es Diego? jaja!");
                });
            });
</script>

</html>