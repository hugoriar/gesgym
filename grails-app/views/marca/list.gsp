
<%@ page import="org.control.ventas.Marca" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'marca.label', default: 'Marca')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-marca" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'marca.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'marca.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'marca.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'marca.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${marcaInstanceList}" status="i" var="marcaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${marcaInstance.id}">${fieldValue(bean: marcaInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: marcaInstance, field: "descripcion")}</td>
			
				<td><g:formatDate date="${marcaInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${marcaInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${marcaInstanceTotal}" />
	</div>
</section>

</body>

</html>
