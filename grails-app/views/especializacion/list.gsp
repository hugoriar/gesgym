
<%@ page import="org.control.Especializacion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'especializacion.label', default: 'Especializacion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-especializacion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreEspecializacion" title="${message(code: 'especializacion.nombreEspecializacion.label', default: 'Nombre Especializacion')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'especializacion.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'especializacion.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${especializacionInstanceList}" status="i" var="especializacionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${especializacionInstance.id}">${fieldValue(bean: especializacionInstance, field: "nombreEspecializacion")}</g:link></td>
			
				<td><g:formatDate date="${especializacionInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${especializacionInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${especializacionInstanceTotal}" />
	</div>
</section>

</body>

</html>
