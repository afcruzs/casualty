import org.apache.shiro.crypto.hash.Sha512Hash

import com.casualtyApp.model.Event
import com.casualtyApp.model.EventCreator
import com.casualtyApp.model.SecRole
import com.casualtyApp.model.SecUser
import com.casualtyApp.model.User

class BootStrap {
	
	def shiroSecurityService
	
    def init = { servletContext ->
		/*
		 * Here users and roles are initalized according to Shiro's rules.
		 * @author: Felipe
		 */
		def adminRole = new SecRole(name: "Administrator")
		adminRole.addToPermissions("*:*")
		adminRole.save()
	   
		def userRole = new SecRole(name:"User")
		userRole.addToPermissions("Home:index")
		userRole.save()
	   
		def admin = new SecUser(username: "Admin", passwordHash: new Sha512Hash("password").toHex())
		admin.addToRoles(adminRole)
		admin.save()
	   
		def user = new SecUser(username: "User", passwordHash: new Sha512Hash("password").toHex())
		user.addToRoles(userRole)
		user.save()
		
		//----------------------------------------------------------------
		//def ArrayList<String> p = new ArrayList<>()
		//p.add("jugar")
		def a = new User(emailUser:'davanegaspr@unal.edu.co',createdAt: new Date(), isUnalConfirmed:true,shiroUser:user, eventCreator : new EventCreator())
		a.save(flush:true,failOnError:true)
		
		//a.addToEvent(new Event(title:'holamundo',startTime:new Date(),endTime:new Date(),description:'divertido',category:2,tags = p,latitude:4.6442081,longitude:-74.100177))
		/*a.save(flush:true,failOnError:true)
	
		//--------------------
		ArrayList<String> tt = new ArrayList<>()
		tt.add("jugar")
		
	    def b = new Event('cienaños',new Date(),new Date(),'divertido',1,tt,4.6442081,-74.100177)
		b.save(flush:true,failOnError:true)*/
		ArrayList<String> tt = new ArrayList<>()
		tt.add("jugar")
		def ev = new Event('cienaños',new Date(),new Date(),'divertido',1,tt,4.6442081,-74.100177)
		a.eventCreator.addToEvents( ev )
		//a.addToClassGroup(new ClassGroup(nameGroup:'futball',description:'deportivo',new Date(),userType:2))
		
		//a.save(flush:true,failOnError:true)
		//new ClassGroup(nameGroup:'futball',description:'deportivo',new Date(),userType:2).save().addToUser(a)
		
		
    }
    def destroy = {
    }
}


   
   



