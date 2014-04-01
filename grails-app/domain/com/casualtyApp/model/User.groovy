package com.casualtyApp.model
/*
 * @author: Donato
 */
class User {
	
	def  int idUser
//	def  String username
	def  String emailUser
	def  Date createdAt
	def  boolean isUnalConfirmed
	def  final static int MAX_EVENTS=5;
	def  final static int MAX_GROUPS=15;
	def  HashMap myGroups;
	def  HashMap myEvents;
	
	//One to one relation ship with shiro instance,
	//Because SecUser class can't be modified.
	def SecUser shiroUser
	
	
	//Default Constructor
	public User(){
		myGroups= new HashMap<Integer,Group>(MAX_GROUPS);
		myEvents= new HashMap<Integer,Event>(MAX_EVENTS);
	}
	
	//Constructor with all fields
	public User(int idUser, String username, String emailUser,
			Date createdAt, boolean isUnalConfirmed, HashMap<Integer,Group> myGroups,
			HashMap<Integer,Event> myEvents, SecUser shiroUser) {
		super();
		this.idUser = idUser;
	//	this.username = username;
		this.emailUser = emailUser;
		this.createdAt = createdAt;
		this.isUnalConfirmed = isUnalConfirmed;
		this.myGroups = myGroups;
		this.myEvents = myEvents;
		this.maxGroups = maxGroups;
		this.maxEvents = maxEvents;
		this.shiroUser = shiroUser;
	}
			
	
	//ADD METHODS
			
			
	//Adds a event to myEvents map, receive an event, then verify if there is no events with that id
	//and if the size of the map is less than MAX_EVENTS
	def boolean addEvent(Event event){
		if(myEvents.get(event.getIdEvent())==null && myEvents.size()<MAX_EVENTS){
			this.myEvents.put(event.getIdEvent(), event);
			return true;
		}else{
			return false;
		}
	}
	
	//Adds a event to myGroups map, receive a group, then verify if there is no groups with that id
	//and if the size of the map is less than MAX_GROUPS
	def boolean addGroup(Group group){
		if(myGroups.get(group.getIdgroup())==null && myGroups.size()<MAX_GROUPS){
			this.myGroups.put(group.getIdGroup(), group);
			return true;
		}else{
			return false;
		}
	}
	
	//remove methods
	//Removes an event if there is some entry in the map with the given id (event.getidEvent())
	def boolean removeEvent(Event event){
		if(myEvents.get(event.getIdEvent())!=null){
			this.myEvents.remove(event.getIdEvent());
			return true;
		}else{
			return false;
		}
		
	}
	//Removes a group if there is some entry in the map with the given id (group.getidGroup())
	def boolean removeGroup(Group group){
		if(myEvents.get(group.getIdGroup())!=null){
			this.myEvents.remove(group.getIdGroup());
			return true;
		}else{
			return false;
		}
	}
	//Removes an event if there is some entry in the map with the given id 
	def boolean removeEvent(int idEvent){
		if(myEvents.get(idEvent)!=null ){
			this.myEvents.remove(idEvent);
			return true;
		}else{
			return false;
		}
		
	}
	//Removes a group if there is some entry in the map with the given id 
	def boolean removeGroup(int idGroup){
		if(myEvents.get(idGroup)!=null){
			this.myEvents.remove(idGroup);
			return true;
		}else{
			return false;
		}
	}
	
}
