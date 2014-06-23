<!DOCTYPE html>

	<!-- includes map javascript functions. -->
	
	<g:javascript src="chat.js" />
	<g:javascript src="maps.js" />
	<g:javascript src="validations.js" />

	
	<!--<g:javascript library="jquery"/> -->
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
		<resource:include components="autoComplete" autoComplete="[skin: 'custom']"/>
	    
	
	
	
	</head>
	


<!-- inicio menu -->
<div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="initPage">Causality</a>
          <ul class="nav">
          	  <li class="divider-vertical"></li>
          </ul>
          <div class="nav-collapse collapse pull-right">
            <ul class="nav">
			  <li class="divider-vertical"></li>
              <li class="inactive"><a href="index">Eventos</a></li>
              
             
              
             <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grupos<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Grupos</li>         
                  <li><a href="groups">Mis Grupos</a></li>                  
                </ul>
              </li>
              
               <li class="active"><a href="#">Contacto</a></li>
              
               </ul>
          </div><!--/.nav-collapse -->
        </div>
  	</div>
</div>

		
					
								
				            <!-- inicio datos de mas -->
				            <div style="text-align: center;">
	
	<div class="container">
			<br>
			<h1>Causality</h1>
			<p>
			Causality es una aplicación desarrollada por estudiantes
			de la Universidad nacional de colombia.
			</p>
			
			<strong>Contacto:</strong> <b>causalityapp@gmail.com</b>
		
		  	<br>
		  	
		  	<h1>Equipo de Trabajo</h1>
		  	
		  	<br>	
	</div>


	<div class="row-fluid">
	
	<div class="span1">&nbsp;</div>
	
	<div class="span2 text-align: center;">
          <r:img class="img-circle" file="Diego.png" width="40%" height="30%" alt="img"/>	
          <h3>Diego Vanegas</h3>
          <p align="justify">"Estudiante de Ingeniería de Sistemas, areas de interés: 
          Analisis de metodos numericos orientado a señales de comunicacion;Estudio de 
          algoritmos enfocados a la programacion lineal, entera y no lineal, Ingeniería de 
          Software; Analisis de modelos estocasticos enfocado al manejo de redes Ad-Hoc"
          
          <br><br>
         <b> davanegaspr@unal.edu.co</b>
          </p>
        </div>		  	
   
   
   <div class="span2 text-align: center;">
          <r:img class="img-circle" file="Maikol.png" width="50%" height="50%" alt="img"/>	
          <h3>Maikol Bonilla</h3>
          <p align="justify">"Estudiante de Ingeniería de Sistemas y Computación, 
          experiencia en desarrollo de aplicaciones standalone,areas de interés: 
          Diseño de aplicaciones y Algoritmia.
          
          <br><br>
          <b>mabonillagi@unal.edu.co</b>
          </p> 	
        </div>
        
        
		  

      	
        
        <div class="span2 text-align: center;">
          <r:img class="img-circle" file="felipe.png"  width="50%" height="50%" alt="img"/>	
          <h3>Felipe Cruz</h3>
          <p align="justify">"Estudiante de Ingeniería de Sistemas y
           Computación, experiencia en desarrollo de aplicaciones móviles y 
           standalone, areas de interés: Análisis y diseño de Algoritmos, 
           Ingeniería de Software, y Complejidad Computacional."
           
           <br><br>
           <b>afcruzs@unal.edu.co</b>
           </p>
            
        </div>
        
        
        
        <div class="span2 text-align: center;">
          <r:img class="img-circle" file="Donato.png"  width="50%" height="50%" alt="img"/>	
          <h3>Andres Donato</h3>
          <p align="justify">
          Estudiante de Ingenieria de Sistemas, 20 años, 
          experiencia en aplicaciones moviles y standalone; areas de interes: 
          inteligencia artifical y mineria de datos,ingenieria de software 
          <br><br><br>
         <b> nadonatoa@unal.edu.co</b>
          </p>
        
        </div>
        
        
        
        <div class="span2 text-align: center;">
          <r:img class="img-circle" file="Fabian.png"width="50%" height="50%" alt="img"/>		
          <h3>Fabian Rodríguez</h3>
          <p align="justify">Estudiante de Ingenieria de sistemas y computacion, 
          areas de interés: programacion visual, Analisis de algorimia avanzada 
          con enfoque a la computacion grafica,Analisis de complejidad de algoritmos
          
          <br><br>
         <b> faarodriguezbe@unal.edu.co</b>
          </p>
            </div>   	
         </div>
         
         
         <div class="span1">&nbsp;</div>
         
     </div>
		
	<!-- fin datos de mas -->
		
</body>
</html>