<input type="hidden" name="lastDate" id="lastDate" />
<g:each in="${messages}" var="message">
    <div>
    	
    	<g:if test="${message.user.id == myId}">
    		<g:if test="${message.nickname == message.ownerNickName}">
    			<span class="currentNickname">${message.nickname} (Creador)</span>: <span class="msg">${message.message}</span> 
    		</g:if>
    		<g:else>
    			<span class="currentNickname">${message.nickname}</span>: <span class="msg">${message.message}</span>
    		</g:else>
		     
		</g:if>
		<g:else>
			<g:if test="${message.nickname == message.ownerNickName}">
    			<span class="nickname">${message.nickname} (Creador)</span>: <span class="msg">${message.message}</span>
    		</g:if>
    		<g:else>
    			<span class="nickname">${message.nickname}</span>: <span class="msg">${message.message}</span>
    		</g:else>
		     
		</g:else>
    	
    	
    	<div class ="dateMessage" >${message.date}</div>
    	
    	
    </div>
</g:each>