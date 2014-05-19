package causalityappproject

import groovy.json.JsonBuilder

import com.casualtyApp.model.Event
import com.casualtyApp.model.SecUser
import com.casualtyApp.model.User

class EventsService {
	/*
	 * TODO: Implement HOW to query the events 
	 * 
	 * Por el momento se estan trayendo TODOS los objetos
	 * de la base de datos.
	 */
    def getFirstEvents() {
		def jsonEvents = []
		for( Event e : Event.all ){
			jsonEvents.add( eventToJSON(e) )
		}
		return jsonEvents
    }
	
	
	/*
	 * Convert a event to a JSON object.
	 * 
	 * @author: Felipe
	 */
	def eventToJSON(Event e){
		def builder = new JsonBuilder()
		builder {
			title e.getTitle()
			startTime e.getStartTime().toString()
			endTime e.getEndTime().toString()
			description e.getDescription()
			latitude e.getLatitude()
			longitude e.getLongitude()
			user e.getEventCreator().getUser().getShiroUser().getUsername()
			tags e.tags
		}
		
		return builder.toString()
		
	}
}
