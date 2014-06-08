package com.casualtyApp.model

/*
 * @author: Donato
 */
class Event {
	def  String title
	def  Date startTime
	def  Date endTime
	def  String description
	def  String tags
	def  Double latitude
	def  Double longitude
	def  EventCategory category 
	
	static belongsTo = [eventCreator:EventCreator]
	static hasMany = [assistants: User]
	
	
	  //------------------------
	/*ninguno de los atributos se permite que sean nulos, no sean espacios en blanco
	 * y que ninguno sea unico excepto por el titulo que no se permite.
	 * @author: Diego
	 * */
	static constraints = {
		title (nullable: false, blank: false, unique: true, maxSize:300)
		startTime(nullable: false, blank: false, unique: false)
		endTime(nullable: false, blank: false, unique: false)
		description(nullable: false, blank: false, unique: false, maxSize:800)
		tags(nullable: false, blank: false, unique: false)
		latitude(nullable: false, blank: false, unique: false)
		longitude(nullable: false, blank: false, unique: false)
	}
	//---------------------------

	def void addTag(String tag){
		tags.add(tag)
	}
	def boolean removeTag(String tag){
		return tags.remove(tag)
	}

	@Override
	public String toString() {
		return "Event title = " + title + "\nstartTime = " + startTime
				+ "\nendTime = " + endTime + "\ndescription = " + description
				+ "\ntags = " + tags + "\nlatitude = "
				+ latitude + "\nlongitude = " + longitude + "]";
	}

	//constructor with all fields
	public Event(String title, Date startTime,
	Date endTime, String description, String tags,EventCategory category,
	Double latitude,Double longitude) {
		super();

		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
		this.tags = tags;
		this.category= category;
		this.latitude = latitude;
		this.longitude = longitude;
		
	}
	
	


}