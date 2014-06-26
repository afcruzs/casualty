package causalityappproject

//import java.util.concurrent.ForkJoinPool;

import groovy.json.JsonBuilder

import com.casualtyApp.model.Event
import com.casualtyApp.model.EventCategory

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
	 * Convierte un evento en un objeto JSON
	 * con propiedades �tiles como el nombre de usuario
	 * para ser mostrado en el mapa.
	 *
	 * @author: Felipe
	 */
	def eventToJSON(Event e){
				//println e.getEventCreator().getUser()
				//println e.getEventCreator().getClassGroup()
		if(e.getEventCreator().getUser() != null ){
				
		   def builder = new JsonBuilder()
				builder {
				title e.getTitle()
				startTime e.getStartTime().toString()
				endTime e.getEndTime().toString()
				description e.getDescription()
				categoryName e.category.name
				latitude e.getLatitude()
				longitude e.getLongitude()
				user e.getEventCreator().getUser().getShiroUser().getUsername()
				tags e.tags
				id e.getId()
			}
		
			return builder.toString()
		}else{
			/*en caso de que el evento fuese creado por un grupo en vez de un Usuario
			 * @author:Diego
			 */
		   def builder = new JsonBuilder()
				builder {
					title e.getTitle()
					startTime e.getStartTime().toString()
					endTime e.getEndTime().toString()
					description e.getDescription()
					categoryName e.category.name
					latitude e.getLatitude()
					longitude e.getLongitude()
					
					user e.getEventCreator().getClassGroup().getNameGroup()
					
					tags e.tags
					id e.getId()
				}
		
				return builder.toString()
		}
	}
	
	/*
	 * Devuelve el nombre de usuario (User o grupo) de un evento dado.
	 * @author :Felipe
	 */
	def getEventOwnerNickName(Event e){
		if(e.getEventCreator().getUser() != null )
			return e.getEventCreator().getUser().getShiroUser().getUsername()
		else
			return e.getEventCreator().getClassGroup().getNameGroup()
	}
	
	/*
	 * consulta la DB para filtrar los eventos de acuerdo al os aprametros pasados.
	 * 
	 * retorna una lista convertida en json para mostar los eventos
	 */
	
	
	def dateEquals(Date d1, Date d2){
		
		if(d1.dateString.equals(d2.dateString))
			return true;
			
		return false;
	}
	
	def filterEvents(Date fechaInicial, Date fechaFinal, String[] tags, String categoria ){
		try{
			/*
			 * Falta implementar el resto de filtros, solo esta categoria
			 * @author: Felipe
			 */
			
			//def events = Event.findAllByCategoryOrStartTimeOrEndTimeOrTags(EventCategory.findByName(categoria),fechaInicial,fechaFinal,tags[0])
			
			print fechaInicial
			
			def events = []
			
			for( Event event : Event.all ){
				if(event.category.name.equals(categoria)){
					events.add(event)
				}
				
				else if(dateEquals(fechaInicial, event.startTime)){
					events.add(event)
				}
				else if(dateEquals(fechaFinal, event.endTime)){
					events.add(event)
				}
				else for(String s : tags){
						if(event.tags.contains(s)){
							events.add(event)
							break
						}
			    }
				
				
			}
			
			def jsonEvents = []
			for( Event e : events ){
				jsonEvents.add( eventToJSON(e) )
			}
			return jsonEvents
		}catch(Exception ex){
			println ex
		}
	}
	
	def allEvents(){
		
		
		try{
			/*
			 * Falta implementar el resto de filtros, solo esta categoria
			 * @author: Felipe
			 */
			
			def events = []
			
			for( Event event : Event.all ){
					events.add(event)
			}
			
			def jsonEvents = []
			for( Event e : events ){
				jsonEvents.add( eventToJSON(e) )
			}
			return jsonEvents
		}catch(Exception ex){
			println ex
		}
		
		
		
	}
}
