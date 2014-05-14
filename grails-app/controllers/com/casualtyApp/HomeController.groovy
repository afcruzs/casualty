package com.casualtyApp

import org.apache.shiro.SecurityUtils

class HomeController {
	/*
	 * Test methods for authentication
	 */
    def index() {
	
       render( view: "index", model : [ username :  SecurityUtils.getSubject().getPrincipal() ] )
    }

    def admin() {
       //render "This page requires the logged in user to be an Administrator"
    }
	
}
