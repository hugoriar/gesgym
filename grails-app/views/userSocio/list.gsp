
<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
    %{--Filter Pane--}%
    <r:require module="filterpane" />
</head>

<body>

<section id="list-userSocio" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" />
				<g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" />
				<g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" />
				<g:sortableColumn property="rut" title="${message(code: 'userSocio.rut.label', default: 'Rut')}" />
				<g:sortableColumn property="estadoMembresia" title="${message(code: 'userSocio.estadoMembresia.label', default: 'Estado Membresía')}" />
				<g:sortableColumn property="historialMembresias.fechaFin" title="${message(code: 'userSocio.historialMembresias.fechaFin.label', default: 'Término Plan')}" />
			</tr>
		</thead>
		<tbody>
		<g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
				<td>${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</td>
				<td>${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</td>
				<td>${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</td>
				<td>${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}</td>
				<td>
                    <g:if test="${userSocioInstance?.historialMembresias}">
                        ${userSocioInstance.historialMembresias.last().fechaFin?.getDateString()}
                    </g:if>
                </td>
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userSocioInstanceTotal}" />
        %{--Filter Pane--}%
        <filterpane:filterButton  text="${message(code: 'fp.tag.filterButton.text', default: 'Aplicar Filtro')}" />
	</div>
    %{--Filter Pane--}%
    <filterpane:filterPane domain="UserSocio" filterProperties="nombre, apellidoPaterno, apellidoMaterno, rut, fechaNacimiento"/>
    %{--<filterpane:filterPane domain="UserSocio"/>--}%
</section>

</body>

</html>
