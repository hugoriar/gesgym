
<%@ page import="org.gym.LogCambiosDeEstado" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logCambiosDeEstado" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.fechaDeOperacion.label" default="Fecha De Operacion" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${logCambiosDeEstadoInstance?.fechaDeOperacion}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.modalidad.label" default="Modalidad" /></td>
				
				<td valign="top" class="value"><g:link controller="modalidad" action="show" id="${logCambiosDeEstadoInstance?.modalidad?.id}">${logCambiosDeEstadoInstance?.modalidad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.socio.label" default="Socio" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${logCambiosDeEstadoInstance?.socio?.id}">${logCambiosDeEstadoInstance?.socio?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.estadoAntiguo.label" default="Estado Antiguo" /></td>
				
				<td valign="top" class="value"><g:link controller="estadoMembresia" action="show" id="${logCambiosDeEstadoInstance?.estadoAntiguo?.id}">${logCambiosDeEstadoInstance?.estadoAntiguo?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.estadoNuevo.label" default="Estado Nuevo" /></td>
				
				<td valign="top" class="value"><g:link controller="estadoMembresia" action="show" id="${logCambiosDeEstadoInstance?.estadoNuevo?.id}">${logCambiosDeEstadoInstance?.estadoNuevo?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logCambiosDeEstado.observacion.label" default="Observacion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logCambiosDeEstadoInstance, field: "observaciones")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
