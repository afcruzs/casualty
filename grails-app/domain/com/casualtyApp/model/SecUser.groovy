package com.casualtyApp.model

import java.util.Date;
import java.util.HashMap;

class SecUser { 
    String username
    String passwordHash
	
	static hasMany = [ roles: SecRole, permissions: String ]
	
    static constraints = {
        username(nullable: false, blank: false, unique: true)
    }
	
}
