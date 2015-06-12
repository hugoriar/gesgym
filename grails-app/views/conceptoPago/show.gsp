
<%@ page import="org.control.ConceptoPago" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'conceptoPago.label', default: 'ConceptoPago')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-conceptoPago" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="conceptoPago.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: conceptoPagoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="conceptoPago.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: conceptoPagoInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="conceptoPago.categoriaConceptoPago.label" default="Categoria Concepto Pago" /></td>
				
				<td valign="top" class="value"><g:link controller="categoriaConceptoPago" action="show" id="${conceptoPagoInstance?.categoriaConceptoPago?.id}">${conceptoPagoInstance?.categoriaConceptoPago?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="conceptoPago.pagos.label" default="Pagos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${conceptoPagoInstance.pagos}" var="p">
						<li><g:link controller="pago" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
