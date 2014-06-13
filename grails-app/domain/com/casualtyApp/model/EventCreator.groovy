package com.casualtyApp.model

class EventCreator {
	
	
	static belongsTo  = [user:User,classGroup:ClassGroup]
	
	static hasMany = [events:Event]
	
    static constraints = {
		classGroup(nullable: true)
		user(nullable: true)
		
    }
}
