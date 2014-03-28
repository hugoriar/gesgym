
<%@ page import="org.gym.ventas.Variante" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'variante.label', default: 'Variante')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-variante" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="sku" title="${message(code: 'variante.sku.label', default: 'Sku')}" />
			
				<g:sortableColumn property="nombre" title="${message(code: 'variante.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="precio" title="${message(code: 'variante.precio.label', default: 'Precio')}" />
			
				<g:sortableColumn property="precioMayorista" title="${message(code: 'variante.precioMayorista.label', default: 'Precio Mayorista')}" />
			
				<g:sortableColumn property="peso" title="${message(code: 'variante.peso.label', default: 'Peso')}" />
			
				<g:sortableColumn property="codigoBarras" title="${message(code: 'variante.codigoBarras.label', default: 'Codigo Barras')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${varianteInstanceList}" status="i" var="varianteInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${varianteInstance.id}">${fieldValue(bean: varianteInstance, field: "sku")}</g:link></td>
			
				<td>${fieldValue(bean: varianteInstance, field: "nombre")}</td>
			
				<td>${fieldValue(bean: varianteInstance, field: "precio")}</td>
			
				<td>${fieldValue(bean: varianteInstance, field: "precioMayorista")}</td>
			
				<td>${fieldValue(bean: varianteInstance, field: "peso")}</td>
			
				<td>${fieldValue(bean: varianteInstance, field: "codigoBarras")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${varianteInstanceTotal}" />
	</div>
</section>

</body>

</html>
