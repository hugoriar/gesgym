
<%@ page import="org.control.DireccionEmpresa" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'direccionEmpresa.label', default: 'DireccionEmpresa')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-direccionEmpresa" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="calleEmpresa" title="${message(code: 'direccionEmpresa.calleEmpresa.label', default: 'Calle Empresa')}" />
			
				<g:sortableColumn property="numeroEmpresa" title="${message(code: 'direccionEmpresa.numeroEmpresa.label', default: 'Numero Empresa')}" />
			
				<g:sortableColumn property="oficinaEmpresa" title="${message(code: 'direccionEmpresa.oficinaEmpresa.label', default: 'Oficina Empresa')}" />
			
				<th><g:message code="direccionEmpresa.sectorEmpresa.label" default="Sector Empresa" /></th>
			
				<th><g:message code="direccionEmpresa.ciudadEmpresa.label" default="Ciudad Empresa" /></th>
			
				<g:sortableColumn property="codigoPostalEmpresa" title="${message(code: 'direccionEmpresa.codigoPostalEmpresa.label', default: 'Codigo Postal Empresa')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${direccionEmpresaInstanceList}" status="i" var="direccionEmpresaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${direccionEmpresaInstance.id}">${fieldValue(bean: direccionEmpresaInstance, field: "calleEmpresa")}</g:link></td>
			
				<td>${fieldValue(bean: direccionEmpresaInstance, field: "numeroEmpresa")}</td>
			
				<td>${fieldValue(bean: direccionEmpresaInstance, field: "oficinaEmpresa")}</td>
			
				<td>${fieldValue(bean: direccionEmpresaInstance, field: "sectorEmpresa")}</td>
			
				<td>${fieldValue(bean: direccionEmpresaInstance, field: "ciudadEmpresa")}</td>
			
				<td>${fieldValue(bean: direccionEmpresaInstance, field: "codigoPostalEmpresa")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${direccionEmpresaInstanceTotal}" />
	</div>
</section>

</body>

</html>
