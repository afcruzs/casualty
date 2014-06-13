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
	    
	<!-- ------------------------------------------------------------------------- -->
	<style>



  

 /* colors */
   
   .flex > div:nth-child(3){ background : #CE2B37; }

   .flex > div:hover
   {
        width: 200px;
   }
   
   </style>
	
	<!-- ------------------------------------------------------------------------- -->
	
	
	</head>
	

<!-- when the load is done initialize the map. -->
<body onload="initialize(${events},'${username}',getDate())" >

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
              <li>
              <g:form class="navbar-form">
				<richui:autoComplete name="event" action="${createLinkTo('dir': 'home/searchAJAX')}" onItemSelect="goToLocation(id)" />
           	  </g:form>
              </li>
          </ul>
          <div class="nav-collapse collapse pull-right">
            <ul class="nav">
			  <li class="divider-vertical"></li>
              <li class="active"><a href="#">Eventos</a></li>
              
              
             <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Grupos<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Grupos</li>         
                  <li><a href="groups">Mis Grupos</a></li>                  
                </ul>
              </li>
              
              
             <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Contacto<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li class="divider"></li>
                  <li class="nav-header">Informacion Personal</li>
					<li><a href="#mylook" data-toggle="modal">Consultar</a></li>                    
                </ul>
              </li>
              
              
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">${username}<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href = "${createLink(controller:'auth', action:'signOut')}" >Cerrar sesión</a></li>
                  <li class="divider"></li>
                  <li class="nav-header">Perfil</li>
                  <li><a href="profile">Mi Perfil</a></li>
                  <li><a href="help">Ayuda</a></li>                  
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div>
  	</div>
</div>

		
		<!-- Create a custom alert for when the event has been deleted-->
		<div id="customAlert" class="modal hide fade">
				<div id="customAlert" class="donatoAlert donatoAlert-error">
				<h4>Oops!!!</h4>
				Lo sentimos, este evento fue borrado
			</div>
		</div>
		<!-- end creating cutos alert -->
		
		
		<!-- Modal de cargando -->
		<div id="customAlert2" class="modal hide">
				<center><h2>Cargando...</h2></center>
				<section class="spinner-2">
		        <div class="spinner"></div>
		      </section>
		</div>

		

		
		
			<!-- create the modal-->
				<div id="myModal" class="modal hide">
						<div class="modal-header">

							<button type="button" class="close" data-dismiss="modal">salir</button>
							
							<h4 class="text-center">Agregar Evento</h4>
							<div class="row-fluid">
							
								<div class="span12">
								
								
									
									<label for="">Nombre del evento</label>
									<input type="text" onkeyup="validateEventName()" id = "nombre_evento"><br>
									
									<label for="">¿Crear como Grupo?</label>
									<select id="userGroups" name ="categoria"  >
										<script>

											/*
												Inicializa con los grupos
											*/

											jQuery.ajax({
												type:'POST', 
										        url:'getUserGroups',
										        success:function(data,textStatus){
										        			
										        			for( var i=0; i<data.length; i++){
										        				console.log( $("#userGroups").val() );
										        				$("#userGroups").append( // Append an object to the inside of the select box
										        			            $("<option></option>") // Yes you can do this.
										        			                .text(data[i].nameGroup)
										        			                .val(data[i].nameGroup) );
										        			}	
											       		},
										        error:function(XMLHttpRequest,textStatus,errorThrown){}
									        	}
								        	);


											$("#userGroups").append( 
					        			            $("<option selected></option>") 
					        			                .text("No")
					        			                .val("No") );
											
										</script>
										
									</select>
									
									<label for="">Fecha de inicio</label>
									
									<div class="input-append date" id="d2" data-date="02-05-2014"  data-date-format="dd-mm-yyyy">
									  	<input class="span10" type="text" onkeyup="validateInitialDate(this.value)" value="02-05-2014" id = "date2">
									  <span class="add-on"><i class="icon-th"></i></span>
									</div>	
									<!-- <input type="date" id="date2"><br>-->
									
									<label for="">Hora Inicial</label>
									<input type="time" onkeyup="validateInitialTime(this.value)" id="start_hour"><br>
									
									<label for="">Categoria</label>
									<select id="categoria" name ="categoria" >
										<option>Deportes</option>
										<option>Ocio</option>
										<option>Academico</option>
										<option selected>Otro</option>
									</select>
									
									<br>
									<label for="">Fecha de finalización</label>
									<!--  <input type="date" id="date"><br>-->
									
									<div class="input-append date" id="d" data-date="02-05-2014" data-date-format="dd-mm-yyyy">
									  <input class="span10"  onkeyup="validationFinalDate(this.value)" type="text" value="02-05-2014" id="date">
									  <span class="add-on"><i class="icon-th"></i></span>
									</div>	
									
									

									<br>
									<label for="">Hora Final</label>
									<input type="time" onkeyup="validateFinalTime(this.value)" id="end_hour" ><br>
									<label for="">Descripción</label>
									<input type="text" id="descripcion"><br>
									<label for="">Etiquetas</label>
									<input type="text" id="tags"><br>
									<!--
									<label for="">Creado por (?)</label>
									<input type="text"><br> -->

								</div>

								
							</div>


						</div>
					
						<div class="modal-footer"> 
							<button type="button" class ="btn" data-dismiss="modal" >Cerrar</button>
							<button type="button" id="btnSave1" class ="btn btn-primary" onclick="buildNewEventInMap()" >Guardar</button>
						</div>
					</div>
			<!--end create the modal-->
			
			
			<!-- create the modal to look up-->
				  
				   <div id="mylook" class="modal hide fade">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3>Contactos</h3>
							</div>
							<div class="modal-body">
							
				
								
				            <!-- inicio datos de mas -->
	

        
        <div class="flex">		
   
        <div class="span4 text-center">
          <r:img class="img-circle" file="Donato.png" alt=""/>	
          <h2>Donato Ariza</h2>
          <p>Estudiante de Ingenieria de Sistemas, 20 años, experiencia en apps moviles y standalone; areas de interes: inteligencia artifical y mineria de datos,ingenieria de software </p>
        <p>correo: nadonatoa@unal.edu.co</p>
        </div>
        
         </div>
        <div class="flex">	
        
         
        <div class="span4 text-center">
          <r:img class="img-circle" file="felipe.png" alt=""/>	
          <h2>Felipe Cruz</h2>
          <p>"Estudiante de Ingeniería de Sistemas y Computación, experiencia en desarrollo de aplicaciones móviles y standalone, areas de interés: Análisis y diseño de Algoritmos, Ingeniería de Software,Complejidad Computacional y teoría de juegos"</p>
            <p>correo: afcruzs@unal.edu.co</p>
        </div>
        
        </div>
        <div class="flex">	
        
        <div class="span4 text-center">
          <r:img class="img-circle" file="Fabian.png" alt=""/>		
          <h2>Fabian Rodríguez</h2>
          <p>Estudiante de Ingenieria de sistemas y computacion, areas de interés: programacion visual, Analisis de algorimia avanzada con enfoque a la computacion grafica,Analisis de complegidad de algoritmos</p>
            <p>correo: faarodriguezbe@unal.edu.co</p>
            </div>
       
          </div>
        <div class="flex">
          
      
          	
        <div class="span4 text-center">
          <r:img class="img-circle" file="Maikol.png" alt=""/>	
          <h2 >Maikol Bonilla</h2>
          <p>"Estudiante de Ingeniería de Sistemas y Computación, experiencia en desarrollo de aplicaciones standalone,areas de interés: Diseño de aplicaciones y Algoritmia.</p> 	
           <p>correo:  mabonillagi@unal.edu.co</p>
        </div>
         
           </div>
           <div class="flex">
           
          <div class="span4 text-center">
          <r:img class="img-circle" file="Diego.png" alt=""/>	
          <h2>Diego Vanegas</h2>
          <p>"Estudiante de Ingeniería de Sistemas, areas de interés: Analisis de metodos numericos orientado a señales de comunicacion;Estudio de algoritmos enfocados a la programacion lineal, entera y no lineal, Ingeniería de Software;Analisis de modelos estocasticos enfocado al manejo de redes Ad-Hoc"</p>
          <p>correo: davanegaspr@unal.edu.co</p>
        </div>
        
     
        </div>	
        
    
	<!-- fin datos de mas -->
							
						</div>
					</div>
			
			<!--end create the modal-->
			
			
			<!-- chat modal-->
				  
				   <div id="chatModal" class="modal hide fade"  >
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h3 class="chatTitle" id="theTitle">Chat</h3>
							</div>
							<div class="modal-body">
							   
							<div id="chatMessages"></div>
							<br>
							<input type="text" id="messageBox" name="message" onkeypress="messageKeyPress(this,event);"/>
							<div id="temp"></div>
							<!-- Campos escondidos para pasar variables entre js y html -->
							<input type="hidden" name="eventId" id="eventId" value="LEL" />
							<input type="hidden" name="messageId" id="messageId"  />
							
							
							<script>
								/*
									Esto es todo el chat,
									Se tienen los eventos de teclado para saber cuando el usuario
									oprimio enter y asi enviar la peticion asincrona a que guarde
									el mensaje en la DB.

									Por otro lado pollMessages trae los mensajes de la DB (cada 300 ms)
									y los muestra en el messagebox, se debe hacer rapido para que el usuario
									no perciba retrasos y ademas que al traer los mensajes de manera lenta
									se podrian quedar "pegados" mensajes de una conversacion pasada en la actual.

									finalmente eventId es un input vacio que se pusa para conectar el id del evento
									que se trae por javascript con este gsp y asi saber que mensajes traer.
								*/
							    function messageKeyPress(field,event) {
							        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
							        var message = $('#messageBox').val();
							        var hiddenId = $('#eventId').val();
							        var myId = ${userId};
							
							        if (theCode == 13){
								        console.log("like"+hiddenId);

								        
								        <g:remoteFunction action="submitMessage" params="'message='+message+'&idEvent='+hiddenId+'&userId='+myId" update="temp"/>
								        /*jQuery.ajax({type:'POST',
									        data:'message='+message+'&idEvent='+hiddenId, 
									        url:'/CausalityAppProject/home/submitMessage',
									        success:function(data,textStatus){jQuery('#temp').html(data);},
									        error:function(XMLHttpRequest,textStatus,errorThrown){}}
								        );*/
								        	
							            $('#messageBox').val('');
							            return false;
							        } else {
							            return true;
							        }
							    }

								/*
									Si el controller retorna que el evento no existe
									se debe de cerrar el chat, mostar un mensaje de alerta
									y cerrar el marker actual.
								*/
							    function handleMessages(data){
								    if(data != "DeletedEvent")
							    		jQuery('#chatMessages').html(jQuery('#chatMessages').html()+data);
								    else{
								    	hiddenId = "";
								    	$('#customAlert').modal('show'); 
								    	$('#chatModal').modal('hide');
								    	closeCurrentMarker();
									}
								}
							
							    function retrieveLatestMessages() {
							    	var hiddenId = $('#eventId').val();
							    	var msgId = $('#messageId').val();
							    	var myId = ${userId};
							    	if( hiddenId != "" ){
							    		
										
							    		<g:remoteFunction action="retrieveLatestMessages" 
								    		params="'idEvent='+hiddenId+'&myId='+myId+'&lastMessageId='+msgId" 
									    	asynchronous = "false" 
										    onSuccess="handleMessages(data)"
										/>

								    	/*jQuery.ajax({type:'POST',data:'idEvent='+hiddenId, 
									    	url:'/CausalityAppProject/home/retrieveLatestMessages',
								    		success:function(data,textStatus){jQuery('#chatMessages').html(data);},
								    		error:function(XMLHttpRequest,textStatus,errorThrown){}}
						    			);*/
									}
							    	
							    }
							
							    function pollMessages() {
								    
							        retrieveLatestMessages();
							        setTimeout('pollMessages()', 300);
							    }

							    function initModal(){
							    	$('#eventId').val('');
							    	$('#chatMessages').val('');    
							    	$('#chatModal').on('hidden', function () {
							    	    /*
							    	    	Bandera para que no haga ajax cuando
							    	    	el chat esta cerrado.
							    	    */
							    	    $('#chatMessages').html('');  
							    	    $('#eventId').val('');
								    	 
							    	})
								}

							    initModal();
							    pollMessages();
							</script>
							
								
							</div>
							
						</div>
			
			<!--end create the modal-->



<!-- fin menu -->


			<!-- actually loads the map -->
			
			<div id="map_canvas"></div> 
	<div class="pagination pagination-large pagination-centered">
		<div class="well">
			<div class="container">
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
		</div>
	</div>
	
	<!-- fin actually loads the map -->
	
	<script>
	$().ready(function(){
		// me sirve para que sirvan los date
		//jQuery('#date').datepicker();	
		//jQuery('#date2').datepicker();	
		//$('.datepicker').datepicker()

		/*$("#myModal").on("show",function(){
				fecha = new Date();
				console.log("xd");
				var a=fecha.getDate();
				var b=fecha.getMonth();
				if(a<10){
					a="0"+a;
				}
				if(b<10){
					b="0"+b;
				}
				var cad = a +"-" +b +"-" +fecha.getFullYear();

				//valor.value =""+fecha.getDate+"-"+fecha.getFullYear()+"";
				document.getElementById('date2').value = cad;
				document.getElementById('date').value = cad;
				//valor.value =cad;

			})*/
		

		$('#d2').datepicker().on('changeDate', function (ev) {
			$('#date2').change();
		});

		$('#d').datepicker().on('changeDate', function (ev) {
		    $('#date').change();
		});
		
		
	var checkout = $('#d').datepicker({
		  onRender: function(date) {
		    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
		  }
		}).on('changeDate', function(ev) {
		  checkout.hide();
		}).data('datepicker');
	



	
	});


	</script>

</body>
</html>