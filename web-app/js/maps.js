/*
 * Javascript functions to manipulate the
 * google maps API.
 * 
 * @author: Felipe
 */

/*
 * Map instance to be accesed, is instantiated via initialize.
 */
var map;

var idCurrentEvent;

var _isAssistant;

var infowindow;

var currentMarker;

var assistantsCurrentEvent;

var hrefAssistants;

var deleteEventButton='';

var errorFlag=false;

var url = String(document.URL);

var allMarkers = [];




/*
 * Son variables globales �tiles
 * 
 * lati, longi -> definen las coordenadas al hacer el evento
 * para insertar un nuevo evento.
 */
var lati;
var longi;
/*
 * username -> Nombre del usuario actualmente logueado
 */
var username;
/*
 * lastupdate -> es la cantidad de tiempo en millisegundos desde que
 * se actualizo por �ltima vez, asegura que no haya overhead actualizando
 * el mapa por medio de consultas.
 */
var lastupdate;
/*
 * lastEventId -> es el id del ultimo evento que se mostro en el mapa.
 */
var lastEventId;

/*
 * Function that is called by the GSP to init the map.
 * First try to get geolocation via getCurrentPosition,
 * if its successful passes do_initialize() as callback function,
 * if fails a alert is show and default loader is called.
 * 
 */
function initialize(events,u_name) {
	default_map_loader();	  
	username = u_name;
	url= url.substring(0,url.indexOf("/home/"));
	if( events != null )
		showEvents(events);
	
	lastupdate = (new Date()).getTime();
	//console.log(lastupdate);
}


function showLoading(){
	$('#customAlert2').modal('show');
}

function closeLoading(){
	$('#customAlert2').modal('hide');
}


function showAssistants(){

	hrefAssistants='';
	if(assistantsCurrentEvent){
		hrefAssistants = '</p> Estas personas asistirán al evento: <b> ';
		for(var i =0;i<assistantsCurrentEvent.length-1;i++){
			
			hrefAssistants += '<a href=publicProfile?username=' + assistantsCurrentEvent[i] + ' >'+ assistantsCurrentEvent[i]   + ', </a>';
			//console.log(assistantsCurrentEvent[i] );
		}
		hrefAssistants += '<a href=publicProfile?username=' + assistantsCurrentEvent[assistantsCurrentEvent.length-1] + ' >'+ assistantsCurrentEvent[assistantsCurrentEvent.length-1]   + ' </a>';
		
		hrefAssistants +='</b></p>';

	}
	
}


function loadMarkerTest(){
	
	var event = {
			"title" : "Partido de micro",
			"startTime" : "10/05/2014 02:00",
			"endTime" : "10/05/2014 07:41",
			"description" : "Partidito de Micro a las dos en las canchas del CyT ",
			"tags" : ["sexo","drogas","futbol"],
			"latitude" : 4.6442081,
			"longitude" : -74.100177,
			"user" : "Felipe"
		};
	
	
  //  console.log(event);
   showMarker(event);
    
}

function showEvents(events){
	for( var i=0; i<events.length; i++){
	//	console.log( events[i] );
		showMarker( events[i] );	
		lastEventId = events[i].id;
	//	console.log( "TheId",lastEventId );
	}
} 

/*
 * Esta funci�n debe estar encargada de
 * mostrar el nuevo marker en el mapa
 * con lo datos de entrada del modal.
 * 
 * Jquery toma los valores de acuerdo
 * al id del input o el datepicker de bootrsap
 * que esten en el html.
 * 
 * @author: Felipe
 */
