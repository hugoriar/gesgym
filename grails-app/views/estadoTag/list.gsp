
<%@ page import="org.control.tag.EstadoTag" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoTag.label', default: 'EstadoTag')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-estadoTag" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreEstado" title="${message(code: 'estadoTag.nombreEstado.label', default: 'Nombre Estado')}" />
			
				<g:sortableColumn property="habilitado" title="${message(code: 'estadoTag.habilitado.label', default: 'Habilitado')}" />
			
				<g:sortableColumn property="descripcionEstado" title="${message(code: 'estadoTag.descripcionEstado.label', default: 'Descripcion Estado')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${estadoTagInstanceList}" status="i" var="estadoTagInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${estadoTagInstance.id}">${fieldValue(bean: estadoTagInstance, field: "nombreEstado")}</g:link></td>
			
				<td><g:formatBoolean boolean="${estadoTagInstance.habilitado}" /></td>
			
				<td>${fieldValue(bean: estadoTagInstance, field: "descripcionEstado")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${estadoTagInstanceTotal}" />
	</div>
</section>

</body>

</html>
