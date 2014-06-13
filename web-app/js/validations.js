		
	


	function validateInitialDate(){
		var date = document.getElementById("date2").value;
		var btnSave = document.getElementById("btnSave1");
		var initialDateInput = document.getElementById("date2");
		var currentDate = new Date();
		var aux = currentDate.getMonth()+1;
		var aux1 = currentDate.getDate();
		var curDateR = currentDate.getFullYear()+""+aux+""+aux1;
		var aux2 = parseInt( date.split("-")[1]);
		var initialDateR = parseInt(date.split("-")[2]+aux2+ date.split("-")[0]);
		if(initialDateR < curDateR){
			initialDateInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
		}
		initialDateInput.style.border="1px solid #cdc9c9";
		btnSave.disabled = false;
		return true;
	}
	
	function equalsDate(date){
		
		var initialDateInput = document.getElementById("date2");
		var currentDate = new Date();
		var aux = currentDate.getMonth()+1;
		var aux1 = currentDate.getDate();
		var curDateR = currentDate.getFullYear()+""+aux+""+aux1;
		var aux2 = parseInt( date.split("-")[1]);
		var initialDateR = parseInt(date.split("-")[2]+aux2+ date.split("-")[0]);

		if(initialDateR == curDateR){
			
			return true;
		}
		return false;
	}
	
	function validateInitialTime(){
		var time = document.getElementById("start_hour").value;
		var btnSave = document.getElementById("btnSave1");
		var initialTimeInput = document.getElementById("start_hour");
		var currentDate = new Date();
		var curTimeR = currentDate.getHours()+""+currentDate.getMinutes();
		if(time==""){
			initialTimeInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
		}
		var initialTimeR = parseInt( time.split(":")[0]+ time.split(":")[1]);
		if(equalsDate(document.getElementById("date2").value) ){
			if(initialTimeR < curTimeR){
				initialTimeInput.style.border="1px solid #ff0000";
				btnSave.disabled = true;
				return false;
			}
		}
		initialTimeInput.style.border="1px solid #cdc9c9";
		btnSave.disabled = false;
		return true;
	}
	
	
	function getDate(){
		fecha = new Date();
		var a=fecha.getDate();
		var b=fecha.getMonth()+1;
		if(a<10){
			a="0"+a;
		}
		if(b<10){
			b="0"+b;
		}
		var cad = a +"-" +b +"-" +fecha.getFullYear();

		//valor.value =""+fecha.getDate+"-"+fecha.getFullYear()+"";
		document.getElementById('date2').value = cad;
		document.getElementById('date').value = cad;
		//$("#d").val(new Date().toISOString().substring(0, 10));
	}
	
	function validationFinalDate(){
		var date = document.getElementById("date").value;
		var btnSave = document.getElementById("btnSave1");
		var finalDateInput = document.getElementById("date");
		var initialDate = document.getElementById("date2").value;
		var initialDateR = parseInt(initialDate.split("-")[2]+""+parseInt( initialDate.split("-")[1])+""+ initialDate.split("-")[0]);
		var finalDateR = parseInt(date.split("-")[2]+""+parseInt( date.split("-")[1])+""+ date.split("-")[0]);
		if(finalDateR < initialDateR){
			finalDateInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
		}
		finalDateInput.style.border="1px solid #cdc9c9";
		btnSave.disabled = false;
		return true;
	}
	
	function validateFinalTime(){
		var time=document.getElementById("end_hour").value;
		var iniTime = document.getElementById("start_hour").value;
		var btnSave = document.getElementById("btnSave1");
		var finalTimeInput = document.getElementById("end_hour");
		var currentDate = new Date();
		var initialTimeR =parseInt( iniTime.split(":")[0]+ iniTime.split(":")[1]);
		if(time==""){
			finalTimeInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
		}
		var finalTimeR = parseInt( time.split(":")[0]+ time.split(":")[1]);
		if(equalsDate(document.getElementById("date").value) ){
			if(finalTimeR < initialTimeR){
				finalTimeInput.style.border="1px solid #ff0000";
				btnSave.disabled = true;
				return false;
			}
		}
		finalTimeInput.style.border="1px solid #cdc9c9";
		btnSave.disabled = false;
		return true;
	}
	
	function validateEventName(){
		var suc = false;
		var titleInput = document.getElementById("nombre_evento");
		var btnSave = document.getElementById("btnSave1");
		var title = document.getElementById("nombre_evento").value;
		if(title==""){
			titleInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
		}
		
		jQuery.ajax({
		 	 
	        type:'POST', 
	        data :  { "title" : title},
	        url:"valNameEvent",
	        async : false,
	        success:function(data,textStatus){
	        	if( data == "Error" )
	        		alert("Ha ocurrido un error");
	        	if( data == "True" )
	        		suc=true;
	        	if( data == "False" )
	        		suc = false;
	        },
	        error:function(XMLHttpRequest,textStatus,errorThrown){   }
	  });
		
		if(suc){
			titleInput.style.border="1px solid #cdc9c9";
			btnSave.disabled = false;
			return true;
		}
		else{
			titleInput.style.border="1px solid #ff0000";
			btnSave.disabled = true;
			return false;
			
		}
	
		
	}
	