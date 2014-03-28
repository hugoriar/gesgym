
<%@ page import="org.gym.ventas.Variante" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'variante.label', default: 'Variante')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-variante" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.sku.label" default="Sku" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "sku")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.precio.label" default="Precio" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "precio")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.precioMayorista.label" default="Precio Mayorista" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "precioMayorista")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.peso.label" default="Peso" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "peso")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.codigoBarras.label" default="Codigo Barras" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "codigoBarras")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.descripcionBreve.label" default="Descripcion Breve" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "descripcionBreve")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: varianteInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.gestionarStock.label" default="Gestionar Stock" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${varianteInstance?.gestionarStock}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.venderConStockCero.label" default="Vender Con Stock Cero" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${varianteInstance?.venderConStockCero}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.publicado.label" default="Publicado" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${varianteInstance?.publicado}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.destacado.label" default="Destacado" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${varianteInstance?.destacado}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.descuentosVariante.label" default="Descuentos Variante" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${varianteInstance.descuentosVariante}" var="d">
						<li><g:link controller="descuentoVariante" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.detallesBoleta.label" default="Detalles Boleta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${varianteInstance.detallesBoleta}" var="d">
						<li><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.fotosProducto.label" default="Fotos Producto" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${varianteInstance.fotosProducto}" var="f">
						<li><g:link controller="fotoProducto" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="variante.proveedores.label" default="Proveedores" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${varianteInstance.proveedores}" var="p">
						<li><g:link controller="proveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
