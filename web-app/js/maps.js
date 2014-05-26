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

/*
 * Son variables globales útiles
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
 * se actualizo por última vez, asegura que no haya overhead actualizando
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
	
	if( events != null )
		showEvents(events);
	
	lastupdate = (new Date()).getTime();
	console.log(lastupdate);
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
	
	
    console.log(event);
   showMarker(event);
    
}

function showEvents(events){
	for( var i=0; i<events.length; i++){
		console.log( events[i] );
		showMarker( events[i] );	
		lastEventId = events[i].id;
		console.log( "TheId",lastEventId );
	}
} 

/*
 * Esta función debe estar encargada de
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
	
	
	

	
	var my_title = $('#nombre_evento').val();
	var desc = $('#descripcion').val();
	var tags = $('#tags').val();
	var d2 = $('#date2').data('date');
	var d = $('#date').data('date');

	
	var name = "Anonimo";
	if( username != null && username != 'null' )
		name = username;
	 
	 var newEvent = {
		 "title" : my_title,
		 "startTime" : d2,
		 "endTime" : d,
		 "description" : desc,
		 "tags" : tags,
		 "latitude" : lati,
		 "longitude" : longi,
		 "user" : name
		 
	 };
	 
	 
	 
	 /*
	  * Por medio de AJAX se logra llamar el metodo
	  * saveNewEvent de home y se le pasa newEvent
	  * como parametro para guardar el evento en la DB.
	  */
	 jQuery.ajax({
	        type:'POST', 
	        data : newEvent,
	        url:"saveNewEvent",
	        success:function(data,textStatus){console.log(data)},
	        error:function(XMLHttpRequest,textStatus,errorThrown){}
	  });
	  
	 
	 showMarker(newEvent);
	 $('#myModal').modal('hide');
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
	
	var contentString = '<h2>'+jsonMarker.title+'</h2>'+
				  '<p>Inicia: <i>'+ jsonMarker.startTime + '</i></p>' +
				  '<p>Termina: <i>'+ jsonMarker.endTime +'</i></p> ' +
				  '<p>' + jsonMarker.description + '</p>' + '<p> Tags: ';
	
	var arrTags = jsonMarker.tags.split(",")
	for( var i=0; i<arrTags.length; i++){
		contentString += '<strong> '+arrTags[i]+'</strong>';
		if( i != arrTags.length - 1 )
			contentString += ",";
	}
	
	contentString += '</p>' + 'Creado por: <b> ' + jsonMarker.user + '</b>';
	
	var infowindow = new google.maps.InfoWindow({
		content: contentString,
		maxWidth : 350
	});
	
    var marker = new google.maps.Marker({
        position: location,
        map: map,
        title: jsonMarker.title
    });
	
    /*
     * Abre el InfoWindow cuando se le hace click al marker,
     * se valida que google street view este abierrto para que
     * también lo abrá alli.
     */
    google.maps.event.addListener(marker, 'click', function() {
        
    	
    	infowindow.open(map,marker);
        if (map.getStreetView().getVisible())
        	infowindow.open(map.getStreetView(), marker)
        
     });
    	
}

/*
 * Actualiza el mapa si no ha pasado mucho tiempo desde que
 * se actualizo la última vez.
 * 
 * por defecto (quemado en código) es 3 segundos (3 ms)
 * 
 * Esta función se llama cuando hay un bounds_changed event
 * en el mapa.
 * 
 * para asegurar que no se carguen eventos previos se 
 * pasa el id del último evento que esta en el mapa,
 * asi getLastEvents solo trae los eventos con id mayor.
 * 
 * @author: Felipe
 */
function updateMapIfNeeded(){
	var currentTime = (new Date());
	if( currentTime.getTime() - lastupdate > 3000 ){
		console.log("update",currentTime - lastupdate);
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
	        error:function(XMLHttpRequest,textStatus,errorThrown){}
	  });
	}
		
}

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
    	
    	updateMapIfNeeded();
    	
     });
}