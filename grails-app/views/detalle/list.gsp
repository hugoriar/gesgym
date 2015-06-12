
<%@ page import="org.control.ventas.Detalle" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'detalle.label', default: 'Detalle')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-detalle" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="cantidadProducto" title="${message(code: 'detalle.cantidadProducto.label', default: 'Cantidad Producto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${detalleInstanceList}" status="i" var="detalleInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${detalleInstance.id}">${fieldValue(bean: detalleInstance, field: "cantidadProducto")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${detalleInstanceTotal}" />
	</div>
</section>

</body>

</html>
