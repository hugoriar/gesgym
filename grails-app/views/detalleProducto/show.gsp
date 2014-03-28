
<%@ page import="org.gym.ventas.DetalleProducto" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'detalleProducto.label', default: 'DetalleProducto')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-detalleProducto" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalleProducto.cantidad.label" default="Cantidad" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: detalleProductoInstance, field: "cantidad")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalleProducto.precioUnitario.label" default="Precio Unitario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: detalleProductoInstance, field: "precioUnitario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalleProducto.producto.label" default="Producto" /></td>
				
				<td valign="top" class="value"><g:link controller="producto" action="show" id="${detalleProductoInstance?.producto?.id}">${detalleProductoInstance?.producto?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalleProducto.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: detalleProductoInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalleProducto.venta.label" default="Venta" /></td>
				
				<td valign="top" class="value"><g:link controller="venta" action="show" id="${detalleProductoInstance?.venta?.id}">${detalleProductoInstance?.venta?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
