
<%@ page import="org.gym.DireccionUsuario" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'direccionUsuario.label', default: 'DireccionUsuario')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-direccionUsuario" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="calleUsuario" title="${message(code: 'direccionUsuario.calleUsuario.label', default: 'Calle Usuario')}" />
			
				<g:sortableColumn property="numeroUsuario" title="${message(code: 'direccionUsuario.numeroUsuario.label', default: 'Numero Usuario')}" />
			
				<g:sortableColumn property="departamentoUsuario" title="${message(code: 'direccionUsuario.departamentoUsuario.label', default: 'Departamento Usuario')}" />
			
				<th><g:message code="direccionUsuario.sectorUsuario.label" default="Sector Usuario" /></th>
			
				<th><g:message code="direccionUsuario.ciudadUsuario.label" default="Ciudad Usuario" /></th>
			
				<th><g:message code="direccionUsuario.usuario.label" default="Usuario" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${direccionUsuarioInstanceList}" status="i" var="direccionUsuarioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${direccionUsuarioInstance.id}">${fieldValue(bean: direccionUsuarioInstance, field: "calleUsuario")}</g:link></td>
			
				<td>${fieldValue(bean: direccionUsuarioInstance, field: "numeroUsuario")}</td>
			
				<td>${fieldValue(bean: direccionUsuarioInstance, field: "departamentoUsuario")}</td>
			
				<td>${fieldValue(bean: direccionUsuarioInstance, field: "sectorUsuario")}</td>
			
				<td>${fieldValue(bean: direccionUsuarioInstance, field: "ciudadUsuario")}</td>
			
				<td>${fieldValue(bean: direccionUsuarioInstance, field: "usuario")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${direccionUsuarioInstanceTotal}" />
	</div>
</section>

</body>

</html>
