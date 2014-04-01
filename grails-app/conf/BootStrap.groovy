import org.apache.shiro.crypto.hash.Sha512Hash

import com.casualtyApp.model.SecRole
import com.casualtyApp.model.SecUser

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
		
    }
    def destroy = {
    }
}
