package com.casualtyApp

import org.apache.shiro.SecurityUtils

import com.casualtyApp.model.Event
import com.casualtyApp.model.EventCreator
import com.casualtyApp.model.ClassGroup
import com.casualtyApp.model.EventCategory;
import com.casualtyApp.model.Message
import com.casualtyApp.model.SecUser;
import com.casualtyApp.model.User;
import com.sun.org.omg.CORBA.ExcDescriptionSeqHelper;

import grails.converters.JSON

class HomeController {
	
	def eventsService
	static def ClassGroupTemp;
	
	

	def index() {
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		session.nickname = SecurityUtils.getSubject().getPrincipal()
	    render( view: "index", model : [ events: eventsService.getFirstEvents(), username :
		   SecurityUtils.getSubject().getPrincipal(), userId : currentUser.id ] )
	   

	}
	
	/*
	 * Consigue los mensajes de el evento dado un id, ademas pasa a la vista el myId que representa
	 * el id del user que esta manejando la vista.
	 * 
	 * Se asigna el nombre de usuario del creador de cada evento en cada mensaje para identificar
	 * el creador.
	 */
	def retrieveLatestMessages(long idEvent, long myId, long lastMessageId ) {
		
		if( Event.get(idEvent) != null ){
			try{
				def messages = Message.list().findAll({ it.event.id == idEvent && it.id > lastMessageId })
				messages.sort{it.date}
				messages.each{ it.setOwnerNickName( eventsService.getEventOwnerNickName( it.event ) ) }
				
				render( view  :"retrieveLatestMessages", model : [messages:messages, myId : myId ] )
			}catch( NullPointerException ex ){
				render "DeletedEvent"
			}
			
		}else{
			render "DeletedEvent"
		}
	}

	/*
	 * Guarda el mensaje en la DB y recarga los mensajes.
	 */
	def submitMessage(String message, long idEvent, long userId) {
		
		if( !message.trim().equals("") )
			new Message(nickname: session.nickname, message:message, event: Event.get(idEvent), user : User.get(userId)).save()
		render "<script>retrieveLatestMessages()</script>"
	}

