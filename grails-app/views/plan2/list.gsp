
<%@ page import="org.control.Plan" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-plan" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'plan.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="fechaInicioVigencia" title="${message(code: 'plan.fechaInicioVigencia.label', default: 'Fecha Inicio Vigencia')}" />
			
				<g:sortableColumn property="fechaTerminoVigencia" title="${message(code: 'plan.fechaTerminoVigencia.label', default: 'Fecha Termino Vigencia')}" />
			
				<g:sortableColumn property="valor" title="${message(code: 'plan.valor.label', default: 'Valor')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'plan.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'plan.lastUpdated.label', default: 'Last Updated')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${planInstanceList}" status="i" var="planInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${planInstance.id}">${fieldValue(bean: planInstance, field: "nombre")}</g:link></td>
			
				<td><g:formatDate date="${planInstance.fechaInicioVigencia}" /></td>
			
				<td><g:formatDate date="${planInstance.fechaTerminoVigencia}" /></td>
			
				<td>${fieldValue(bean: planInstance, field: "valor")}</td>
			
				<td>${fieldValue(bean: planInstance, field: "descripcion")}</td>
			
				<td><g:formatDate date="${planInstance.lastUpdated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${planInstanceTotal}" />
	</div>
</section>

</body>

</html>
