
<%@ page import="org.control.fichaMedica.CondicionMedica" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'condicionMedica.label', default: 'CondicionMedica')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-condicionMedica" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="condicion" title="${message(code: 'condicionMedica.condicion.label', default: 'Condicion')}" />
			
				<th><g:message code="condicionMedica.profesional.label" default="Profesional" /></th>
			
				<g:sortableColumn property="medicamento" title="${message(code: 'condicionMedica.medicamento.label', default: 'Medicamento')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${condicionMedicaInstanceList}" status="i" var="condicionMedicaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${condicionMedicaInstance.id}">${fieldValue(bean: condicionMedicaInstance, field: "condicion")}</g:link></td>
			
				<td>${fieldValue(bean: condicionMedicaInstance, field: "profesional")}</td>
			
				<td>${fieldValue(bean: condicionMedicaInstance, field: "medicamento")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${condicionMedicaInstanceTotal}" />
	</div>
</section>

</body>

</html>
