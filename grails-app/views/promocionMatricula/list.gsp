
<%@ page import="org.control.PromocionMatricula" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'promocionMatricula.label', default: 'PromocionMatricula')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-promocionMatricula" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'promocionMatricula.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="fechaInicioVigencia" title="${message(code: 'promocionMatricula.fechaInicioVigencia.label', default: 'Fecha Inicio Vigencia')}" />
			
				<g:sortableColumn property="fechaTerminoVigencia" title="${message(code: 'promocionMatricula.fechaTerminoVigencia.label', default: 'Fecha Termino Vigencia')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'promocionMatricula.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'promocionMatricula.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'promocionMatricula.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${promocionMatriculaInstanceList}" status="i" var="promocionMatriculaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${promocionMatriculaInstance.id}">${fieldValue(bean: promocionMatriculaInstance, field: "nombre")}</g:link></td>
			
				<td><g:formatDate date="${promocionMatriculaInstance.fechaInicioVigencia}" /></td>
			
				<td><g:formatDate date="${promocionMatriculaInstance.fechaTerminoVigencia}" /></td>
			
				<td>${fieldValue(bean: promocionMatriculaInstance, field: "descripcion")}</td>
			
				<td><g:formatDate date="${promocionMatriculaInstance.lastUpdated}" /></td>
			
				<td><g:formatDate date="${promocionMatriculaInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${promocionMatriculaInstanceTotal}" />
	</div>
</section>

</body>

</html>
