
<%@ page import="org.control.Pago" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-pago" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="monto" title="${message(code: 'pago.monto.label', default: 'Monto')}" />
			
				<th><g:message code="pago.medioDePago.label" default="Medio De Pago" /></th>
			
				<g:sortableColumn property="fecha" title="${message(code: 'pago.fecha.label', default: 'Fecha')}" />
			
				<g:sortableColumn property="numeroDeBoleta" title="${message(code: 'pago.numeroDeBoleta.label', default: 'Numero De Boleta')}" />
			
				<g:sortableColumn property="pagoConfirmado" title="${message(code: 'pago.pagoConfirmado.label', default: 'Pago Confirmado')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'pago.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${pagoInstanceList}" status="i" var="pagoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${pagoInstance.id}">${fieldValue(bean: pagoInstance, field: "monto")}</g:link></td>
			
				<td>${fieldValue(bean: pagoInstance, field: "medioDePago")}</td>
			
				<td><g:formatDate date="${pagoInstance.fecha}" /></td>
			
				<td>${fieldValue(bean: pagoInstance, field: "numeroDeBoleta")}</td>
			
				<td><g:formatBoolean boolean="${pagoInstance.pagoConfirmado}" /></td>
			
				<td><g:formatDate date="${pagoInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${pagoInstanceTotal}" />
	</div>
</section>

</body>

</html>
