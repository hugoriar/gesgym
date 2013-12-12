
<%@ page import="org.gym.Pago" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'pago.label', default: 'Pago')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-pago" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.monto.label" default="Monto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pagoInstance, field: "monto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.medioDePago.label" default="Medio De Pago" /></td>
				
				<td valign="top" class="value"><g:link controller="medioPago" action="show" id="${pagoInstance?.medioDePago?.id}">${pagoInstance?.medioDePago?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.fecha.label" default="Fecha" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.fecha}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.numeroDeBoleta.label" default="Numero De Boleta" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: pagoInstance, field: "numeroDeBoleta")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="pago.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${pagoInstance?.dateCreated}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
