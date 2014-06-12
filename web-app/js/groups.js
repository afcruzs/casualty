/**
 * Metodo para unirse a un grupo.
 * 
 *  @author: Felipe
 */

function joinToGroup(theGroup){
	
	jQuery.ajax({
	 	 
        type:'POST', 
        data : { "groupName" : theGroup},
        url:"joinToGroup",
        success:function(data,textStatus){ 
        	if( data != "ERROR"){
        		//alert('Usted se ha unido a ' + theGroup + ' satisfactoriamente.');
        		location.reload();
        	}
        	
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){ console.log("asdasd"); }
  });
}

function leaveGroup(theGroup){
	jQuery.ajax({
	 	 
        type:'POST', 
        data : { "groupName" : theGroup},
        url:"leaveGroup",
        success:function(data,textStatus){ 
        	if( data != "ERROR"){
        		//alert('Usted ha abandonado ' + theGroup + ' satisfactoriamente.');
        		location.reload();
        	}

        },
        error:function(XMLHttpRequest,textStatus,errorThrown){ }
  });
}