
<%@ page import="org.gym.ventas.EstadoVenta" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoVenta.label', default: 'EstadoVenta')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-estadoVenta" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="codigo" title="${message(code: 'estadoVenta.codigo.label', default: 'Codigo')}" />
			
				<g:sortableColumn property="nombre" title="${message(code: 'estadoVenta.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'estadoVenta.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${estadoVentaInstanceList}" status="i" var="estadoVentaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${estadoVentaInstance.id}">${fieldValue(bean: estadoVentaInstance, field: "codigo")}</g:link></td>
			
				<td>${fieldValue(bean: estadoVentaInstance, field: "nombre")}</td>
			
				<td>${fieldValue(bean: estadoVentaInstance, field: "descripcion")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${estadoVentaInstanceTotal}" />
	</div>
</section>

</body>

</html>
