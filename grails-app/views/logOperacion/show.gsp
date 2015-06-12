
<%@ page import="org.control.LogOperacion" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logOperacion.label', default: 'LogOperacion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logOperacion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.tipoOperacion.label" default="Tipo Operacion" /></td>
				
				<td valign="top" class="value"><g:link controller="logTipoOperacion" action="show" id="${logOperacionInstance?.tipoOperacion?.id}">${logOperacionInstance?.tipoOperacion?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.entidad.label" default="Entidad" /></td>
				
				<td valign="top" class="value"><g:link controller="logEntidad" action="show" id="${logOperacionInstance?.entidad?.id}">${logOperacionInstance?.entidad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.idEntidad.label" default="Id Entidad" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logOperacionInstance, field: "idEntidad")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.modalidad.label" default="Modalidad" /></td>
				
				<td valign="top" class="value"><g:link controller="modalidad" action="show" id="${logOperacionInstance?.modalidad?.id}">${logOperacionInstance?.modalidad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.personal.label" default="Personal" /></td>
				
				<td valign="top" class="value"><g:link controller="userPersonal" action="show" id="${logOperacionInstance?.personal?.id}">${logOperacionInstance?.personal?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.socio.label" default="Socio" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${logOperacionInstance?.socio?.id}">${logOperacionInstance?.socio?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.atributo.label" default="Atributo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logOperacionInstance, field: "atributo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.valorAntiguo.label" default="Valor Antiguo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logOperacionInstance, field: "valorAntiguo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.valorNuevo.label" default="Valor Nuevo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logOperacionInstance, field: "valorNuevo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.observaciones.label" default="Observaciones" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logOperacionInstance, field: "observaciones")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logOperacion.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${logOperacionInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
