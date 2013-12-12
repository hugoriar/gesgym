
<%@ page import="org.gym.CargoInterno" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cargoInterno.label', default: 'CargoInterno')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-cargoInterno" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cargoInterno.nombreCargo.label" default="Nombre Cargo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cargoInternoInstance, field: "nombreCargo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cargoInterno.descripcionCargo.label" default="Descripcion Cargo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: cargoInternoInstance, field: "descripcionCargo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cargoInterno.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${cargoInternoInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="cargoInterno.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${cargoInternoInstance?.lastUpdated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
