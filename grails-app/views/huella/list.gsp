
<%@ page import="org.control.Huella" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'huella.label', default: 'Huella')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-huella" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="huerut" title="${message(code: 'huella.huerut.label', default: 'Huerut')}" />
				%{--<g:sortableColumn property="huehuella" title="${message(code: 'huella.huehuella.label', default: 'Huehuella')}" />--}%
				%{--<g:sortableColumn property="lastUpdated" title="${message(code: 'huella.lastUpdated.label', default: 'Last Updated')}" />--}%
				<g:sortableColumn property="dateCreated" title="${message(code: 'huella.dateCreated.label', default: 'Fecha de Enrolamiento')}" />
				%{--<th><g:message code="huella.usuario.label" default="Usuario" /></th>--}%
			</tr>
		</thead>
		<tbody>
		<g:each in="${huellaInstanceList}" status="i" var="huellaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${huellaInstance.id}">${fieldValue(bean: huellaInstance, field: "huerut")}</g:link></td>
				%{--<td>${fieldValue(bean: huellaInstance, field: "huehuella")}</td>--}%
				%{--<td><g:formatDate date="${huellaInstance.lastUpdated}" /></td>--}%
				<td><g:formatDate date="${huellaInstance.dateCreated}" /></td>
				%{--<td>${fieldValue(bean: huellaInstance, field: "usuario")}</td>--}%
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${huellaInstanceTotal}" />
	</div>
</section>

</body>

</html>
