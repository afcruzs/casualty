package causalityappproject

import groovy.json.JsonBuilder

import com.casualtyApp.model.Event
import com.casualtyApp.model.SecUser
import com.casualtyApp.model.User

class EventsService {
	/*
	 * TODO: Implement HOW to query the events 
	 * on the first show of the google map.
	 * 
	 */
    def getFirstEvents() {
		
		return [ eventToJSON( Event.get(1) ), eventToJSON( Event.get(2) ), eventToJSON( Event.get(3) ), eventToJSON( Event.get(4) ) ]
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
			tags Arrays.asList(e.tags.split(","))
		}
		
		return builder.toString()
		
	}
}
