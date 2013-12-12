
<%@ page import="org.gym.fichaMedica.Profesional" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-profesional" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreProfesional" title="${message(code: 'profesional.nombreProfesional.label', default: 'Nombre Profesional')}" />
			
				<g:sortableColumn property="fonoProfesional" title="${message(code: 'profesional.fonoProfesional.label', default: 'Fono Profesional')}" />
			
				<th><g:message code="profesional.especializacionProfesional.label" default="Especializacion Profesional" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${profesionalInstanceList}" status="i" var="profesionalInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${profesionalInstance.id}">${fieldValue(bean: profesionalInstance, field: "nombreProfesional")}</g:link></td>
			
				<td>${fieldValue(bean: profesionalInstance, field: "fonoProfesional")}</td>
			
				<td>${fieldValue(bean: profesionalInstance, field: "especializacionProfesional")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${profesionalInstanceTotal}" />
	</div>
</section>

</body>

</html>
