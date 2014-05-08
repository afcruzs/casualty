<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'login.css')}" />
  <link rel="stylesheet" href="${resource(dir:'bootstrap/css', file:'bootstrap.css')}" />
  <link rel="stylesheet" href="${resource(dir:'bootstrap/css', file:'bootstrap-responsive.css')}" />
  <title>Casualty</title>
</head>
<body>
<section class = "section">
	<h1>Causalty</h1>
  <g:form class = "form">
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
          <td><input type="submit" value="Sign in" onclick = "this.form.action = 'signIn'" class="btn btn-info"/>
         	 <input type="submit" value="Register" onclick = "this.form.action = 'registeraux'" class="btn btn-info"/>
          </td>
        </tr>
      </tbody>
    </table>
  </g:form>
    <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  	</g:if>
  </section>
</body>
</html>
