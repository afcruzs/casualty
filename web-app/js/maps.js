/*
 * Javascript functions to manipulate the
 * google maps API.
 * 
 * @author: Felipe
 */

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
/*
 * Callback function to initalize the map, by default with zoom 13 
 * and positions as parameters. It inits the map in the HTML finding the
 * div with id "map_canvas".
 */
/*function do_initialize(position){
	
	var lat = position.coords.latitude;
	var lng = position.coords.longitude;
	
	var mapOptions = {
	          center: new google.maps.LatLng(lat, lng),
	          zoom: 13,
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
}*/

/*
 * Inits the map with no position as argument.
 */
function default_map_loader(){
	var mapOptions = {
	          center: new google.maps.LatLng(4.6442071,-74.100177),
	          zoom: 12,
	          mapTypeId: google.maps.MapTypeId.ROADMAP
	        };
    var map = new google.maps.Map(document.getElementById("map_canvas"),
        mapOptions);
}