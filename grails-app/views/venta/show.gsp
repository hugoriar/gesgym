
<%@ page import="org.gym.ventas.Venta" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'venta.label', default: 'Venta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-venta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.subTotal.label" default="Sub Total" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ventaInstance, field: "subTotal")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.descuento.label" default="Descuento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ventaInstance, field: "descuento")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.donacion.label" default="Donacion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ventaInstance, field: "donacion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.total.label" default="Total" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ventaInstance, field: "total")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.estadoVenta.label" default="Estado Venta" /></td>
				
				<td valign="top" class="value"><g:link controller="estadoVenta" action="show" id="${ventaInstance?.estadoVenta?.id}">${ventaInstance?.estadoVenta?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.vendedor.label" default="Vendedor" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${ventaInstance?.vendedor?.id}">${ventaInstance?.vendedor?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ventaInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${ventaInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="venta.detalles.label" default="Detalles" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${ventaInstance.detalles}" var="d">
						<li><g:link controller="detalleProducto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
