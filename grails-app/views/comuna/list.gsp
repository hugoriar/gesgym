
<%@ page import="org.control.ubicacion.Comuna" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'comuna.label', default: 'Comuna')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-comuna" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'comuna.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="comuna.provincia.label" default="Provincia" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${comunaInstanceList}" status="i" var="comunaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${comunaInstance.id}">${fieldValue(bean: comunaInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: comunaInstance, field: "provincia")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${comunaInstanceTotal}" />
	</div>
</section>

</body>

</html>
