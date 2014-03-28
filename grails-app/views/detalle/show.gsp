
<%@ page import="org.gym.ventas.Detalle" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'detalle.label', default: 'Detalle')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-detalle" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalle.cantidadProducto.label" default="Cantidad Producto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: detalleInstance, field: "cantidadProducto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="detalle.productos.label" default="Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${detalleInstance.productos}" var="p">
						<li><g:link controller="producto" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
