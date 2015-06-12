
<%@ page import="org.control.LogCambiosDeEstado" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logCambiosDeEstado.label', default: 'LogCambiosDeEstado')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-logCambiosDeEstado" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="fechaDeOperacion" title="${message(code: 'logCambiosDeEstado.fechaDeOperacion.label', default: 'Fecha De Operacion')}" />
				<th><g:message code="logCambiosDeEstado.modalidad.label" default="Modalidad" /></th>
				<th><g:message code="logCambiosDeEstado.socio.label" default="Socio" /></th>
				<th><g:message code="logCambiosDeEstado.estadoAntiguo.label" default="Estado Antiguo" /></th>
				<th><g:message code="logCambiosDeEstado.estadoNuevo.label" default="Estado Nuevo" /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${logCambiosDeEstadoInstanceList}" status="i" var="logCambiosDeEstadoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${logCambiosDeEstadoInstance.id}"><g:formatDate format="yyyy-MM-dd HH:mm" date="${logCambiosDeEstadoInstance?.fechaDeOperacion}"/></g:link></td>
				<td>${logCambiosDeEstadoInstance?.modalidad?:""}</td>
				<td><g:link controller="userSocio" action="show" id="${logCambiosDeEstadoInstance.socioId}">${fieldValue(bean: logCambiosDeEstadoInstance, field: "socio")}</g:link></td>
				<td>${fieldValue(bean: logCambiosDeEstadoInstance, field: "estadoAntiguo")}</td>
				<td>${fieldValue(bean: logCambiosDeEstadoInstance, field: "estadoNuevo")}</td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${logCambiosDeEstadoInstanceTotal}" />
	</div>
</section>

</body>

</html>
