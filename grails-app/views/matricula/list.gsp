
<%@ page import="org.control.Matricula" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'matricula.label', default: 'Matricula')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-matricula" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="fechaMatricula" title="${message(code: 'matricula.fechaMatricula.label', default: 'Fecha Matricula')}" />
			
				<th><g:message code="matricula.matriculadoPor.label" default="Matriculado Por" /></th>
			
				<th><g:message code="matricula.referidoPor.label" default="Referido Por" /></th>
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'matricula.lastUpdated.label', default: 'Last Updated')}" />
			
				<th><g:message code="matricula.pagoMatricula.label" default="Pago Matricula" /></th>
			
				<g:sortableColumn property="observacionesMatricula" title="${message(code: 'matricula.observacionesMatricula.label', default: 'Observaciones Matricula')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${matriculaInstanceList}" status="i" var="matriculaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${matriculaInstance.id}">${fieldValue(bean: matriculaInstance, field: "fechaMatricula")}</g:link></td>
			
				<td>${fieldValue(bean: matriculaInstance, field: "matriculadoPor")}</td>
			
				<td>${fieldValue(bean: matriculaInstance, field: "referidoPor")}</td>
			
				<td><g:formatDate date="${matriculaInstance.lastUpdated}" /></td>
			
				<td>${fieldValue(bean: matriculaInstance, field: "pagoMatricula")}</td>
			
				<td>${fieldValue(bean: matriculaInstance, field: "observacionesMatricula")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${matriculaInstanceTotal}" />
	</div>
</section>

</body>

</html>
