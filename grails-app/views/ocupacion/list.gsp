
<%@ page import="org.control.Ocupacion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ocupacion.label', default: 'Ocupacion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-ocupacion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="descripcion" title="${message(code: 'ocupacion.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="nombre" title="${message(code: 'ocupacion.nombre.label', default: 'Nombre')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${ocupacionInstanceList}" status="i" var="ocupacionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${ocupacionInstance.id}">${fieldValue(bean: ocupacionInstance, field: "descripcion")}</g:link></td>
			
				<td>${fieldValue(bean: ocupacionInstance, field: "nombre")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${ocupacionInstanceTotal}" />
	</div>
</section>

</body>

</html>
