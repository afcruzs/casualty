package com.casualtyApp

import org.apache.shiro.SecurityUtils

import com.casualtyApp.model.Event
import com.casualtyApp.model.Message
import com.casualtyApp.model.SecUser;
import com.casualtyApp.model.User;
import com.sun.org.omg.CORBA.ExcDescriptionSeqHelper;

import grails.converters.JSON

class HomeController {
	
	def eventsService
	public static String var="";
	
	def index() {
	
	session.nickname = SecurityUtils.getSubject().getPrincipal()
	   render( view: "index", model : [ events: eventsService.getFirstEvents(), username :
		   SecurityUtils.getSubject().getPrincipal() ] )
	}
	
	def retrieveLatestMessages(long idEvent) {
		
		
		def messages = Message.list().findAll({ it.event.id == idEvent })
		[messages:messages.reverse()]
	}

	def submitMessage(String message, long idEvent) {
		
		new Message(nickname: session.nickname, message:message, event: Event.get(idEvent)).save()
		render "<script>retrieveLatestMessages()</script>"
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
		def theId;
		try{
			def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
			
			
			
			Event newEvent =  new Event(params.title,parseDate(params.startTime, params.startHour),
													parseDate(params.endTime, params.endHour),params.description,1, params.tags,
													Double.parseDouble(params.latitude),
													Double.parseDouble(params.longitude))
			
			
			
			
			newEvent.addToAssistants(currentUser)
			currentUser.addToEventsToAttend(newEvent)
			currentUser.eventCreator.addToEvents( newEvent ).save(flush: true)
			
			
			while( !newEvent.save(flush: true) );
			render newEvent.id
			
		}catch(Exception e){
			render "Error"+e
		}
		
		
	}
	
	/*
	 * Funcion que sirve para agregar un usuario a la lista de personas que asistirán a un evento
	 * 
	 */
	
	def attendEvent(){
		
		try{
			def eventForAttend = Event.get(params.idevent)
			
						
			def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )			
			eventForAttend.addToAssistants(currentUser)
			currentUser.addToEventsToAttend(eventForAttend)
			render "Success"
		}
		catch(Exception e){
			render "Error"
		}
		
	}
	
	
	
	def isAssistant(){
		try{
			
		System.out.println("parametro  "+params.idevent)
		def eventForAttend = Event.get(params.idevent)	
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )			
		if(currentUser in eventForAttend.assistants){
			render "Yes"
			System.out.println("Es un asistente")
			}
		else{
			render "No"
			}
		}
		catch(Exception e){
			render "Error"
		}
		
	}
	
	def unAttendEvent(){
		try{
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def eventForAttend = Event.get(params.idevent)
		eventForAttend.removeFromAssistants(currentUser)
		currentUser.removeFromEventsToAttend(eventForAttend)
		render "Success"
		}
		catch(Exception e){
			e.printStackTrace();
			render "Error"
		}
		
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
	
	
	def getAssistants(){
		def StringBuilder assistants;
		try{
		def eventAssistants = Event.get(params.idevent).assistants;
		assistants = new StringBuilder();
		
		for(User u in eventAssistants)
			assistants.append(u.getShiroUser().getUsername()+ ",")
		
		if(assistants.length()>0){
			assistants.setLength(assistants.length()-1)
		}
		
		if(assistants.length()>0)
			render assistants
		else
			render "NoAssistants" 
			
		}
		catch(Exception e ){
			
			e.printStackTrace();
			render "Error"
		}
		
	}
	
	
	/*
	 * Obtiene los �ltimos eventos en la DB que sean mayores
	 * al id que se pasa por parametro, estos eventos son convertidos
	 * al json est�ndar que se usa en el servide y se devuelven via
	 * Ajax con el render, para que posteriormente en javascript puedan
	 * ser procesados y le�dos por el mapa.
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
	
	
	/*def getEvents(){
		def events = Event.findAll()
		def jsonEvents = []
		for( Event e : events){
			
			jsonEvents.add( eventsService.eventToJSON(e) )
		}
		render jsonEvents as JSON	
	 }*/
	
	/* Obtiene todos los eventos por nombre para autocompletar en el buscador utilizando
	 * el plugin richui-0.8
	 */
	
	def searchAJAX = {
		def events = Event.findAllByTitleLike("%${params.query}%")

		//Create XML response
		render(contentType: "text/xml") {
		results() {
			events.each { event ->
			result(){
					name(event.title)
					}
				}
			}
		}
	}
	
	
	def changePassword(){
		println ("asdsaeloo")
		redirect(controller: 'home', action: 'index' )
		
		
	}
	
	
	def profile(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def nombresEvent="";
		def descEvent="";
		this.var="";
		for(event in currentUser.eventCreator.events){
			 descEvent=descEvent + event.description + "@"
			 nombresEvent=nombresEvent + event.title + "@"
			 
		 }
		
		render( view: "profile",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresEvent , desc : descEvent , tam : currentUser.eventCreator.events.size()] )
		
	}
	def groups(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def nombresGrupos="";
		def descGrupos="";
		for(group in currentUser.classGroup){
			descGrupos=descGrupos + group.description + "@"
			 nombresGrupos=nombresGrupos + group.nameGroup + "@"
			 
		 }
		
		render( view: "groups",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresGrupos , desc : descGrupos , tam : currentUser.classGroup.size()] )
		
	}
	
		
	
	def publicProfile(){
		def username = params.username
		
		
		var=username.toString();
		if( SecUser.findByUsername(username) != null ){
			def currentUser = User.get( SecUser.findByUsername(username).id )
			
			def namesEvent="";
			def descEvent="";
			for(event in currentUser.eventCreator.events){
				 descEvent=descEvent + event.description + "@"
				 namesEvent=namesEvent + event.title + "@"
				 
			 }
			
			render( view: "publicProfile",model : [user : currentUser , username :
				SecurityUtils.getSubject().getPrincipal() , names : namesEvent , desc : descEvent , tam : currentUser.eventCreator.events.size()] )
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
		this.var="";
		if(params.screenshot!=null &&  params.screenshot.getBytes().size()>0)
			currentUser.screenshot =params.screenshot.getBytes()
		
		if(currentUser.save()){
			redirect(controller: 'home', action: 'profile' )
		}else{
			redirect(controller: 'home', action: 'index' )
		}
		
		
	}
	
	def initPage(){
	}
	
	def showImage()  {
		def currentUser
		if(var.equals("")){
			currentUser=User.get( SecUser.findByUsername( SecurityUtils.getSubject().getPrincipal()).id )
		}else{
			currentUser = User.get( SecUser.findByUsername(var).id )
		}
		def imagen = currentUser.screenshot
		
		
		response.outputStream << currentUser.screenshot
		response.outputStream.flush()
	}
	
}
