package com.casualtyApp.model
/*
 * @author: Donato
 */
class User {
	/*Se eliminaron atributos redundantes y tablas que el el Gorm ya crea por debajo,
	 * se eliminaron los constructores ya que su funcion de ingreso de datos tambien es construido por el GORM
	 * @author: Diego
	 */	
	def  String emailUser
	def  Date createdAt
	def  boolean isUnalConfirmed
	def SecUser shiroUser
	
	def EventCreator eventCreator
	
	def String name
	def String lastName
	def String biography
	def String ubication
	
	/*Un usuario puede crear cero o muchos eventos,
	 * un usuario puede pertenecer a cero o a muchos grupos.
	 * No se permite que la fecha de creacion sea anterior a la fecha actual
	 *  @author: Diego
	 * */
	
	static hasMany = [classGroup:ClassGroup, eventsToAttend: Event]
	static belongsTo = Event
	
	
	static constraints = {
		 emailUser(nullable: false, blank: false, unique: false,email:true)
		 eventCreator(nullable: true)
		 isUnalConfirmed(nullable: false, blank: false, unique: false)
		 createdAt(nullable: false, blank: false, unique: false,/*validator: { if (it?.compareTo(new Date()) < 0 )
						 {
							return false
						 }
						 return true
	}*/)
		  
	}
	
	//One to one relation ship with shiro instance,
	//Because SecUser class can't be modified.
	
}
