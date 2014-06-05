package com.casualtyApp.model

class Message {

    String nickname
    Date date = new Date()
    String message
	
	Event event
	User user
	
	String ownerNickName
	
	static transients = ['ownerNickName']
	

    static constraints = {

    }
}
