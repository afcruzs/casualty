package com.casualtyApp

class HomeController {
	/*
	 * Test methods for authentication
	 */
    def index() {
       render( view: "index", model : [ username :  params.username ] )
    }

    def admin() {
       //render "This page requires the logged in user to be an Administrator"
    }
	
}
