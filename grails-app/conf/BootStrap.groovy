import org.apache.shiro.crypto.hash.Sha512Hash


import com.casualtyApp.model.ClassGroup
import com.casualtyApp.model.Event
import com.casualtyApp.model.EventCategory
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
		

		
		def usuario11/*a*/ = new User(emailUser:'davanegaspr@unal.edu.co',createdAt: new Date(), isUnalConfirmed:true,shiroUser:admin, eventCreator : new EventCreator()
			, name : "Diego", lastName : "Vanegas", biography: "La biografia", ubication : "San Andres")
		usuario11.save(flush:true,failOnError:true)

		
		
		
		def EventCategory deportes = new EventCategory("Deportes", "Categoria relacionada con deportes y actividad física");
		def EventCategory ocio = new EventCategory("Ocio", "Categoria relacionada con juegos de azar, actividades ludicas, etc.");
		def EventCategory academico = new EventCategory("Academico", "Categoria relacionada con temas academicos como: estudiar, dar clases, hacer debates, etc");
		def EventCategory otro = new EventCategory("Otro", "Categoria relacionada con todas las demas cosas");
		

		deportes.save(flush:true)
		ocio.save(flush:true)
		academico.save(flush:true)
		otro.save(flush:true)
		
		def ev = new Event('Yoga en la UN ',new Date(),new Date(),'Relajate con Yoga en la UN, es gratis.',"Jugar,correr,yoga",ocio,4.6348317,-74.0820247)
		
		ev.addToAssistants(usuario11)
		usuario11.addToEventsToAttend(ev)
		usuario11.eventCreator.addToEvents( ev )
		
		
		Event eventoMarcha = new Event('Marcha a la 30',new Date(),new Date(),'Marcha en apoyo al paro agrario',"Marcha,campesinos",otro,4.6356794,-74.0825153)
		
		eventoMarcha.addToAssistants(usuario11)
		usuario11.addToEventsToAttend(eventoMarcha)
		usuario11.eventCreator.addToEvents( eventoMarcha )
		
		
		
		Event eventoToque = new Event('Toque al aire libre.',new Date(),new Date(),'Toque al aire libre organizado por la facultad de artes.',"Toque, musica, arte", ocio,4.635862,-74.0826558)
		
		eventoToque.addToAssistants(usuario11)
		usuario11.addToEventsToAttend(eventoToque)
		usuario11.eventCreator.addToEvents( eventoToque )
		
		
		Event eventoLibro = new Event('Dona un libro.',new Date(),new Date(),'Donacion de libros para jovenes de bachillerato, dona los libros que ya no uses.',"Educacion, libros", academico,4.6352444,-74.082923)
		
		eventoLibro.addToAssistants(usuario11)
		usuario11.addToEventsToAttend(eventoLibro)
		usuario11.eventCreator.addToEvents( eventoLibro )
		
	
		/*creacion de grupos
		 * @author: Diego
		 * */
		
		
		def grupo11 = new ClassGroup(nameGroup:'Pecoras',description:'Viernes de juegos de azar',createAt: new Date(),userType:2,eventCreator : new EventCreator())
		grupo11.save(flush:true,failOnError:true)
		
		grupo11.addToUser(usuario11)
		
		//println e.getEventCreator().getUser()
		
		
		def Evento11 = new Event('Competencia de natacion',new Date(),new Date(),'vive la emocion de la competencia y gana muchos premios',"Nadar,saltar", deportes,4.6362093,-74.0830734)
		Evento11.category = deportes;
		Evento11.addToAssistants(usuario11)
		usuario11.addToEventsToAttend(Evento11)
		grupo11.eventCreator.addToEvents(Evento11)
					
		
		/*se creo un usuario pertenecientes a otro grupo, para poderlo cargar en la inerface
		 * de busqueda de grupos
		 *  @author: Diego
		 * */
	
		
		
		def usuario22 = new User(emailUser:'faarodriguezbe@unal.edu.co',createdAt: new Date(), isUnalConfirmed:true,shiroUser:admin, eventCreator : new EventCreator()
			, name : "Fabian", lastName : "Rodriguez", biography: "La biografia", ubication : "Bogota")
		usuario22.save(flush:true,failOnError:true)
		
		
		def grupo22 = new ClassGroup(nameGroup:'GrupoTenistas',description:'campeonatos',createAt: new Date(),userType:3,eventCreator : new EventCreator())
		grupo22.save(flush:true,failOnError:true)
		
		grupo22.addToUser(usuario22)
					
		
    }
    def destroy = {
    }
}


   
   



