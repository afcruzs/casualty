package com.casualtyApp.model

class ClassGroup{
	/*
	 * 
	 * @author: Diego
	 */
	def int idGroup
	def String nameGroup
	def String description
	def Date createAt
	def HashMap groupEvents
	def ArrayList<User> members
	def static final int MAX_EVENTS = 10
	def int userType
	
	def boolean addEvent(Event NameEvent)
	{
		if(groupEvents.get(NameEvent.getIdEvent())== null && groupEvents.size() < MAX_EVENTS)
		{
			this.groupEvents.put(NameEvent.getIdEvent(), NameEvent);
		    return true;
		}else{
		    return false;
		}
	}
	
	def boolean removeEvent(Event NameEvent)
	{
		if(groupEvents.get(NameEvent.getIdEvent()) != null){
			this.groupEvents.remove(NameEvent.getIdEvent());
			return true;
		}else{
			return false;
		}
	}
	
	public String toString(){
		//String lol = "";
		//for (Map.Entry<Integer, Event> entry : groupEvents.entrySet()) {
			//lol += "Key = " + entry.getKey() + ", Value = " + entry.getValue();
		//}
		return "pecora";
	}
	
	def void addUser(User NameUser)
	{
		members.add(NameUser)
	}
	
	//Default Constructor
	public ClassGroup()
	{
			groupEvents = new HashMap<Integer,Event>(MAX_EVENTS);
	}
	
	//Default Constructor
	public ClassGroup(int idGroup,String nameGroup,String description,Date createAt,
		ArrayList<Event> groupEvents,ArrayList<User> members,int userType)
	{
		super();
		this.idGroup = idGroup;
		this.nameGroup = nameGroup;
		this.description = description;
		this.createAt = createAt;
		this.groupEvents = groupEvents;
		this.members = members;
		this.userType = userType;
		
	}

	
	
}
