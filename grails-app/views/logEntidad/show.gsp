
<%@ page import="org.control.LogEntidad" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logEntidad.label', default: 'LogEntidad')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logEntidad" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logEntidad.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logEntidadInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logEntidad.nombreTabla.label" default="Nombre Tabla" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logEntidadInstance, field: "nombreTabla")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
