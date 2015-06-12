
<%@ page import="org.control.LogTipoOperacion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logTipoOperacion.label', default: 'LogTipoOperacion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logTipoOperacion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'logTipoOperacion.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="color" title="${message(code: 'logTipoOperacion.color.label', default: 'Color')}" />
			
				<g:sortableColumn property="observaciones" title="${message(code: 'logTipoOperacion.observaciones.label', default: 'Observaciones')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'logTipoOperacion.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${logTipoOperacionInstanceList}" status="i" var="logTipoOperacionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${logTipoOperacionInstance.id}">${fieldValue(bean: logTipoOperacionInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: logTipoOperacionInstance, field: "color")}</td>
			
				<td>${fieldValue(bean: logTipoOperacionInstance, field: "observaciones")}</td>
			
				<td><g:formatDate date="${logTipoOperacionInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logTipoOperacionInstanceTotal}" />
	</div>
</section>

</body>

</html>
