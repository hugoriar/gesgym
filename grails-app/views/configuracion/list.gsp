
<%@ page import="org.control.Configuracion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'configuracion.label', default: 'Configuracion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-configuracion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'configuracion.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="valor" title="${message(code: 'configuracion.valor.label', default: 'Valor')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'configuracion.descripcion.label', default: 'Descripcion')}" />
			
				%{--<g:sortableColumn property="dateCreated" title="${message(code: 'configuracion.dateCreated.label', default: 'Date Created')}" />--}%
			
				%{--<g:sortableColumn property="lastUpdated" title="${message(code: 'configuracion.lastUpdated.label', default: 'Last Updated')}" />--}%
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${configuracionInstanceList}" status="i" var="configuracionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${configuracionInstance.id}">${fieldValue(bean: configuracionInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: configuracionInstance, field: "valor")}</td>
			
				<td>${fieldValue(bean: configuracionInstance, field: "descripcion")}</td>
			
				%{--<td><g:formatDate date="${configuracionInstance.dateCreated}" /></td>--}%
			
				%{--<td><g:formatDate date="${configuracionInstance.lastUpdated}" /></td>--}%
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${configuracionInstanceTotal}" />
	</div>
</section>

</body>

</html>
