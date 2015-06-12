
<%@ page import="org.control.ventas.Categoria" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-categoria" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'categoria.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'categoria.descripcion.label', default: 'Descripcion')}" />
			
				<th><g:message code="categoria.categoriaPadre.label" default="Categoria Padre" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: categoriaInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: categoriaInstance, field: "categoriaPadre")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${categoriaInstanceTotal}" />
	</div>
</section>

</body>

</html>
