
<%@ page import="org.gym.ContactoEmergencia" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'contactoEmergencia.label', default: 'ContactoEmergencia')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-contactoEmergencia" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.nombreContactoEmergencia.label" default="Nombre Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "nombreContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.apellidoPaternoContactoEmergencia.label" default="Apellido Paterno Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "apellidoPaternoContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.apellidoMaternoContactoEmergencia.label" default="Apellido Materno Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "apellidoMaternoContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.fonoCasaContactoEmergencia.label" default="Fono Casa Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "fonoCasaContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.fonoCelularContactoEmergencia.label" default="Fono Celular Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "fonoCelularContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.fonoTrabajoContactoEmergencia.label" default="Fono Trabajo Contacto Emergencia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: contactoEmergenciaInstance, field: "fonoTrabajoContactoEmergencia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.parentescoContactoEmergencia.label" default="Parentesco Contacto Emergencia" /></td>
				
				<td valign="top" class="value"><g:link controller="parentesco" action="show" id="${contactoEmergenciaInstance?.parentescoContactoEmergencia?.id}">${contactoEmergenciaInstance?.parentescoContactoEmergencia}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="contactoEmergencia.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${contactoEmergenciaInstance?.usuario?.id}">${contactoEmergenciaInstance?.usuario}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
