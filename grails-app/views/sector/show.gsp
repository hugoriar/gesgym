
<%@ page import="org.gym.ubicacion.Sector" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'sector.label', default: 'Sector')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-sector" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="sector.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: sectorInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="sector.ciudad.label" default="Ciudad" /></td>
				
				<td valign="top" class="value"><g:link controller="ciudad" action="show" id="${sectorInstance?.ciudad?.id}">${sectorInstance?.ciudad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
