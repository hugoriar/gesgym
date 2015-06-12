
<%@ page import="org.control.tag.EstadoTag" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoTag.label', default: 'EstadoTag')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-estadoTag" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoTag.nombreEstado.label" default="Nombre Estado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoTagInstance, field: "nombreEstado")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoTag.habilitado.label" default="Habilitado" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${estadoTagInstance?.habilitado}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoTag.descripcionEstado.label" default="Descripcion Estado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoTagInstance, field: "descripcionEstado")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
