
<%@ page import="org.gym.UserPersonalInstructor" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-userPersonalInstructor" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				%{--<g:sortableColumn property="username" title="${message(code: 'userPersonalInstructor.username.label', default: 'Username')}" />--}%
			%{----}%
				%{--<g:sortableColumn property="password" title="${message(code: 'userPersonalInstructor.password.label', default: 'Password')}" />--}%
			
				<g:sortableColumn property="nombre" title="${message(code: 'userPersonalInstructor.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="apellidoPaterno" title="${message(code: 'userPersonalInstructor.apellidoPaterno.label', default: 'Apellido Paterno')}" />
			
				<g:sortableColumn property="apellidoMaterno" title="${message(code: 'userPersonalInstructor.apellidoMaterno.label', default: 'Apellido Materno')}" />
			
				<g:sortableColumn property="rut" title="${message(code: 'userPersonalInstructor.rut.label', default: 'Rut')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${userPersonalInstructorInstanceList}" status="i" var="userPersonalInstructorInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				%{--<td>${fieldValue(bean: userPersonalInstructorInstance, field: "username")}</td>--}%
			%{----}%
				%{--<td>${fieldValue(bean: userPersonalInstructorInstance, field: "password")}</td>--}%
			
				<td><g:link action="show" id="${userPersonalInstructorInstance.id}">${fieldValue(bean: userPersonalInstructorInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: userPersonalInstructorInstance, field: "apellidoPaterno")}</td>
			
				<td>${fieldValue(bean: userPersonalInstructorInstance, field: "apellidoMaterno")}</td>
			
				<td>${fieldValue(bean: userPersonalInstructorInstance, field: "rut")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userPersonalInstructorInstanceTotal}" />
	</div>
</section>

</body>

</html>
