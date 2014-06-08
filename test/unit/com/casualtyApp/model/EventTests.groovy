
package com.casualtyApp.model;

import javassist.bytecode.stackmap.BasicBlock.Catch;
import grails.test.mixin.TestFor;

@TestFor(Event)
class EventTests extends GroovyTestCase{

	def Event event
	
	
	void testCreateEvent(){
		Event evt;
		Date ini=new Date(2014,4,3,12,10);
		Date fin=new Date(2014,4,3,12,15);
		evt=new Event(1, "event"+1+"", ini, fin,"desc "+ 1 + "", 1,new ArrayList<String>() ,1,1,1)
		assertNotNull("Error, event create is Null",evt)
	}
	
	void testDateEvent(){
		Event evt;
		Date ini=new Date(2014,4,3,12,15);
		Date fin=new Date(2014,4,3,12,10);
		
		try{
			evt=new Event(1, "event"+1+"", ini, fin,"desc "+ 1 + "", 1,new ArrayList<String>() ,1,1,1)
			
			//fail("Event failed, the start date must be less than the end date");
			
		}catch(Exception e){
		
		}
	}
	

}
