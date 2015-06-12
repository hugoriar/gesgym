
<%@ page import="org.control.LogOperacion" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logOperacion.label', default: 'LogOperacion')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logOperacion" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="logOperacion.tipoOperacion.label" default="Tipo Operacion" /></th>
			
				<th><g:message code="logOperacion.entidad.label" default="Entidad" /></th>
			
				<g:sortableColumn property="idEntidad" title="${message(code: 'logOperacion.idEntidad.label', default: 'Id Entidad')}" />
			
				<th><g:message code="logOperacion.modalidad.label" default="Modalidad" /></th>
			
				<th><g:message code="logOperacion.personal.label" default="Personal" /></th>
			
				<th><g:message code="logOperacion.socio.label" default="Socio" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${logOperacionInstanceList}" status="i" var="logOperacionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${logOperacionInstance.id}">${fieldValue(bean: logOperacionInstance, field: "tipoOperacion")}</g:link></td>
			
				<td>${fieldValue(bean: logOperacionInstance, field: "entidad")}</td>
			
				<td>${fieldValue(bean: logOperacionInstance, field: "idEntidad")}</td>
			
				<td>${fieldValue(bean: logOperacionInstance, field: "modalidad")}</td>
			
				<td>${fieldValue(bean: logOperacionInstance, field: "personal")}</td>
			
				<td>${fieldValue(bean: logOperacionInstance, field: "socio")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logOperacionInstanceTotal}" />
	</div>
</section>

</body>

</html>