function buildNewEventInMap(){
	if(validateEventName() && validateInitialDate() && validateInitialTime() && validationFinalDate() && validateFinalTime()){
	
	var my_title = $('#nombre_evento').val();
	var desc = $('#descripcion').val();
	var tags = $('#tags').val();
	var d2 = $('#date2').val();
	var d = $('#date').val();

	var categoryName = $("#categoria option:selected").html();
	//console.log("Category "+ categoryName);
	var start_hour = $('#start_hour').val();
	console.log(start_hour);
	var end_hour = $('#end_hour').val();
	var selectedGroup = $('#userGroups').val();
	
		
	
	var name = "Anonimo";
	if( username != null && username != 'null' )
		name = username;
	 
	 var newEvent = {
		 "title" : my_title,
		 "startTime" : d2,
		 "endTime" : d,
		 "description" : desc,
		 "tags" : tags,
		 "categoryName" : categoryName,
		 "latitude" : lati,
		 "longitude" : longi,
		 "user" : name,
		 "startHour" : start_hour,
		 "endHour" : end_hour,
		 "selectedGroup" : selectedGroup,
		 
		 
	 };
	 
	// console.log(newEvent);
	 
	 /*
	  * Por medio de AJAX se logra llamar el metodo
	  * saveNewEvent de home y se le pasa newEvent
	  * como parametro para guardar el evento en la DB.
	  */

	 jQuery.ajax({
		 	 
	        type:'POST', 
	        data : newEvent,
	        url:"saveNewEvent",
	        async : false,
	        success:function(data,textStatus){
	        	 
	        	if( data == "Error" )
	        		alert("Ha ocurrido un error");
	        	else{
	        		lastEventId = data;
	        	}
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){   }
	  });
	  
	 
	 newEvent.id = lastEventId ;
	 idCurrentEvent = lastEventId;
	 
	 
	 if( selectedGroup != "No" )
		 newEvent.user = selectedGroup; 
	 
	 newEvent.startTime = newEvent.startTime + " " + start_hour
	 newEvent.endTime = newEvent.endTime + " " + end_hour
	 showMarker(newEvent);
	 $('#myModal').modal('hide');
	}
}


function getAssistants(){
	

	 jQuery.ajax({
		 	 
	        type:'POST', 
	        data : { "idevent" : idCurrentEvent},
	        url:"getAssistants",
	        async : false,
	        success:function(data,textStatus){ 
	        	 
	        	if( data == "ErrorNull" )
	        		if(!errorFlag){
	        			$('#customAlert').modal('show'); 
	        			errorFlag=true;
	        			currentMarker.setMap(null);
	        			}
	        	
	        	if(data=="NoAssistants")
	        		assistantsCurrentEvent = null;	
	        	else{
	        		
	        		assistantsCurrentEvent = data.split(",");
	        	}
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){   }
	  });
	  
	
	
}

function require(script) {
    $.ajax({
        url: script,
        dataType: "script",
        async: false,           // <-- This is the key
        success: function () {
            // all good...
        },
        error: function () {
            throw new Error("Could not load script " + script);
        }
    });
}



/*
 * Shows a event with a jsonObject of a event (Domain Class).
 * 
 * jsonMarker is as follows:
 * 
 * title : "Title Definition"
 * startTime : "10/05/2014 1:11 pm"
 * endTime : "10/05/2014 4:11 pm"
 * description : "Description text"
 * tags : String of tags 
 * latitude: double latitude
 * longitude double longitude
 * user : userName string
 * 
 * @author: Felipe
 */


function showMarker(jsonMarker){
	
	
	var location = new google.maps.LatLng(
	jsonMarker.latitude,
	jsonMarker.longitude );

	
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        title: jsonMarker.title,
        icon:url+"/static/images/"+jsonMarker.categoryName + ".png",
        testeo : jsonMarker.id
    });
	
    /*
     * Abre el InfoWindow cuando se le hace click al marker,
     * se valida que google street view este abierrto para que
     * tambi�n lo abr� alli.
     */
    google.maps.event.addListener(marker, 'click', function() {
    	
    	showLoading();
    	window.setTimeout(function() {
    	
	    	errorFlag=false;
	    	currentMarker=marker;
	    	idCurrentEvent=jsonMarker.id;
	    	
	    	isOwner();
	    	isAssistant();
	    	getAssistants();
	    	
	    	
	    	
			var contentString = '<h2>'+jsonMarker.title+'</h2>'+
						  '<p>Inicia: <i>'+ jsonMarker.startTime + '</i></p>' +
						  '<p>Termina: <i>'+ jsonMarker.endTime +'</i></p> ' +
						  '<p>' + jsonMarker.description + '</p>' + 
						  '<p> Tags: '
						  
			
			var arrTags = jsonMarker.tags.split(",")
			for( var i=0; i<arrTags.length; i++){
				contentString += '<strong> '+arrTags[i]+'</strong>';
				if( i != arrTags.length - 1 )
					contentString += ",";
			}
			contentString+='</p><p>Categoria: <strong>'+ jsonMarker.categoryName +'</strong></p> '; 
			if(!_isAssistant){
				
			
				contentString+='<p>'+'<button   type="submit"  onclick = "attendEvent()" class="btn btn-warning"> Asistir</button>';
			}
			else{
				contentString+='<p>'+'<button   type="submit"  onclick = "unAttendEvent()" class="btn btn-info"> Ya no quiero asistir</button>';
			}
			
			contentString+=deleteEventButton+'</p>'
			
			var href = "publicProfile?username="+ jsonMarker.user;
			getAssistants();
			showAssistants();
		
			
			
			if(assistantsCurrentEvent)
				contentString += hrefAssistants;
			contentString += '</p>' + 'Creado por: <b> ' + '<a href="' + href + '" >'+ jsonMarker.user + '</a></b></p>';
			
			//contentString+='<p>'+'<button   type="submit" onclick = "openChatModal('+jsonMarker.id+')"  class="btn btn-success">Abrir Chat</button>'+'</p>';
			var temp = "'"+jsonMarker.title+"'";
			contentString+='<p>'+'<button   type="submit" onclick = "openChatModal('+jsonMarker.id+','+temp+')"  class="btn btn-success">Abrir Chat</button>'+'</p>';
			
			
			
			
			if(infowindow)
				infowindow.close();
			
			infowindow = new google.maps.InfoWindow({
			content: contentString,
			maxWidth : 350
			});
	
			
			
	    	infowindow.open(map,marker);
	        if (map.getStreetView().getVisible())
	        	infowindow.open(map.getStreetView(), marker)
	        	
	        
        	google.maps.event.addListener(infowindow, 'domready', function() {
        		closeLoading();
        	});
	       
	        
	        
	        return false;
    	});	
    	
    	
        
     });
    
    
    allMarkers.push(marker);
}

