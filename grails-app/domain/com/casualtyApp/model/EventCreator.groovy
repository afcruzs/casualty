package com.casualtyApp.model

class EventCreator {
	
	
	static belongsTo  = [user:User]
	
	static hasMany = [events:Event]
	
    static constraints = {
    }
}
