
<%@ page import="org.control.ConceptoPago" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'conceptoPago.label', default: 'ConceptoPago')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-conceptoPago" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'conceptoPago.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'conceptoPago.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="conceptoPago.categoriaConceptoPago.label" default="Categoria Concepto Pago" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${conceptoPagoInstanceList}" status="i" var="conceptoPagoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${conceptoPagoInstance.id}">${fieldValue(bean: conceptoPagoInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: conceptoPagoInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: conceptoPagoInstance, field: "categoriaConceptoPago")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${conceptoPagoInstanceTotal}" />
	</div>
</section>

</body>

</html>
