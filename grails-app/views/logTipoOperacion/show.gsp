
<%@ page import="org.control.LogTipoOperacion" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logTipoOperacion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logTipoOperacion.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logTipoOperacionInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logTipoOperacion.color.label" default="Color" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logTipoOperacionInstance, field: "color")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logTipoOperacion.observaciones.label" default="Observaciones" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logTipoOperacionInstance, field: "observaciones")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logTipoOperacion.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${logTipoOperacionInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
