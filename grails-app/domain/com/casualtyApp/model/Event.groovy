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
	
	
	def void addTag(String tag){
		tags.add(tag)
	}
	def boolean removeTag(String tag){
		return tags.remove(tag)
	}

	//Constructor
	public Event(int idEvent, String title, Date startTime,
			Date endTime, String description, int category, ArrayList<String> tags,
			Double latitude, Double longitude, int idUserCreator) {
		super();
		this.idEvent = idEvent;
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
