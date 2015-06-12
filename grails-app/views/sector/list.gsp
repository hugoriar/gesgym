
<%@ page import="org.control.ubicacion.Sector" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'sector.label', default: 'Sector')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-sector" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'sector.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="sector.ciudad.label" default="Ciudad" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${sectorInstanceList}" status="i" var="sectorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${sectorInstance.id}">${fieldValue(bean: sectorInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: sectorInstance, field: "ciudad")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${sectorInstanceTotal}" />
	</div>
</section>

</body>

</html>
