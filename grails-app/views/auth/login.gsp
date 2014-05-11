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
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" /><!-- para las imagenes iconos -->
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />
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
          <a class="brand" href="#">Causalty</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
              <li class="dropdown">
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
              </li>
            </ul>
            <g:form class="navbar-form pull-right">
            	<input type="hidden" name="targetUri" value="${targetUri}" /> <!-- esto nose que hace (esto lo genero el shiro creo) -->
              	<input class="span2" type="text" name="username" placeholder="Username" value="${username}" />
             	<input class="span2" type="password" name="password" placeholder="Password" value="${password}" />
            	<!-- <label>Remember me?:</label> -->
            	<button  type="submit" value="Sign in" onclick = "this.form.action = 'signIn'" class="btn">Sign in</button>
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
						<r:img  file="admin_dash.jpg" alt=""/>		
						<div class="carousel-caption">
							<h4>This is a test</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt, animi eveniet distinctio repudiandae eius? Cupiditate, quisquam, voluptas, nostrum ducimus repellat maiores similique incidunt laborum voluptatum numquam sapiente possimus alias non.</p>
						</div>
					</div>
					<div class="item">
						<r:img  file="admin_dash2.jpg" alt=""/>	
						<div class="carousel-caption">
							<h4>This is a test</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illum deserunt nihil sequi distinctio suscipit laborum amet dolorum modi. Ex quisquam consectetur ipsam voluptas architecto beatae molestias blanditiis asperiores accusantium quae.</p>
						</div>
					</div>
					<div class="item">
						<r:img  file="motog.jpg" alt=""/>
						<div class="carousel-caption">
							<h4>This is a test</h4>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente, aliquid, nisi, eligendi, voluptate perferendis accusamus beatae rem facere distinctio id a autem magni impedit? Odit eligendi molestias eius natus nihil!</p>
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
			<h1>Causalty</h1>
       		 <p>This is a template for a simple marketing or informational website. It includes a large callout called the hero unit and three supporting pieces of content. Use it as a starting point to create something more unique.</p>
        	<p><a href="registeraux" class="btn btn-large btn-success btn-large btn-block">Sign up today &raquo;</a></p>
      	</div>	
</div>
	<!-- fin slide y well -->
	<!-- inicio datos de mas -->
	<div class="row-fluid">
        <div class="span4 text-center">
          <r:img class="img-circle" file="interesting.jpg" alt=""/>		
          <h2>Heading</h2>
          <p>Donec sed odio dui. Etiam porta sem malesuada magna mollis euismod. Nullam id dolor id nibh ultricies vehicula ut id elit. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div><!-- /.span4 -->
        <div class="span4 text-center">
          <h2 >Heading</h2>
          <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit. Cras mattis consectetur purus sit amet fermentum. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
          <r:img class="img-circle" file="interesting.jpg" alt=""/>	
        </div><!-- /.span4 -->
        <div class="span4 text-center">
          <r:img class="img-circle" file="interesting.jpg" alt=""/>	
          <h2>Heading</h2>
          <p>Donec sed odio dui. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Vestibulum id ligula porta felis euismod semper. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <p><a class="btn" href="#">View details &raquo;</a></p>
        </div><!-- /.span4 -->
     </div><!-- /.row -->
	<!-- fin datos de mas -->
	
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
