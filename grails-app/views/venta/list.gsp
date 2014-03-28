
<%@ page import="org.gym.ventas.Venta" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-venta" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="subTotal" title="${message(code: 'venta.subTotal.label', default: 'Sub Total')}" />
			
				<g:sortableColumn property="descuento" title="${message(code: 'venta.descuento.label', default: 'Descuento')}" />
			
				<g:sortableColumn property="donacion" title="${message(code: 'venta.donacion.label', default: 'Donacion')}" />
			
				<g:sortableColumn property="total" title="${message(code: 'venta.total.label', default: 'Total')}" />
			
				<th><g:message code="venta.estadoVenta.label" default="Estado Venta" /></th>
			
				<th><g:message code="venta.vendedor.label" default="Vendedor" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ventaInstanceList}" status="i" var="ventaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ventaInstance.id}">${fieldValue(bean: ventaInstance, field: "subTotal")}</g:link></td>
			
				<td>${fieldValue(bean: ventaInstance, field: "descuento")}</td>
			
				<td>${fieldValue(bean: ventaInstance, field: "donacion")}</td>
			
				<td>${fieldValue(bean: ventaInstance, field: "total")}</td>
			
				<td>${fieldValue(bean: ventaInstance, field: "estadoVenta")}</td>
			
				<td>${fieldValue(bean: ventaInstance, field: "vendedor")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${ventaInstanceTotal}" />
	</div>
</section>

</body>

</html>
