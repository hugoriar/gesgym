
<%@ page import="org.gym.ventas.Producto" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-producto" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.precioBase.label" default="Precio Base" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "precioBase")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.precioMayorista.label" default="Precio Mayorista" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "precioMayorista")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.peso.label" default="Peso" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "peso")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.descripcionBreve.label" default="Descripcion Breve" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "descripcionBreve")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: productoInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.gestionarStock.label" default="Gestionar Stock" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productoInstance?.gestionarStock}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.venderConStockCero.label" default="Vender Con Stock Cero" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productoInstance?.venderConStockCero}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.publicado.label" default="Publicado" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productoInstance?.publicado}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.destacado.label" default="Destacado" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${productoInstance?.destacado}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.categorias.label" default="Categorias" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.categorias}" var="c">
						<li><g:link controller="categoria" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.descuentosProducto.label" default="Descuentos Producto" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.descuentosProducto}" var="d">
						<li><g:link controller="descuentoProducto" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.detallesBoleta.label" default="Detalles Boleta" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.detallesBoleta}" var="d">
						<li><g:link controller="detalle" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.fotosProducto.label" default="Fotos Producto" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.fotosProducto}" var="f">
						<li><g:link controller="fotoProducto" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.proveedores.label" default="Proveedores" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.proveedores}" var="p">
						<li><g:link controller="proveedor" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="producto.variantes.label" default="Variantes" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${productoInstance.variantes}" var="v">
						<li><g:link controller="variante" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