function aux(value){
	_isAssistant=value;
	//console.log(_isAssistant)
}

function closeCurrentMarker(){
	currentMarker.setMap(null);
}

function isOwner(){
	//console.log("is owner???:  ");
	jQuery.ajax({
		 
        type:'POST', 
        async: false,
        data : { "idevent" : idCurrentEvent},
        url:"isOwner",
        success:function(data,textStatus){ 
        	 
        	if( data == "ErrorNull" )
        		if(!errorFlag){

        			$('#customAlert').modal('show'); 
        			errorFlag=true;
        			currentMarker.setMap(null);
        		}
        	if( data == "Yes"){
        		deleteEventButton= '<button   type="submit"  onclick = "deleteEvent()" class="btn btn-danger"> Eliminar</button>'
        	}
        	if( data =="No"){
        		//console.log("No es el dueño")
        		deleteEventButton='';

        	}
   
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){   }
  });
}

function isAssistant(){
	//console.log("Impresion para asistente "+ idCurrentEvent);
	jQuery.ajax({
		 
        type:'POST', 
        async: false,
        data : { "idevent" : idCurrentEvent},
        url:"isAssistant",
        success:function(data,textStatus){ 
        	 
        	if( data == "ErrorNull" )
        		if(!errorFlag){
        			$('#customAlert').modal('show'); 
        			errorFlag=true;
        			currentMarker.setMap(null);
        		}
        	if( data == "Yes"){
        		//console.log("Es un asistente")
        		aux(true)
        	}
        	if( data =="No"){
        		//console.log("No es un asistente")
        		aux(false)
        		
        	}
   
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){   }
  });
	
}

function attendEvent(){
	
	
	showLoading();
	
	 window.setTimeout(function() {
		 
		 jQuery.ajax({
			 
		        type:'POST', 
		        async: false,
		        data : { "idevent" : idCurrentEvent },
		        url:"attendEvent",
		        success:function(data,textStatus){ 
		        	
		        	closeLoading();
		        	 
		        	if( data == "Error" )
		        		if(!errorFlag){
		        			$('#customAlert').modal('show'); 
		        			errorFlag=true;
		        			infowindow.close();
		        			currentMarker.setMap(null);
		        			infowindow.close();
		        		}
		        	if( data == "Success"){
		        		//console.log("Success")
		        		google.maps.event.trigger(currentMarker, 'click', {});
		        	}
		        },
		        error:function(XMLHttpRequest,textStatus,errorThrown){
		        	 
		        }
		  });
		 
		 
		 return false;
	 });
	
	

	
	
}

function unAttendEvent(){
	
	//console.log(idCurrentEvent)
	
	showLoading();
	
	window.setTimeout(function() {
	
			jQuery.ajax({
				 
		        type:'POST',
		        async: false,
		        data : { "idevent" : idCurrentEvent },
		        url:"unAttendEvent",
		        success:function(data,textStatus){
		        	
		        	closeLoading();
		        	
		        	if( data == "Error" )
		        		if(!errorFlag){
		        			$('#customAlert').modal('show'); 
		        			errorFlag=true;
		        			infowindow.close();
		        			currentMarker.setMap(null);			
		        		}
		        	if( data == "Success"){
		        		//console.log("Success")
		        		google.maps.event.trigger(currentMarker, 'click', {});
		        	}
		        },
		        error:function(XMLHttpRequest,textStatus,errorThrown){  closeLoading();  }
		  });
		
		return false;
	});
	
	
}





