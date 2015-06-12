
<%@ page import="org.control.ventas.SubCategoria" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subCategoria.label', default: 'SubCategoria')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-subCategoria" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subCategoria.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subCategoriaInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subCategoria.categoria.label" default="Categoria" /></td>
				
				<td valign="top" class="value"><g:link controller="categoria" action="show" id="${subCategoriaInstance?.categoria?.id}">${subCategoriaInstance?.categoria?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subCategoria.descuentosSubCategoria.label" default="Descuentos Sub Categoria" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${subCategoriaInstance.descuentosSubCategoria}" var="d">
						<li><g:link controller="descuentoSubCategoria" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subCategoria.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: subCategoriaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="subCategoria.productos.label" default="Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${subCategoriaInstance.productos}" var="p">
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
