package com.casualtyApp.model



import java.util.ArrayList;

import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.domain.DomainClassUnitTestMixin} for usage instructions
 */
@TestFor(User)
class UserTests extends GroovyTestCase {

	def User user;
	
	//test validate create user
	void testCreateUser(){
		user=new User();
		assertNotNull("!Error! user null after create! ",user)
	}
	
	//test add max Events
	void testAddEvent1(){
		user=new User();
		
		Event evt;
		for(int i=0;i<5;i++){
			Date t=new Date();
			boolean temp=user.addEvent(new Event(i, "event"+i+"", t, t,"desc "+ i + "", i,new ArrayList<String>() ,1,1,i));
			assertEquals("Error, Event Add failed",temp, true)
			assertNotNull("Error, Event add Null",user.myEvents.get(i))
		}
		assertEquals("Error, Num Event Failed",user.myEvents.size(),5);
		
	}
	
	//test try add events > 5
	void testAddEvent2(){
		user=new User();
		Event evt;
		Date t=new Date();
		boolean temp;
		for(int i=0;i<5;i++){
			temp=user.addEvent(new Event(i, "event"+i+"", t, t,"desc "+ i + "", i,new ArrayList<String>() ,1,1,i));
			assertEquals("Error, Event Add failed",temp, true)
			assertNotNull("Error, Event add Null",user.myEvents.get(i))
		}
		
		temp=user.addEvent(new Event(6, "event"+6+"", t, t,"desc "+ 6 + "", 6,new ArrayList<String>() ,1,1,6));
		assertEquals("Error, Add more than 5 Events",temp, false)
		assertNull("Error, Add event Invalid",user.myEvents.get(6))
		
	}
	
	//test validate two events equals
	void testAddEvent3(){
		user=new User();
		Event evt;
		Date t=new Date();
		boolean temp;
		temp=user.addEvent(new Event(1, "event"+1+"", t, t,"desc "+ 1 + "", 1,new ArrayList<String>() ,1,1,1));
		assertEquals("Error, Event Add failed",temp, true)
		assertNotNull("Error, Event add Null",user.myEvents.get(1))
		
		temp=user.addEvent(new Event(1, "event"+1+"", t, t,"desc "+ 1 + "", 1,new ArrayList<String>() ,1,1,1));
		assertEquals("Error, Add more than 1 Events with the same Id",temp, false)
	}
	
	
	
	//test add max Events
	void testAddGroup1(){
		user=new User();
		Date t=new Date();
		ClassGroup testGroup;
		
		for(int i=0;i<15;i++){
			testGroup=new ClassGroup(i, "group", "description ", t, new ArrayList<Event>(),new ArrayList<User>(), 1)
			boolean temp=user.addGroup(testGroup)
			assertEquals("Error, Group Add failed",temp, true)
			assertNotNull("Error, Group add Null",user.myGroups.get(i))
		}
		assertEquals("Error, Num Groups Failed",user.myGroups.size(),15);
	}
	
	//test try add events > 5
	void testAddGroup2(){
		user=new User();
		Date t=new Date();
		ClassGroup testGroup;
		
		for(int i=0;i<15;i++){
			testGroup=new ClassGroup(i, "group", "description ", t, new ArrayList<Event>(),new ArrayList<User>(), 1)
			boolean temp=user.addGroup(testGroup)
			assertEquals("Error, Group Add failed",temp, true)
			assertNotNull("Error, Group add Null",user.myGroups.get(i))
		}
		assertEquals("Error, Num Groups Failed",user.myGroups.size(),15);
		testGroup=new ClassGroup(16, "group", "description ", t, new ArrayList<Event>(),new ArrayList<User>(), 1)
		boolean temp=user.addGroup(testGroup)
		assertEquals("Error, Add more than 15 Groups",temp, false)
		assertNull("Error, Add Group Invalid",user.myEvents.get(16))
		
	}
	
	//test validate two events equals
	void testAddGroup3(){
		user=new User();
		Date t=new Date();
		ClassGroup testGroup;
		boolean temp;
		testGroup=new ClassGroup(1, "group", "description ", t, new ArrayList<Event>(),new ArrayList<User>(), 1)
		temp=user.addGroup(testGroup)
		assertEquals("Error, Group Add failed",temp, true)
		assertNotNull("Error, Group add Null",user.myGroups.get(1))
		
		testGroup=new ClassGroup(1, "group", "description ", t, new ArrayList<Event>(),new ArrayList<User>(), 1)
		temp=user.addGroup(testGroup)
		assertEquals("Error, Group Add failed",temp, false)
	}

}
