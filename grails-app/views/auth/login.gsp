<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'login.css')}" />
  <title>Casualty</title>
</head>
<body background = "${resource(dir:'images',file:'fond.jpg')}">
<section class = "section">
	<h1>Causalty</h1>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  
  <g:form class = "form" action="signIn" >
    <input type="hidden" name="targetUri" value="${targetUri}" />
    <table>
      <tbody>
        <tr>
          <td>Username:</td>
          <td><input type="text" name="username" value="${username}" /></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="password" name="password" value="" /></td>
        </tr>
        <tr>
          <td>Remember me?:</td>
          <td><g:checkBox name="rememberMe" value="${rememberMe}" /></td>
        </tr>
        <tr>
          <td />
          <td><input type="submit" value="Sign in" />
         	 <input type="submit" value="Register" />
          </td>
        </tr>
      </tbody>
    </table>
  </g:form>
  </section>
</body>
</html>
