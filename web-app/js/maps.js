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
 * Function that is called by the GSP to init the map.
 * First try to get geolocation via getCurrentPosition,
 * if its successful passes do_initialize() as callback function,
 * if fails a alert is show and default loader is called.
 * 
 */
function initialize() {
	default_map_loader();	  
}


function loadMarkerTest(){
	
	/*
	 * Coordinate
	 */
	var coord2 = new google.maps.LatLng(4.6442081,-74.100177);
	
	/*
	 * HTML InfoWindow Content
	 */
	var contentString = '<div id="content">'+
    '<div id="siteNotice">'+
    '</div>'+
    '<h1 id="firstHeading" class="firstHeading">Taller HTML</h1>'+
    '<div id="bodyContent">'+
    '<p><b>HTML</b>, Como nunca antes había sido visto.'+
    '<img src="http://conectica.com.mx/wp-content/uploads/2014/04/Codebabes.com_.png" alt="some_text">'+
    '</div>'+
    '</div>';

	/*
	 * Infowindow and marker
	 */
	var infowindow = new google.maps.InfoWindow({
		content: contentString
	});
	
    var marker = new google.maps.Marker({
        position: coord2,
        map: map,
        title: 'Hello World!'
    });
    
    /*
     * Open Infowindow on marker's click event.
     */
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map,marker);
     });
    
	    

}

/*
 * TODO: Implement how to add a marker with a Domain Class event, 
 * JSON object. 
 */
function showMarker(jsonMarker){
	//... Actually Show marker!
}

/*
 * Inits the map
 */
function default_map_loader(){
	var coord = new google.maps.LatLng(4.6442071,-74.100177);
	var coord2 = new google.maps.LatLng(4.6442081,-74.100177);
	var mapOptions = {
	          center: coord,
	          zoom: 18,
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
    map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
}