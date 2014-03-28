<!DOCTYPE html>
<html>
	<head>
		<title>Causality App</title>
		<meta name="layout" content="main" charset="utf-8"/>
	</head>
	<body>
		 Registro (por el momento)
		
		<form method = "post" class = "registrar">

			<div><label>Name:</label><input type = "text" name = "nameUser"/></div>

			<div><label>Password:</label><input type = "password" name = "passwordUser"/></div>

			<div><label>Confirm Password:</label><input type = "password" name = "confirmPasswordUser"/></div>

			<div><label>E-mail:</label><input type = "email" name = "emailUser"/></div>

			<div><input name = "register" onclick = "this.form.action = 'hi'" type = "submit" value = "Register"/>
				<input name = "back" onclick = "this.form.action = 'index'"type = "submit" value = "Back"/></div>	
		</form>
		
	<footer>
	</footer>
	</body>
</html>