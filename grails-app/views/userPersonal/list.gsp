
<%@ page import="org.control.UserPersonal" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userPersonal.label', default: 'UserPersonal')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-userPersonal" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				%{--<g:sortableColumn property="username" title="${message(code: 'userPersonal.username.label', default: 'Username')}" />--}%
			%{----}%
				%{--<g:sortableColumn property="password" title="${message(code: 'userPersonal.password.label', default: 'Password')}" />--}%
			
				<g:sortableColumn property="nombre" title="${message(code: 'userPersonal.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="apellidoPaterno" title="${message(code: 'userPersonal.apellidoPaterno.label', default: 'Apellido Paterno')}" />
			
				<g:sortableColumn property="apellidoMaterno" title="${message(code: 'userPersonal.apellidoMaterno.label', default: 'Apellido Materno')}" />
			
				<g:sortableColumn property="rut" title="${message(code: 'userPersonal.rut.label', default: 'Rut')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userPersonalInstanceList}" status="i" var="userPersonalInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				%{--<td>${fieldValue(bean: userPersonalInstance, field: "username")}</td>--}%
			%{----}%
				%{--<td>${fieldValue(bean: userPersonalInstance, field: "password")}</td>--}%
			
				<td><g:link action="show" id="${userPersonalInstance.id}">${fieldValue(bean: userPersonalInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: userPersonalInstance, field: "apellidoPaterno")}</td>
			
				<td>${fieldValue(bean: userPersonalInstance, field: "apellidoMaterno")}</td>
			
				<td>${fieldValue(bean: userPersonalInstance, field: "rut")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userPersonalInstanceTotal}" />
	</div>
</section>

</body>

</html>
