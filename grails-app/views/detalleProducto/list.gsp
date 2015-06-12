
<%@ page import="org.control.ventas.DetalleProducto" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'detalleProducto.label', default: 'DetalleProducto')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-detalleProducto" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="cantidad" title="${message(code: 'detalleProducto.cantidad.label', default: 'Cantidad')}" />
			
				<g:sortableColumn property="precioUnitario" title="${message(code: 'detalleProducto.precioUnitario.label', default: 'Precio Unitario')}" />
			
				<th><g:message code="detalleProducto.producto.label" default="Producto" /></th>
			
				<g:sortableColumn property="descripcion" title="${message(code: 'detalleProducto.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="detalleProducto.venta.label" default="Venta" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${detalleProductoInstanceList}" status="i" var="detalleProductoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${detalleProductoInstance.id}">${fieldValue(bean: detalleProductoInstance, field: "cantidad")}</g:link></td>
			
				<td>${fieldValue(bean: detalleProductoInstance, field: "precioUnitario")}</td>
			
				<td>${fieldValue(bean: detalleProductoInstance, field: "producto")}</td>
			
				<td>${fieldValue(bean: detalleProductoInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: detalleProductoInstance, field: "venta")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${detalleProductoInstanceTotal}" />
	</div>
</section>

</body>

</html>
