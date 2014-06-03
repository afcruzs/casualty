/*
 * abre el modal del chat y asigna 
 * a el campo eventId el id que le pasan
 * por parametro, es decir el id al cual
 * el user dio click para abrir el chat.
 */
function openChatModal(theId){
	$('#chatModal').modal('show');
	$('#messageBox').val('');
	$('#chatMessages').val('');
	
	document.getElementById('eventId').value = theId;
}

