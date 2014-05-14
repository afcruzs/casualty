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

var lati;
var longi;
var username;


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
		 "tags" : tags.split(","),
		 "latitude" : lati,
		 "longitude" : longi,
		 "user" : name
		 
	 };
	 
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
 * tags : Array of tags (Strings)
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
	
	for( var i=0; i<jsonMarker.tags.length; i++){
		contentString += '<strong> '+jsonMarker.tags[i]+'</strong>';
		if( i != jsonMarker.tags.length - 1 )
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
    
   
    google.maps.event.addListener(map, 'dblclick', function(event) {
        
    	lati = event.latLng.lat();
        longi = event.latLng.lng();
        
    	$('#myModal').modal('show');        
     });
}