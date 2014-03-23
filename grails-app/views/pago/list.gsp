
<%@ page import="org.gym.Pago" %>
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
                <g:sortableColumn property="id" title="${message(code: 'pago.id.label', default: 'Id')}" />
                <g:sortableColumn property="fechaDeCobro" title="${message(code: 'pago.fechaDeCobro.label', default: 'Fecha de Cobro')}" />
                <g:sortableColumn property="fechaDeCreacion" title="${message(code: 'pago.fechaDeCreacion.label', default: 'Fecha de Creacion')}" />
                %{--<g:sortableColumn property="horaDeCreacion" title="${message(code: 'pago.horaDeCreacion.label', default: 'Hora de Creacion')}" />--}%
                <g:sortableColumn property="concepto" title="${message(code: 'pago.dateCreated.label', default: 'Concepto')}" />
                <g:sortableColumn property="usuario" title="${'Usuario'}" />
                <g:sortableColumn property="medioDePago" title="${message(code: 'pago.medioDePago.label', default: 'Medio De Pago')}" />
				<g:sortableColumn property="numeroDeBoleta" title="${message(code: 'pago.numeroDeBoleta2.label', default: 'Boleta o Factura')}" />
                <g:sortableColumn property="monto" title="${message(code: 'pago.monto.label', default: 'Monto')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${pagoMapList}" status="i" var="pagoMap">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td>${pagoMap.getAt("pagoId")}</td>
                <td><g:if test="${pagoMap.getAt("fechaDeCobro") != null}">${new Date(pagoMap.getAt("fechaDeCobro")).format("dd-MM-yyyy")}</g:if></td>
                <td><g:if test="${pagoMap.getAt("fechaDeCreacion") != null}">${new Date(pagoMap.getAt("fechaDeCreacion")).format("dd-MM-yyyy HH:mm")}</g:if></td>
                %{--<td><g:if test="${pagoMap.getAt("fechaDeCreacion") != null}">${new Date(pagoMap.getAt("fechaDeCreacion")).format("HH:mm")}</g:if></td>--}%
                <td>${pagoMap.getAt("concepto")}</td>
                <td>${pagoMap.getAt("usuario")}</td>
                <td>${pagoMap.getAt("medioDePago")}</td>
                <td>${pagoMap.getAt("numeroDeBoleta")}</td>
                <td><g:link action="show" id="${pagoMap.getAt("pagoId")}">${String.format("\$ %,d", pagoMap.getAt("monto")?:0)}</g:link></td>
            </tr>
		</g:each>
		</tbody>
	</table>
%{--	<div class="pagination">
		<bs:paginate total="${pagoInstanceTotal}" />
	</div>--}%
</section>

</body>

</html>
