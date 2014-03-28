package com.casualtyApp.model
/*
 * @author: Donato
 */
class User {
	
	def  int idUser
	def  String nameUser
	def  String emailUser
	def  Date createdAt
	def  boolean isUnalConfirmed
	def  TreeMap<Integer,Group> myGroups
	def  TreeMap<Integer,Event> myEvents
	def  int maxGroups
	def  int maxEvents
	
	
	//Constructor
	
	
	public User(int idUser, String nameUser, String emailUser,
			Date createdAt, boolean isUnalConfirmed, TreeMap<Integer,Group> myGroups,
			TreeMap<Integer,Event> myEvents, int maxGroups, int maxEvents) {
		super();
		this.idUser = idUser;
		this.nameUser = nameUser;
		this.emailUser = emailUser;
		this.createdAt = createdAt;
		this.isUnalConfirmed = isUnalConfirmed;
		this.myGroups = myGroups;
		this.myEvents = myEvents;
		this.maxGroups = maxGroups;
		this.maxEvents = maxEvents;
	}
			
	
	//add methods
	def boolean addEvent(Event event){
		if(myEvents.get(event.getIdEvent())==null){
			this.myEvents.put(event.getIdEvent(), event);
			return true;
		}else{
			return false;
		}
	}
	def boolean addGroup(Group group){
		if(myGroups.get(group.getIdGroup())==null){
			this.myGroups.put(group.getIdGroup(), group);
			return true;
		}else{
			return false;
		}
	}
	
	//remove methods
	def boolean removeEvent(Event event){
		if(myEvents.get(event.getIdEvent())!=null){
			this.myEvents.remove(event.getIdEvent());
			return true;
		}else{
			return false;
		}
		
	}
	def boolean removeGroup(Group group){
		if(myEvents.get(group.getIdGroup())!=null){
			this.myEvents.remove(group.getIdGroup());
			return true;
		}else{
			return false;
		}
	}
	def boolean removeEvent(int idEvent){
		if(myEvents.get(idEvent)!=null){
			this.myEvents.remove(idEvent);
			return true;
		}else{
			return false;
		}
		
	}
	def boolean removeGroup(int idGroup){
		if(myEvents.get(idGroup)!=null){
			this.myEvents.remove(idGroup);
			return true;
		}else{
			return false;
		}
	}
	
}
