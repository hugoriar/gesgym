
<%@ page import="org.control.LogEntidad" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logEntidad.label', default: 'LogEntidad')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logEntidad" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'logEntidad.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="nombreTabla" title="${message(code: 'logEntidad.nombreTabla.label', default: 'Nombre Tabla')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${logEntidadInstanceList}" status="i" var="logEntidadInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${logEntidadInstance.id}">${fieldValue(bean: logEntidadInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: logEntidadInstance, field: "nombreTabla")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logEntidadInstanceTotal}" />
	</div>
</section>

</body>

</html>
