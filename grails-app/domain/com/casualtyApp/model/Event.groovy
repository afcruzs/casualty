package com.casualtyApp.model

/*
 * @author: Donato
 */
class Event {
	def  int idEvent
	def  String title
	def  Date startTime
	def  Date endTime
	def  String description
	def  int category
	def  ArrayList<String> tags
	def  Double latitude
	def  Double longitude
	def  int idUserCreator
	
	static belongsTo = [classGroup: ClassGroup,user:User]

	static constraints = {
		
		title (nullable: false, blank: false, unique: true)
		startTime(nullable: false, blank: false, unique: false)
		endTime(nullable: false, blank: false, unique: false)
		description(nullable: false, blank: false, unique: false)
		category(nullable: false, blank: false, unique: false)
		tags(nullable: false, blank: false, unique: false)
		latitude(nullable: false, blank: false, unique: false)
		longitude(nullable: false, blank: false, unique: false)
		idUserCreator(nullable: false, blank: false, unique: false)
	}

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
				+ "\ncategory = " + category + "\ntags = " + tags + "\nlatitude = "
				+ latitude + "\nlongitude = " + longitude + "\nidUserCreator = "
				+ idUserCreator + "]";
	}



	//Default Constructor
	public Event()
	{

	}

	//constructor with all fields
	public Event(int idEvent, String title, Date startTime,
	Date endTime, String description, int category, ArrayList<String> tags,
	Double latitude, Double longitude, int idUserCreator) {
		super();
		this.idEvent = idEvent
		this.title = title;
		this.startTime = startTime;
		this.endTime = endTime;
		this.description = description;
		this.category = category;
		this.tags = tags;
		this.latitude = latitude;
		this.longitude = longitude;
		this.idUserCreator = idUserCreator;
	}
	
	


}
