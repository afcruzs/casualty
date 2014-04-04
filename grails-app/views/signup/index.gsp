
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Registro</title>
    <meta name="layout" content="main"/>
</head>

<body>
  <h1>Registrese</h1>
  
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <g:hasErrors bean="${user}">
    <div class="alert alert-error">
        <g:renderErrors bean="${user}" as="list"/>
    </div>
  </g:hasErrors>

  <g:form action="register">
    <table>
      <tbody>
        <tr>
          <td>Nombre de usuario:</td>
          <td><input type="text" name="username" value="${username}" /></td>
        </tr>
        <tr>
          <td>Contraseña:</td>
          <td><input type="password" name="password" value="" /></td>
        </tr>
        <tr>
          <td>Confirme Contraseña:</td>
          <td><input type="password" name="password2" value="" /></td>
        </tr>
        <tr>
          <td />
          <td><input type="submit" value="Sign up" /></td>
        </tr>
      </tbody>
    </table>
  </g:form>
</body>

</html>