
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>Casualty</title>
     <link rel="stylesheet" href="${resource(dir:'css',file:'register.css')}" />
</head>

<body background = "${resource(dir:'images',file:'fond.jpg')}">
<section class = "section">
  <h1>Register</h1>
  
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>

  <g:hasErrors bean="${user}">
    <div class="alert alert-error">
        <g:renderErrors bean="${user}" as="list"/>
    </div>
  </g:hasErrors>
  <g:form action="register" class = "form">
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
          <td>Confirm Password:</td>
          <td><input type="password" name="password2" value="" /></td>
        </tr>
        <tr>
          <td />
          <td><input type="submit" value="Sign up" />
          <input type="submit" value="Back" />
          </td>
        </tr>
      </tbody>
    </table>
  </g:form>
 </section>
</body>

</html>