function deleteEvent(){

	jQuery.ajax({
		 
	        type:'POST',
	        data : { "idevent" : idCurrentEvent },
	        url:"deleteEvent",
	        success:function(data,textStatus){ 
	        	 
	        	if( data == "ErrorNull" )
	        		if(!errorFlag){
	        			$('#customAlert').modal('show'); 
	        			errorFlag=true;
	        			currentMarker.setMap(null);
	        		}
	        	if( data == "Success"){
	        		//console.log("Success")
	        	}
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){ }
	 });
		
	 infowindow.close();
	 currentMarker.setMap(null);

}

/*
 * Actualiza el mapa si no ha pasado mucho tiempo desde que
 * se actualizo la �ltima vez.
 * 
 * por defecto (quemado en c�digo) es 3 segundos (3 ms)
 * 
 * Esta funci�n se llama cuando hay un bounds_changed event
 * en el mapa.
 * 
 * para asegurar que no se carguen eventos previos se 
 * pasa el id del �ltimo evento que esta en el mapa,
 * asi getLastEvents solo trae los eventos con id mayor.
 * 
 * @author: Felipe
 */
/*function updateMapIfNeeded(){
	var currentTime = (new Date());
	if( currentTime.getTime() - lastupdate > 3000 ){
		//console.log("update",currentTime - lastupdate);
		lastupdate = currentTime;
		jQuery.ajax({
	        type:'POST', 
	        data : { "lastEventId" : lastEventId },
	        url:"getLastEvents",
	        success:function(data,textStatus){
	        	for( var i=0; i<data.length; i++){
	        		showMarker( JSON.parse(data[i]) ); 
	        	}
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){ }
	  });
	}
		
}
*/
/*
 * Inits the map
 */
function default_map_loader(){
	var coord = new google.maps.LatLng(4.6353209,-74.0824658);
	var coord2 = new google.maps.LatLng(4.6442081,-74.100177);
	var mapOptions = {
	          center: coord,
	          zoom: 18,
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
    map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
    
   /*
    * Se abre el modal con doble click
    */
    google.maps.event.addListener(map, 'dblclick', function(event) {
        
    	lati = event.latLng.lat();
        longi = event.latLng.lng();
        
        $('#myModal').modal('show');        
     });
    

   /*
    * Si se cambia la posicion del mapa se actualiza el mapa.
    */ 
    google.maps.event.addListener(map, 'bounds_changed', function(event) {
    	
    	//updateMapIfNeeded();
    	
     });
}


/*
 * @autor Maikol
 * Ubica el mapa en el evento que seleciona en el buscador
 */
function goToLocation(idEvent){
	
	 var dataId = {"idEvent" : idEvent};
	 
	 jQuery.ajax({
	        type:'POST', 
	        data : dataId,
	        url:"getEventById",
	        success:function(data){
	        		
	        		var latitud = JSON.parse(data[0]).latitude;
	        		var longitud = JSON.parse(data[0]).longitude;

	 				map.setCenter(new google.maps.LatLng(latitud,longitud));
	 				map.setZoom(21);

	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){}
	  });

	// console.log(idEvent);
	
}


/*
 * Elimina todos los markers del mapa
 */
function clearMarkers(){
	 while(allMarkers[0]){
		 allMarkers.pop().setMap(null);
		  }
}


/*
 * Metodo para consultar la DB
 * y recargar el mapa cuando se filtra.
 * 
 * @author: Felipe
 */
function queryAndReload(){
	var _data = {
			"fechaInicial" : $("#inicioDiaFilter").val(),
			"fechaFinal" : $("#finalDiaFilter").val(),
			"tagsString" : $("#tagsFilter").val(),
			"categoria": $("#filtroCategoria").val()
			
			};
	 
	console.log(_data);
	 jQuery.ajax({
	        type:'POST', 
	        data : _data,
	        url:"queryEvents",
	        success:function(data){
	        	$('#filterModal').modal('hide');
	        	
	        	if( data != "ERROR" ){
	        		
	        		//console.log(data);
	        		for(var i=0; i<data.length; i++){
	        			data[i] = JSON.parse(data[i]);
	        		}
	        		//console.log(data);
	        		
	        		//Borra todos los markers
	        		clearMarkers();
	        		
	        		//Muestra los filtrados...
	        		showEvents(data);
	        		
	        	}	        		

	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){}
	  });
}

function allEvents(){
	
	jQuery.ajax({
        type:'POST', 
        url:"queryAllEvents",
        success:function(data){
        	//$('#filterModal').modal('hide');
         		
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){}
  });
	
	
	
}
