
<%@ page import="org.control.calendario.Horario" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'horario.label', default: 'Horario')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-horario" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'horario.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="horario.curso.label" default="Curso" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${horarioInstanceList}" status="i" var="horarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${horarioInstance.id}">${fieldValue(bean: horarioInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: horarioInstance, field: "curso")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${horarioInstanceTotal}" />
	</div>
</section>

</body>

</html>
