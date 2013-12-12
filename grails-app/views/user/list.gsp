
<%@ page import="org.gym.User" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-user" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="username" title="${message(code: 'user.username.label', default: 'Username')}" />
			
				<g:sortableColumn property="password" title="${message(code: 'user.password.label', default: 'Password')}" />
			
				<g:sortableColumn property="nombre" title="${message(code: 'user.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="apellidoPaterno" title="${message(code: 'user.apellidoPaterno.label', default: 'Apellido Paterno')}" />
			
				<g:sortableColumn property="apellidoMaterno" title="${message(code: 'user.apellidoMaterno.label', default: 'Apellido Materno')}" />
			
				<g:sortableColumn property="rut" title="${message(code: 'user.rut.label', default: 'Rut')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userInstanceList}" status="i" var="userInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "username")}</g:link></td>
			
				<td>${fieldValue(bean: userInstance, field: "password")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "nombre")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "apellidoPaterno")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "apellidoMaterno")}</td>
			
				<td>${fieldValue(bean: userInstance, field: "rut")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userInstanceTotal}" />
	</div>
</section>

</body>

</html>
