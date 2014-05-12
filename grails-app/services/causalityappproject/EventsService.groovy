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
		
		
		Event e = new Event( title : "The title", startTime : new Date(),
			endTime : new Date(), description : "DSDJKASHDFDF", latitude :  4.6442081,
			longitude : -74.100177, user : new User( shiroUser : SecUser.get(1) ) )
		
		ArrayList<String> l = new ArrayList<>()
		l.add("JAJAJ")
		l.add("JEJHJEEJ")
		e.tags = l
		
		
		Event f = new Event( title : "Aquelarreeeeeeeeeeeeeeeeeee", startTime : new Date(),
			endTime : new Date(), description : "DSDJKASHDFDF", latitude :   4.638202,
			longitude : -74.084043, user : new User( shiroUser : SecUser.get(2) ) )
		
		f.tags = l 
		
		return [ eventToJSON(e), eventToJSON(f) ]
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
			user e.getUser().getShiroUser().getUsername()
			tags e.tags
		}
		
		return builder.toString()
		
	}
}
