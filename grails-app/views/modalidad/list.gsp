
<%@ page import="org.gym.Modalidad" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'modalidad.label', default: 'Modalidad')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-modalidad" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="modalidad" title="${message(code: 'modalidad.modalidad.label', default: 'Modalidad')}" />
			
				<g:sortableColumn property="descripcion" title="${message(code: 'modalidad.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${modalidadInstanceList}" status="i" var="modalidadInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${modalidadInstance.id}">${fieldValue(bean: modalidadInstance, field: "modalidad")}</g:link></td>
			
				<td>${fieldValue(bean: modalidadInstance, field: "descripcion")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${modalidadInstanceTotal}" />
	</div>
</section>

</body>

</html>
