
<%@ page import="org.gym.ventas.FotoProducto" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'fotoProducto.label', default: 'FotoProducto')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-fotoProducto" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fotoProducto.nombreFotoProducto.label" default="Nombre Foto Producto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: fotoProductoInstance, field: "nombreFotoProducto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fotoProducto.descripcionFotoProducto.label" default="Descripcion Foto Producto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: fotoProductoInstance, field: "descripcionFotoProducto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fotoProducto.tooltipFotoProducto.label" default="Tooltip Foto Producto" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: fotoProductoInstance, field: "tooltipFotoProducto")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fotoProducto.fotoProducto.label" default="Foto Producto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="fotoProducto.productos.label" default="Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${fotoProductoInstance.productos}" var="p">
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
