
<%@ page import="org.control.Ocupacion" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ocupacion.label', default: 'Ocupacion')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ocupacion" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ocupacion.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ocupacionInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ocupacion.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ocupacionInstance, field: "nombre")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
