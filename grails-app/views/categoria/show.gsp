
<%@ page import="org.control.ventas.Categoria" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-categoria" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: categoriaInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.descuentosCategoria.label" default="Descuentos Categoria" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${categoriaInstance.descuentosCategoria}" var="d">
						<li><g:link controller="descuentoCategoria" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.subCategorias.label" default="Sub Categorias" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${categoriaInstance.subCategorias}" var="s">
						<li><g:link controller="categoria" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.categoriaPadre.label" default="Categoria Padre" /></td>
				
				<td valign="top" class="value"><g:link controller="categoria" action="show" id="${categoriaInstance?.categoriaPadre?.id}">${categoriaInstance?.categoriaPadre?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="categoria.productos.label" default="Productos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${categoriaInstance.productos}" var="p">
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
