
<%@ page import="org.control.ventas.Boleta" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'boleta.label', default: 'Boleta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-boleta" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'boleta.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'boleta.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="boleta.usuario.label" default="Usuario" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${boletaInstanceList}" status="i" var="boletaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${boletaInstance.id}">${fieldValue(bean: boletaInstance, field: "dateCreated")}</g:link></td>
			
				<td><g:formatDate date="${boletaInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: boletaInstance, field: "usuario")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${boletaInstanceTotal}" />
	</div>
</section>

</body>

</html>
