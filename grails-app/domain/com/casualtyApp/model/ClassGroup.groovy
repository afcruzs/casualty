package com.casualtyApp.model

class ClassGroup{
	/*se eliminaron atributos redundantes y tablas que el el Gorm ya crea por debajo,
	 * se eliminaron los constructores ya que su funcion de ingreso de datos tambien es construido por el GORM
	 * @author: Diego
	 */
	def String nameGroup
	def String description
	def Date createAt
	def int userType
	
	def EventCreator eventCreator
	
	static belongsTo = User
	static hasMany = [user:User] //un grupo puede crear cero o muchos eventos, un grupo puede contener minimo un o muchos usuarios
	
	/*ninguno de los atributos se permite que sean nulos, no sean espacios en blanco
	 * y que ninguno sea unico excepto por el nombre del grupo.
	 * @author: Diego
	 * */
	static constraints = {
		nameGroup (nullable: false, blank: false, unique: true, maxSize:300)
		eventCreator(nullable: true)
		description(nullable: false, blank: false,unique: false,maxSize:800)
		   createAt(nullable: false, blank: false, unique: false)
		   userType(nullable: false, blank: false, unique: false)
	}
	
		
	public String toString(){
		return "pecora";
	}
		
}
