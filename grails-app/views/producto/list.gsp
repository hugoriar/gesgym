
<%@ page import="org.gym.ventas.Producto" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'producto.label', default: 'Producto')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-producto" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'producto.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="precioBase" title="${message(code: 'producto.precioBase.label', default: 'Precio Base')}" />
			
				<g:sortableColumn property="precioMayorista" title="${message(code: 'producto.precioMayorista.label', default: 'Precio Mayorista')}" />
			
				<g:sortableColumn property="peso" title="${message(code: 'producto.peso.label', default: 'Peso')}" />
			
				<g:sortableColumn property="descripcionBreve" title="${message(code: 'producto.descripcionBreve.label', default: 'Descripcion Breve')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'producto.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${productoInstanceList}" status="i" var="productoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${productoInstance.id}">${fieldValue(bean: productoInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: productoInstance, field: "precioBase")}</td>
			
				<td>${fieldValue(bean: productoInstance, field: "precioMayorista")}</td>
			
				<td>${fieldValue(bean: productoInstance, field: "peso")}</td>
			
				<td>${fieldValue(bean: productoInstance, field: "descripcionBreve")}</td>
			
				<td>${fieldValue(bean: productoInstance, field: "descripcion")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${productoInstanceTotal}" />
	</div>
</section>

</body>

</html>
