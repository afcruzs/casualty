package com.casualtyApp.model
/*
 * @author: Donato
 */
class User {
	
	def  String emailUser
	def  Date createdAt
	def  boolean isUnalConfirmed
	def SecUser shiroUser
	
	//un usuario puede crear cero o muchos eventos,
	//un usuario puede pertenecer a cero o a muchos grupos
	static hasMany = [event:Event,classGroup:ClassGroup]
	
	//One to one relation ship with shiro instance,
	//Because SecUser class can't be modified.

	
	
	

			
	
	
	
	
	

	
}
