
<%@ page import="org.gym.User" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-user" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "username")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.apellidoPaterno.label" default="Apellido Paterno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "apellidoPaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.apellidoMaterno.label" default="Apellido Materno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "apellidoMaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.rut.label" default="Rut" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "rut")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.dv.label" default="Dv" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "dv")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.foto.label" default="Foto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.fechaNacimiento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value"><g:link controller="sexo" action="show" id="${userInstance?.sexo?.id}">${userInstance?.sexo}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.fono.label" default="Fono" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "fono")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.fonoCelular.label" default="Fono Celular" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "fonoCelular")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.fonoTrabajo.label" default="Fono Trabajo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "fonoTrabajo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.domicilio.label" default="Domicilio" /></td>
				
				<td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userInstance?.domicilio?.id}">${userInstance?.domicilio}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.condicionMedica.label" default="Condicion Medica" /></td>
				
				<td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userInstance?.condicionMedica?.id}">${userInstance?.condicionMedica}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.contactoEmergencia.label" default="Contacto Emergencia" /></td>
				
				<td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userInstance?.contactoEmergencia?.id}">${userInstance?.contactoEmergencia}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.enabled.label" default="Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.enabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountExpired.label" default="Account Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.accountLocked.label" default="Account Locked" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.accountLocked}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="user.passwordExpired.label" default="Password Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userInstance?.passwordExpired}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
