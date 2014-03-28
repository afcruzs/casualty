package com.casualtyApp

import com.casualtyApp.model.User


/*
 * 	This controller handles CRUD operations on Users.
 */

class UserController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() { }
	
	def create() { 
		
		def newUser = new User()
		newUser.properties = params
		newUser.save()
		return [userInstance: newUser]
		
	}
	
	def read() { }
	
	def update() { }
	
	def delete() { }
	
	//Shows content
	def list(){
		render User.getAll()
	}
}
