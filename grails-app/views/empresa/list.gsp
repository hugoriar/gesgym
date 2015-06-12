
<%@ page import="org.control.Empresa" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-empresa" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreEmpresa" title="${message(code: 'empresa.nombreEmpresa.label', default: 'Nombre Empresa')}" />
			
				<th><g:message code="empresa.direccionEmpresa.label" default="Direccion Empresa" /></th>
			
				<g:sortableColumn property="fonoEmpresa" title="${message(code: 'empresa.fonoEmpresa.label', default: 'Fono Empresa')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${empresaInstance.id}">${fieldValue(bean: empresaInstance, field: "nombreEmpresa")}</g:link></td>
			
				<td>${fieldValue(bean: empresaInstance, field: "direccionEmpresa")}</td>
			
				<td>${fieldValue(bean: empresaInstance, field: "fonoEmpresa")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${empresaInstanceTotal}" />
	</div>
</section>

</body>

</html>
