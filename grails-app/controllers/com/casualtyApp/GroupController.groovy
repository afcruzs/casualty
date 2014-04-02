package com.casualtyApp

import java.util.ArrayList;
import java.util.Date;

import com.casualtyApp.model.Group
import com.casualtyApp.model.Event


/*
 * 	This controller handles CRUD operations on Group.
 */


class GroupController {

    def index() { 
		
		def g = new Group();
		
		//def h = new Event(2, "dcbsh", Date startTime,
			//Date endTime, "chdsvc", 3, ArrayList<String> tags,
			//3.5, 5.6, 435);
		//def i = new Event();
		//def j = new Event();
		
		//g.addEvent(h);
		//g.addEvent(i);
		//g.addEvent(j);
		render g 
	
	}
	
	def create() {
		
		
	}
	
	def read() { }
	
	def update() { }
	
	def delete() { }
}
