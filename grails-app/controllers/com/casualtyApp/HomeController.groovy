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
		println SecurityUtils.getSubject().getPrincipal()
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		currentUser.eventCreator.addToEvents( new Event(params.title,parseDate(params.startTime),
												parseDate(params.endTime),params.description,1, params.tags, 
												Double.parseDouble(params.latitude),
												Double.parseDouble(params.longitude)) )
		
		render params
	}
	
	/*
	 * Funcion auxiliar para convertir el string que retorna la vista en un Date
	 */
	def parseDate(String s){
		
		def t = s.split("-")
		int year = Integer.parseInt(t[2])
		int month = Integer.parseInt(t[1])-1
		int day = Integer.parseInt(t[0])
		
		Calendar date = Calendar.getInstance();
		date.set(Calendar.YEAR, year);
		date.set(Calendar.MONTH, month);
		date.set(Calendar.DAY_OF_MONTH, day);
		
		
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
	
}
