package com.casualtyApp.model

class EventCategory {

	def String name
	def String description
	
 static constraints = {
	 name (nullable: false, blank: false, unique: true, maxSize:300)
	 }
	
	@Override
	public String toString() {
		return "EventCategory [name=" + name + ", description=" + description
				+ "]";
	}	




	public EventCategory(String name, String description) {
		super();
		this.name = name;
		this.description = description;
	}
	
	
    
}
