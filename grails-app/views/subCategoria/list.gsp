
<%@ page import="org.control.ventas.SubCategoria" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'subCategoria.label', default: 'SubCategoria')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-subCategoria" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="descripcion" title="${message(code: 'subCategoria.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="subCategoria.categoria.label" default="Categoria" /></th>
			
				<g:sortableColumn property="nombre" title="${message(code: 'subCategoria.nombre.label', default: 'Nombre')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${subCategoriaInstanceList}" status="i" var="subCategoriaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${subCategoriaInstance.id}">${fieldValue(bean: subCategoriaInstance, field: "descripcion")}</g:link></td>
			
				<td>${fieldValue(bean: subCategoriaInstance, field: "categoria")}</td>
			
				<td>${fieldValue(bean: subCategoriaInstance, field: "nombre")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${subCategoriaInstanceTotal}" />
	</div>
</section>

</body>

</html>
