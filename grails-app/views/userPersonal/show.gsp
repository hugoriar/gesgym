
<%@ page import="org.gym.UserPersonal" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userPersonal.label', default: 'UserPersonal')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userPersonal" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "username")}</td>
				
			</tr>
		
			%{--<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.password.label" default="Password" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "password")}</td>
				
			</tr>--}%
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.apellidoPaterno.label" default="Apellido Paterno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "apellidoPaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.apellidoMaterno.label" default="Apellido Materno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "apellidoMaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.rut.label" default="Rut" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "rut")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.dv.label" default="Dv" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "dv")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.foto.label" default="Foto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstance?.fechaNacimiento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value"><g:link controller="sexo" action="show" id="${userPersonalInstance?.sexo?.id}">${userPersonalInstance?.sexo}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.fono.label" default="Fono" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "fono")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.fonoCelular.label" default="Fono Celular" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "fonoCelular")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.fonoTrabajo.label" default="Fono Trabajo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "fonoTrabajo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.domicilio.label" default="Domicilio" /></td>
				
				<td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userPersonalInstance?.domicilio?.id}">${userPersonalInstance?.domicilio}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.condicionMedica.label" default="Condicion Medica" /></td>
				
				<td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userPersonalInstance?.condicionMedica?.id}">${userPersonalInstance?.condicionMedica}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.contactoEmergencia.label" default="Contacto Emergencia" /></td>
				
				<td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userPersonalInstance?.contactoEmergencia?.id}">${userPersonalInstance?.contactoEmergencia}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.enabled.label" default="Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstance?.enabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.accountExpired.label" default="Account Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstance?.accountExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.accountLocked.label" default="Account Locked" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstance?.accountLocked}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.passwordExpired.label" default="Password Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstance?.passwordExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonal.cargo.label" default="Cargo" /></td>
				
				<td valign="top" class="value"><g:link controller="cargoInterno" action="show" id="${userPersonalInstance?.cargo?.id}">${userPersonalInstance?.cargo}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
