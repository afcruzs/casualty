package com.casualtyApp.model

import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha512Hash
import org.apache.shiro.SecurityUtils


class SignupController {

	def index() {
		SecUser user = new SecUser()
		[user: user]
	}
	
	def register(){
		
		/*
		 * @autor Maikol
		 * chequea todos los posibles errores a la hora de registrarse
		 */

		if(params.captcha.equals("false")){

			flash.message = "Captcha ivalido"
			redirect(action:'index')
		
		}else if(params.username.equals("")){
				
			flash.message = "Debe colocar un nombre de usuaio"
			redirect(action:'index')
		
		}else if(params.name.equals("")){
				
			flash.message = "Debe colocar su nombre"
			redirect(action:'index')
		
		}else if(params.lastname.equals("")){
				
			flash.message = "Debe colocar su apellido"
			redirect(action:'index')
		
		}else if(params.password.equals("")){
				
			flash.message = "Debe colocar una contrasena"
			redirect(action:'index')
		
		}else if(params.email.equals("")){
				
			flash.message = "Debe colocar un correo electronico"
			redirect(action:'index')
		
		}else if(params.ubication.equals("")){
				
			flash.message = "Debe colocar su ubicacion"
			redirect(action:'index')
		
		}else{
		// Check to see if the username already exists
		def user = SecUser.findByUsername(params.username)
		if (user) {
			flash.message = "Intente con otro usuario : '${params.username}' ya existe"
			redirect(action:'index')
		}
		
		// User doesn't exist with username. Let's create one
		else {

			// Make sure the passwords match
			if (params.password != params.password2) {
				flash.message = "Las contrasenas no coinciden"
				redirect(action: "index")
			}

			// Passwords match. Let's attempt to save the user
			else {
				// Create user
				user = new SecUser(
						username: params.username,
						passwordHash: new Sha512Hash(params.password).toHex()
				)

				if (user.save()) {

					// Add USER role to new user
					def userRole =  SecRole.findByName('User')
					user.addToRoles(userRole)
					user.save()
					
					
					//save user info in User instance
					
					def userInfo = new User(emailUser:params.email,createdAt: new Date(),
						isUnalConfirmed:isUnalConfirmed(params.email),shiroUser:user,
						eventCreator : new EventCreator(), name : params.name,
						lastName : params.lastname, biography: params.biography,
						ubication : params.ubication)
					
					userInfo.save()
					
					// Login user
					def authToken = new UsernamePasswordToken(user.username, params.password)
					SecurityUtils.subject.login(authToken)
					
					redirect(controller: 'home', action: 'index' )
				}
				else {
					//creo que nunca entrara aqui
					redirect(controller: 'auth', action: 'index')
				}
			}
		}
	  }
	}
	
	def loginaux(){
		redirect(controller: 'auth', action: "index", params: params)
	}
	
	/*
	 * Permite establecer si elcorreo suministrado
	 * es unal.edu.co.
	 *
	 * @author: Felipe
	 */
	def isUnalConfirmed(String email){
		String [] t = email.split("@")
		if( t.length < 2 ) return false
		return t[1].equals("unal.edu.co")
		
	}
	
	
}