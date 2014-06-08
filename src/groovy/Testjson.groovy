import groovy.json.JsonBuilder

import com.casualtyApp.model.Event

def builder = new JsonBuilder()

Event e = new Event( title : "The title" )


builder {
	xd e.title
	xd2 "asds"
}



println builder.toString()