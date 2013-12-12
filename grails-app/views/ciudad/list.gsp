
<%@ page import="org.gym.ubicacion.Ciudad" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ciudad.label', default: 'Ciudad')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ciudad" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'ciudad.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="ciudad.comuna.label" default="Comuna" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ciudadInstanceList}" status="i" var="ciudadInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ciudadInstance.id}">${fieldValue(bean: ciudadInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: ciudadInstance, field: "comuna")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${ciudadInstanceTotal}" />
	</div>
</section>

</body>

</html>
