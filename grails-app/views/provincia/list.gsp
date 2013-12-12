
<%@ page import="org.gym.ubicacion.Provincia" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'provincia.label', default: 'Provincia')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-provincia" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'provincia.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="provincia.region.label" default="Region" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${provinciaInstanceList}" status="i" var="provinciaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${provinciaInstance.id}">${fieldValue(bean: provinciaInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: provinciaInstance, field: "region")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${provinciaInstanceTotal}" />
	</div>
</section>

</body>

</html>
