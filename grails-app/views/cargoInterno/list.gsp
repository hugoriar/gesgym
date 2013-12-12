
<%@ page import="org.gym.CargoInterno" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cargoInterno.label', default: 'CargoInterno')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-cargoInterno" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreCargo" title="${message(code: 'cargoInterno.nombreCargo.label', default: 'Nombre Cargo')}" />
			
				<g:sortableColumn property="descripcionCargo" title="${message(code: 'cargoInterno.descripcionCargo.label', default: 'Descripcion Cargo')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'cargoInterno.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'cargoInterno.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${cargoInternoInstanceList}" status="i" var="cargoInternoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${cargoInternoInstance.id}">${fieldValue(bean: cargoInternoInstance, field: "nombreCargo")}</g:link></td>
			
				<td>${fieldValue(bean: cargoInternoInstance, field: "descripcionCargo")}</td>
			
				<td><g:formatDate date="${cargoInternoInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${cargoInternoInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${cargoInternoInstanceTotal}" />
	</div>
</section>

</body>

</html>
