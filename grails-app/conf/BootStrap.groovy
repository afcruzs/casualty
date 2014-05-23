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
		userRole.addToPermissions("Home:*")
		/*userRole.addToPermissions("Home:index")
		userRole.addToPermissions("Home:saveNewEvent")
		userRole.addToPermissions("Signup:register")
		userRole.addToPermissions("Home:profile")*/
		userRole.save()
	   
		def admin = new SecUser(username: "Admin", passwordHash: new Sha512Hash("password").toHex())
		admin.addToRoles(adminRole)
		admin.save()
	   
		/*def user = new SecUser(username: "User", passwordHash: new Sha512Hash("password").toHex())
		user.addToRoles(userRole)
		user.save()*/
		
		//----------------------------------------------------------------
		//def ArrayList<String> p = new ArrayList<>()
		//p.add("jugar")
		def a = new User(emailUser:'davanegaspr@unal.edu.co',createdAt: new Date(), isUnalConfirmed:true,shiroUser:admin, eventCreator : new EventCreator()
			, name : "Diego", lastName : "Vanegas", biography: "La biografia", ubication : "San Andres")
		a.save(flush:true,failOnError:true)
		
		//a.addToEvent(new Event(title:'holamundo',startTime:new Date(),endTime:new Date(),description:'divertido',category:2,tags = p,latitude:4.6442081,longitude:-74.100177))
		/*a.save(flush:true,failOnError:true)
	
		//--------------------
		ArrayList<String> tt = new ArrayList<>()
		tt.add("jugar")
		
	    def b = new Event('cienaños',new Date(),new Date(),'divertido',1,tt,4.6442081,-74.100177)
		b.save(flush:true,failOnError:true)*/
		
		
		
		
		def ev = new Event('Yoga en la UN ',new Date(),new Date(),'Relajate con Yoga en la UN, es gratis.',1,"Jugar,correr,yoga",4.6348317,-74.0820247)
		a.eventCreator.addToEvents( ev )
		a.eventCreator.addToEvents( new Event('Marcha a la 30',new Date(),new Date(),'Marcha en apoyo al paro agrario',1,"Marcha,campesinos",4.6356794,-74.0825153) )
		a.eventCreator.addToEvents( new Event('Toque al aire libre.',new Date(),new Date(),'Toque al aire libre organizado por la facultad de artes.',1,"Toque, musica, arte",4.635862,-74.0826558) )
		a.eventCreator.addToEvents( new Event('Dona un libro.',new Date(),new Date(),'Donacion de libros para jovenes de bachillerato, dona los libros que ya no uses.',1,"Educacion, libros",4.6352444,-74.082923) )
		//a.addToClassGroup(new ClassGroup(nameGroup:'futball',description:'deportivo',new Date(),userType:2))
		
		//a.save(flush:true,failOnError:true)
		//new ClassGroup(nameGroup:'futball',description:'deportivo',new Date(),userType:2).save().addToUser(a)
		
		
    }
    def destroy = {
    }
}


   
   