	def admin() {
	   //render "This page requires the logged in user to be an Administrator"
	}
	
	
	def valNameEvent(){
		try{
		def c = Event.countByTitle(params.title);
		print("la cantidad de eventos con el titulo: "+params.title+" es "+ c)
		if(c > 0)
			render "False"
		
		else
			render "True"
		}
		catch(Exception e){
			render "Error"
		}
		
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
			def cat = EventCategory.findByName(params.categoryName)
			
						
			Event newEvent =  new Event(params.title,parseDate(params.startTime, params.startHour),
													parseDate(params.endTime, params.endHour),params.description, params.tags,
													cat, 
													Double.parseDouble(params.latitude),
													Double.parseDouble(params.longitude))
			
			
			
			if( params.selectedGroup.equals("No") ){
				newEvent.addToAssistants(currentUser)
				currentUser.addToEventsToAttend(newEvent)
				currentUser.eventCreator.addToEvents( newEvent ).save(flush: true)
			}else{
				def groupCreator = ClassGroup.findByNameGroup(params.selectedGroup)
				newEvent.addToAssistants(currentUser)
				currentUser.addToEventsToAttend(newEvent)
				groupCreator.eventCreator.addToEvents( newEvent ).save(flush: true)
			}
			
			
			
			while( !newEvent.save(flush: true) );
			render newEvent.id
			
		}catch(Exception e){
			e.printStackTrace();
			render "Error"+e
		}
		
		
	}
	
	
	
	/*
	 * Funcion que sirve para pasar los nombres de las categorias existentes al modal de creación del evento
	 *
	 */
	
	def getCategories(){
		try{
			def categories = EventCategory.getAll()
			def java.lang.StringBuilder categoriesString= new StringBuilder()()
			for(EventCategory cat in categories)
				categoriesString.append(cat.name+",")
			categoriesString.setLength(categoriesString.length()-1)
			render categoriesString
		}
		catch(Exception e ){
			e.printStackTrace();
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
			//System.out.println("Error en attend event "+e)
			render "Error"
		}
		
	}
	
	
	
	def isAssistant(){
		try{
			
		//System.out.println("parametro  "+params.idevent)
		def eventForAttend = Event.get(params.idevent)	
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )			
		if(currentUser in eventForAttend.assistants){
			render "Yes"
			//System.out.println("Es un asistente")
			}
		else{
			render "No"
			}
		}
		catch(NullPointerException e){
			//System.out.println("Error en isAssistant "+e)
			render "ErrorNull"
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
			//System.out.println("Error desatendiendo "+e)
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
	
	
	/*
	*Carga los asistentes a un evento dado su id
	*/
	def getAssistants(){
		def java.lang.StringBuilder assistants;
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
		catch(NullPointerException e ){
			
			//System.out.println("Error en los asistentes "+e)
			render "ErrorNull"
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
					id(event.id)
					}
				}
			}
		}
	}

	def lookAJAX = {
		def groups = ClassGroup.findAllByNameGroupLike("%${params.query}%")
		
		//Create XML response
		render(contentType: "text/xml") {
		results() {
			groups.each { group ->
			result(){
					name(group.getNameGroup())
					id(group.id)
					}
				}
			}
		}
	}
	
	
	/*
	 * Se obtiene un objeto JSON con el id del evento
	 */
	def getEventById(){
		def jsonEvents = []
		def event = Event.get(params.idEvent)
		jsonEvents.add( eventsService.eventToJSON(event) )
		render jsonEvents as JSON
	}
	
	
	def changePassword(){
		println ("asdsaeloo")
		redirect(controller: 'home', action: 'index' )
		
		
	}
	
	//Envía emails a los asistentes al evento
	def sendEmailToAssistants(idEvent){
		
		def Event deletedEvent = Event.get(idEvent)
		def eventAssistants = deletedEvent.assistants
		def String eventName = deletedEvent.title
		for(User assistant in eventAssistants)
		sendMail {
			to assistant.emailUser
			subject "Cancelación del evento:  "+ eventName 
			body 'Hola '+ assistant.name + " decidimos enviarte este e-mail para informarte que el evento: "+eventName+" ha sido cancelado."
		  }
		
		
		
	}
	
	//Borra el evento y llama a enviar emails
	def deleteEvent(){
		try{
			

		Message.executeUpdate("delete from Message where EVENT_ID=:id ",[id: params.idevent])
		
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		sendEmailToAssistants(params.idevent)
		Event.get(params.idevent).delete(flush: true);
		}
		catch(NullPointerException e){
			render "ErrorNull"

		}
	}
	
	
	//Revisa si dado el id de un evento el currentUser es el dueño.
	def isOwner(){
		try{
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def currentEvent = Event.get(params.idevent)
		
		//System.out.println(currentUser.eventCreator.events.get(params.idevent));
		if(currentEvent.eventCreator.id == currentUser.eventCreator.id){
			//System.out.println("Si es el dueño")
			render "Yes"
		}
		else
			render "No"
		
		}
		catch(NullPointerException x){
	
			//System.out.println("Error en el owner "+ x);
			render "ErrorNull"
			
		} 
			
			
		
	}
	
	
	def profile(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def nombresEvent="";
		def descEvent="";
		for(event in currentUser.eventCreator.events){
			 descEvent=descEvent + event.description + "@"
			 nombresEvent=nombresEvent + event.title + "@"
		 }
		
		if(currentUser.eventCreator.events.size()>=1){
			descEvent = descEvent.substring(0, descEvent.size()-1);
			 nombresEvent = nombresEvent.substring(0, nombresEvent.size()-1);
		}
		
		render( view: "profile",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresEvent , desc : descEvent , tam : currentUser.eventCreator.events.size()] )
		
	}
	
	

	def publicProfile(){
		def username = params.username
		
		
		if( SecUser.findByUsername(username) != null || User.findByName(username)!=null){
			def currentUser
			def cond=false
			if(SecUser.findByUsername(username) != null)
				currentUser = User.get( SecUser.findByUsername(username).id )
			else{
				currentUser = User.get( User.findByName(username).id )
			}
			def namesEvent="";
			def descEvent="";
			for(event in currentUser.eventCreator.events){
				 descEvent=descEvent + event.description + "@"
				 namesEvent=namesEvent + event.title + "@"
				 
			 }
			if(currentUser==null || currentUser.screenshot==null){
				cond=false
			}
			
			render( view: "publicProfile",model : [user : currentUser , username :
				SecurityUtils.getSubject().getPrincipal() , names : namesEvent ,
				 desc : descEvent , tam : currentUser.eventCreator.events.size(),temp : username, temp : currentUser.id ] )
		}else{
		
			def currentGroup = ClassGroup.findByNameGroup(params.username)
			def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
			def cond=true
			if(currentGroup==null || currentGroup.screenshot==null){
				cond=false
			}
			
			def namesEvent="";
			def descEvent="";
			for(event in currentGroup.eventCreator.events){
				descEvent=descEvent + event.description + "@"
				namesEvent=namesEvent + event.title + "@"
				
					 
			}
			
			if(currentGroup.eventCreator.events.size()>=1){
				descEvent = descEvent.substring(0, descEvent.size()-1);
				namesEvent = namesEvent.substring(0, namesEvent.size()-1);
			}
			
			
			def nameUsers="";
			for(user in currentGroup.user){
				nameUsers=nameUsers + user.name + "@"
			}
			
			if(currentGroup.user.size()>=1){
				nameUsers = nameUsers.substring(0, nameUsers.size()-1);
			}
			
			
			
			def inGroup = currentGroup.user.contains(currentUser)
			
			render( view: "publicGroup",model : [user : currentUser , username :
			SecurityUtils.getSubject().getPrincipal() , group : currentGroup, cond : cond, inGroup : inGroup , names : namesEvent , 
			desc : descEvent , tam : currentGroup.eventCreator.events.size(), nameUser : nameUsers , tamUser :currentGroup.user.size() ] )
			//render( view: "publicGroup",model : [ groupName : username ] )
			
		}
	}
	
	/*
	 * altamente acoplado con public profile
	 * deben ir igual las condiciones cuando se render publicGroup :v
	 */
	def publicGroupProxy(){
		
		
		def theGroup = ClassGroup.get(params.id)
		
		
		if( theGroup != null ){
			def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
			def cond=true
			if(theGroup.screenshot == null)
				cond=false
			
				
			def namesEvent="";
			def descEvent="";
			for(event in theGroup.eventCreator.events){
				descEvent=descEvent + event.description + "@"
				namesEvent=namesEvent + event.title + "@"
				
					 
			}
			
			def inGroup = theGroup.user.contains(currentUser)
			
			
			render( view: "publicGroup",model : [user : currentUser , username :
					SecurityUtils.getSubject().getPrincipal() , group : theGroup, cond : cond, inGroup : inGroup,  names : namesEvent , desc : descEvent , tam : theGroup.eventCreator.events.size()] )
			
		}else render( view: "index" )
	
			
	}
	
	
	

	def updateProfile(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		currentUser.biography=params.biography
		currentUser.name=params.name
		currentUser.lastName=params.lastName
		currentUser.ubication=params.ubication
		currentUser.emailUser=params.email
		
		if(params.screenshot!=null &&  params.screenshot.getBytes().size()>0)
			currentUser.screenshot =params.screenshot.getBytes()
		
		if(currentUser.save()){
			redirect(controller: 'home', action: 'profile' )
		}else{
			redirect(controller: 'home', action: 'index' )
		}
		
		
	}
	
	
	
	
	
	/**
	 * guarda un grupo en la DB asociado a un usuario
	 * 
	 * */
	
	
	
	
	
	def updateGroups(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def cond=false
		def newGroup;
		if(ClassGroupTemp!=null || params.screenshot!=null){
			if(ClassGroupTemp!=null){
				newGroup = new ClassGroup(screenshot:ClassGroupTemp.screenshot,nameGroup:params.nameGroup ,description:params.descripcionGroup,createAt: new Date(),userType:4,eventCreator : new EventCreator(), adminId : currentUser.id)
				cond=true
			}else{
				newGroup = new ClassGroup(screenshot:params.screenshot,nameGroup:params.nameGroup ,description:params.descripcionGroup,createAt: new Date(),userType:4,eventCreator : new EventCreator(), adminId : currentUser.id)
				cond=true
			}
				
				
			
		}else{
			newGroup = new ClassGroup(nameGroup:params.nameGroup ,description:params.descripcionGroup,createAt: new Date(),userType:4,eventCreator : new EventCreator(), adminId : currentUser.id)
			cond = false
		}
		
		newGroup.save(flush:true)
		
		newGroup.addToUser(currentUser)
	
		
		flash.message = "Grupo creado con exito"
		redirect(action:'groups')
		
		/*render( view: "modifyGroup",model : [user : currentUser , username :
		SecurityUtils.getSubject().getPrincipal() , group : newGroup, cond : cond] )*/
		
		//redirect(controller: 'home', action: 'groups' )
		
		
	}
	
	//VIene de public profile
	def publicGroup(){
		
		print("hola")
	}
	
	
	
	
	def updateGroupCreator(){
		print "entra yaaa"
		def currentGroup = ClassGroup.findByNameGroup(params.nameGroup)
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def cond=true
		if(currentGroup!=null && currentGroup.screenshot==null){
			cond=false
		}
		
		render( view: "modifyGroup",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , group : currentGroup, cond : cond] )
		
		
	}
	
	
	
	/*
	 *Carga la imagen de un grupo antes de ser creado
	 *
	 * */
	
	def loadImage(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def nombresGrupos="";
		def descGrupos="";
		def description =params.descripcionGroup
		def name =params.nameGroup
		def cond=false
		
		if(params.screenshot!=null &&  params.screenshot.getBytes().size()>0){
			ClassGroupTemp = new ClassGroup(nameGroup:"a" ,description:"a",createAt: new Date(),userType:4,eventCreator : new EventCreator())
			ClassGroupTemp.screenshot = params.screenshot.getBytes()
			cond=true
		}
		
		for(group in currentUser.classGroup){
			descGrupos=descGrupos + group.description + "@"
			 nombresGrupos=nombresGrupos + group.nameGroup + "@"
			 
		 }
		
		render( view: "groups",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresGrupos , desc : descGrupos ,
			tam : currentUser.classGroup.size(),description : description , nameGroup : name, cond : cond] )
	}
	
	
	def groups(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def nombresGrupos="";
		def descGrupos="";
		ClassGroupTemp=null;
		for(group in currentUser.classGroup){
			descGrupos=descGrupos + group.description + "@"
			 nombresGrupos=nombresGrupos + group.nameGroup + "@"
			 
		 }
		if(currentUser.classGroup.size()>=1){
			descGrupos = descGrupos.substring(0, descGrupos.size()-1);
			nombresGrupos = nombresGrupos.substring(0, nombresGrupos.size()-1);
		}
		 print descGrupos
		render( view: "groups",model : [user : currentUser , username :
		   SecurityUtils.getSubject().getPrincipal() , names : nombresGrupos , desc : descGrupos , tam : currentUser.classGroup.size(),cond : false] )
	}
	
	
	def modifyImage(){
		def currentGroup = ClassGroup.findById(params.idGroup)
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		def cond=true
		
		currentGroup.nameGroup = params.nameGroup
		currentGroup.description = params.descripcionGroup
		
		if(params.screenshot!=null &&  params.screenshot.getBytes().size()>0){
			currentGroup.screenshot = params.screenshot.getBytes()
		}
		
		if(currentGroup.save(flush:true)){
			print ("guardando grupo")
			
			render( view: "modifyGroup",model : [user : currentUser , username :
				SecurityUtils.getSubject().getPrincipal() , group : currentGroup, cond : cond] )
		}else{
			print("error")
			render( view: "modifyGroup",model : [user : currentUser , username :
				SecurityUtils.getSubject().getPrincipal() , group : currentGroup, cond : cond] )
		}
		
		//flash.message = "Grupo modificado con exito"
		//redirect(action:'modifyGroup')
		
		
	}
	
	
	def initPage(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		session.nickname = SecurityUtils.getSubject().getPrincipal()
		render( view: "initPage", model : [username : SecurityUtils.getSubject().getPrincipal() ] )
		
	}
	
	
	
	
	def showImage()  {
		def currentUser
		println(params.id)
		currentUser = User.get( SecUser.findByUsername(params.id).id )
		
		def imagen = currentUser.screenshot
		
		
		response.outputStream << currentUser.screenshot
		response.outputStream.flush()
	}
	
	
	
	
	def showImageGroup()  {
		response.outputStream << ClassGroupTemp.screenshot
		response.outputStream.flush()
	}
	
	def showImageGroupModify()  {
		def currentGroup = ClassGroup.findByNameGroup(params.id)
		response.outputStream << currentGroup.screenshot
		response.outputStream.flush()
	}
	
	
	def help(){
		
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		session.nickname = SecurityUtils.getSubject().getPrincipal()
		render( view: "help", model : [username : SecurityUtils.getSubject().getPrincipal() ] )
		
	}
	
	def getUserGroups(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		render currentUser.classGroup as JSON
	}
	
	def joinToGroup(){
		def theGroup = ClassGroup.findByNameGroup(params.groupName)
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		
		if( theGroup != null ){
			theGroup.addToUser(currentUser)
			render "Success"
		}else render "ERROR"
	}
	
	def leaveGroup(){
		ClassGroup theGroup = ClassGroup.findByNameGroup(params.groupName)
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		if( theGroup.adminId == currentUser.id ){
			render "EsAdmin"
		}
		else if( theGroup != null  ){
			theGroup.removeFromUser(currentUser)
			render "Success"
		}else render "ERROR"
	}
	
	def deleteGroup(){
		def currentUser = User.get( SecUser.findByUsername(SecurityUtils.getSubject().getPrincipal()).id )
		if( currentUser.id == ClassGroup.get(params.idGroup).adminId && ClassGroup.get(params.idGroup) != null ){
			
			def theGroup = ClassGroup.get(params.idGroup)
			def users = theGroup.user
			
			users.each{u->
				u.removeFromClassGroup(theGroup)
				u.save(flush : true)
			}
			
			theGroup.eventCreator.events.each{event->
				sendEmailToAssistants(event.id)
			}
			
			ClassGroup.get(params.idGroup).delete(flush : true)	
			
			redirect(controller: 'home', action: 'index' )
		}else{
		render( view: "modifyGroup",model : [user : currentUser , username :
			SecurityUtils.getSubject().getPrincipal() , group : ClassGroup.get(params.idGroup)] )
		}
	}
	
}
