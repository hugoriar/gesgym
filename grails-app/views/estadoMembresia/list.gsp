
<%@ page import="org.gym.EstadoMembresia" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoMembresia.label', default: 'EstadoMembresia')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-estadoMembresia" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="estado" title="${message(code: 'estadoMembresia.estado.label', default: 'Estado')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'estadoMembresia.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="color" title="${message(code: 'estadoMembresia.color.label', default: 'Color')}" />
			
				%{--<g:sortableColumn property="sonido" title="${message(code: 'estadoMembresia.sonido.label', default: 'Sonido')}" />--}%
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${estadoMembresiaInstanceList}" status="i" var="estadoMembresiaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}" style="color: ${estadoMembresiaInstance?.color}">
			
				<td><g:link action="show" id="${estadoMembresiaInstance.id}">${fieldValue(bean: estadoMembresiaInstance, field: "estado")}</g:link></td>
			
				<td>${fieldValue(bean: estadoMembresiaInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: estadoMembresiaInstance, field: "color")}</td>
			
				%{--<td>${fieldValue(bean: estadoMembresiaInstance, field: "sonido")}</td>--}%
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${estadoMembresiaInstanceTotal}" />
	</div>
</section>

</body>

</html>
