
<%@ page import="org.control.ConfiguracionBytes" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'configuracionBytes.label', default: 'ConfiguracionBytes')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-configuracionBytes" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'configuracionBytes.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="valor" title="${message(code: 'configuracionBytes.valor.label', default: 'Valor')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'configuracionBytes.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'configuracionBytes.dateCreated.label', default: 'Date Created')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'configuracionBytes.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${configuracionBytesInstanceList}" status="i" var="configuracionBytesInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${configuracionBytesInstance.id}">${fieldValue(bean: configuracionBytesInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: configuracionBytesInstance, field: "valor")}</td>
			
				<td>${fieldValue(bean: configuracionBytesInstance, field: "descripcion")}</td>
			
				<td><g:formatDate date="${configuracionBytesInstance.dateCreated}" /></td>
			
				<td><g:formatDate date="${configuracionBytesInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${configuracionBytesInstanceTotal}" />
	</div>
</section>

</body>

</html>
