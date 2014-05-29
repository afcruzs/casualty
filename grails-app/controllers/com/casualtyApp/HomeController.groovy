package com.casualtyApp

import org.apache.shiro.SecurityUtils

import com.casualtyApp.model.Event
import com.casualtyApp.model.SecUser;
import com.casualtyApp.model.User;
import grails.converters.JSON

class HomeController {
	/*
	 * Test methods for authentication
	 */
	
	def eventsService
	
	def index() {
	
	   render( view: "index", model : [ events: eventsService.getFirstEvents(), username :
		   SecurityUtils.getSubject().getPrincipal() ] )
	}

	def admin() {
	   //render "This page requires the logged in user to be an Administrator"
	}
	
	/*
	 * Se salva el nuevo evento en la base de datos relacionandolo con
	 * el usuario actualmente logueado.
	 *
	 * @author: Felipe
	 */
	def saveNewEvent(){
		try{
			def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
			currentUser.eventCreator.addToEvents( new Event(params.title,parseDate(params.startTime, params.startHour),
													parseDate(params.endTime, params.endHour),params.description,1, params.tags,
													Double.parseDouble(params.latitude),
													Double.parseDouble(params.longitude)) )
		}catch(Exception e){
			render "Error"
		}
		render "Success"
		
	}
	
	/*
	 * Funcion auxiliar para convertir el string que retorna la vista en un Date
	 */
	def parseDate(String d,String hour){
		
		def t = d.split("-")
		int year = Integer.parseInt(t[0])
		int month = Integer.parseInt(t[1])-1
		int day = Integer.parseInt(t[2])
		
		def h = hour.split(":")
		int _hour = Integer.parseInt( h[0] )
		int minute = Integer.parseInt( h[1] )
		
		Calendar date = Calendar.getInstance();
		date.set(Calendar.YEAR, year);
		date.set(Calendar.MONTH, month);
		date.set(Calendar.DAY_OF_MONTH, day);
		
		
		date.set(Calendar.HOUR_OF_DAY, _hour)
		date.set(Calendar.MINUTE, minute)
		
		
		
		return date.getTime()

		
	}
	
	
	/*
	 * Obtiene los últimos eventos en la DB que sean mayores
	 * al id que se pasa por parametro, estos eventos son convertidos
	 * al json estándar que se usa en el servide y se devuelven via
	 * Ajax con el render, para que posteriormente en javascript puedan
	 * ser procesados y leídos por el mapa.
	 *
	 * @author: felipe
	 */
	def getLastEvents(){
		def lastEvents = Event.findAllByIdGreaterThan(params.lastEventId)
		def jsonEvents = []
		for( Event e : lastEvents)
			jsonEvents.add( eventsService.eventToJSON(e) )
		
		render jsonEvents as JSON
	}
	
	def changePassword(){
		println ("asdsaeloo")
		redirect(controller: 'home', action: 'index' )
		
		
	}
	
	def profile(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		
		def nombresEvent="";
		def descEvent="";
		
		for(event in currentUser.eventCreator.events){
			 descEvent=descEvent + event.title + "@"
			 nombresEvent=nombresEvent + event.title + "@"
			 
		 }
		render( view: "profile",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresEvent , desc : descEvent , tam : currentUser.eventCreator.events.size()] )
		
	}
	
	
	
	
	def publicProfile(){
		def username = params.username
		
		if( SecUser.findByUsername(username) != null ){
			def currentUser = User.get( SecUser.findByUsername(username).id )
			render( view: "publicProfile",model : [user : currentUser , username :
				username , names : [] , desc : [] ] )
		}else{
			render( view: "publicGroup",model : [ groupName : username ] )
			
		}
		
		
	}
	
	def publicGroup(){

	}
	
	def updateProfile(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		
		currentUser.biography=params.biography
		currentUser.name=params.name
		currentUser.lastName=params.lastName
		currentUser.ubication=params.ubication
		currentUser.emailUser=params.email
		
		if(currentUser.save()){
			redirect(controller: 'home', action: 'index' )
		}else{
			redirect(controller: 'home', action: 'index' )
		}
		
		
	}
	
}
