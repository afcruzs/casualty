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
        	if( data != "ERROR")
        		alert('Usted se ha unido a ' + theGroup + ' satisfactoriamente.');
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){ console.log("asdasd"); }
  });
}