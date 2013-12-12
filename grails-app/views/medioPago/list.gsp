
<%@ page import="org.gym.MedioPago" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'medioPago.label', default: 'MedioPago')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-medioPago" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'medioPago.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'medioPago.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${medioPagoInstanceList}" status="i" var="medioPagoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${medioPagoInstance.id}">${fieldValue(bean: medioPagoInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: medioPagoInstance, field: "descripcion")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${medioPagoInstanceTotal}" />
	</div>
</section>

</body>

</html>
