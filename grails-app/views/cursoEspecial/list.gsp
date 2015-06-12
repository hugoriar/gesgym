
<%@ page import="org.control.CursoEspecial" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'cursoEspecial.label', default: 'CursoEspecial')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-cursoEspecial" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'cursoEspecial.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'cursoEspecial.descripcion.label', default: 'Descripcion')}" />
			
				<g:sortableColumn property="foto" title="${message(code: 'cursoEspecial.foto.label', default: 'Foto')}" />
			
				<g:sortableColumn property="vigente" title="${message(code: 'cursoEspecial.vigente.label', default: 'Vigente')}" />
			
				<g:sortableColumn property="lastUpdated" title="${message(code: 'cursoEspecial.lastUpdated.label', default: 'Last Updated')}" />
			
				<g:sortableColumn property="dateCreated" title="${message(code: 'cursoEspecial.dateCreated.label', default: 'Date Created')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${cursoEspecialInstanceList}" status="i" var="cursoEspecialInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${cursoEspecialInstance.id}">${fieldValue(bean: cursoEspecialInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: cursoEspecialInstance, field: "descripcion")}</td>
			
				<td>${fieldValue(bean: cursoEspecialInstance, field: "foto")}</td>
			
				<td><g:formatBoolean boolean="${cursoEspecialInstance.vigente}" /></td>
			
				<td><g:formatDate date="${cursoEspecialInstance.lastUpdated}" /></td>
			
				<td><g:formatDate date="${cursoEspecialInstance.dateCreated}" /></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${cursoEspecialInstanceTotal}" />
	</div>
</section>

</body>

</html>
