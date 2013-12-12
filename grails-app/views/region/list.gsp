
<%@ page import="org.gym.ubicacion.Region" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'region.label', default: 'Region')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-region" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'region.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="numero" title="${message(code: 'region.numero.label', default: 'Numero')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${regionInstanceList}" status="i" var="regionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${regionInstance.id}">${fieldValue(bean: regionInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: regionInstance, field: "numero")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${regionInstanceTotal}" />
	</div>
</section>

</body>

</html>
