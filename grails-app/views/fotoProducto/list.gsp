
<%@ page import="org.gym.ventas.FotoProducto" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fotoProducto.label', default: 'FotoProducto')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-fotoProducto" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreFotoProducto" title="${message(code: 'fotoProducto.nombreFotoProducto.label', default: 'Nombre Foto Producto')}" />
			
				<g:sortableColumn property="descripcionFotoProducto" title="${message(code: 'fotoProducto.descripcionFotoProducto.label', default: 'Descripcion Foto Producto')}" />
			
				<g:sortableColumn property="tooltipFotoProducto" title="${message(code: 'fotoProducto.tooltipFotoProducto.label', default: 'Tooltip Foto Producto')}" />
			
				<g:sortableColumn property="fotoProducto" title="${message(code: 'fotoProducto.fotoProducto.label', default: 'Foto Producto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${fotoProductoInstanceList}" status="i" var="fotoProductoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${fotoProductoInstance.id}">${fieldValue(bean: fotoProductoInstance, field: "nombreFotoProducto")}</g:link></td>
			
				<td>${fieldValue(bean: fotoProductoInstance, field: "descripcionFotoProducto")}</td>
			
				<td>${fieldValue(bean: fotoProductoInstance, field: "tooltipFotoProducto")}</td>
			
				<td>${fieldValue(bean: fotoProductoInstance, field: "fotoProducto")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${fotoProductoInstanceTotal}" />
	</div>
</section>

</body>

</html>
