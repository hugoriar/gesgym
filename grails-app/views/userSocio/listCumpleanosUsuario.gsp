
<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
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
                <g:sortableColumn property="fechaNacimiento" defaultOrder="desc" title="${message(code: 'userSocio.cumpleanos.label', default: 'Cumpleaños')}" />
			</tr>
		</thead>
		<tbody>
        <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</td>
                %{--<g:if test="${(userSocioInstance.fechaNacimiento.month() == mes) && (userSocioInstance.fechaNacimiento.date() == dia)}">--}%
                %{--<g:if test="${(userSocioInstance.fechaNacimiento.getMonth() != -1) && (userSocioInstance.fechaNacimiento.getDate() != -1)}">--}%
                    %{--<td style="color: red;">${fieldValue(bean: userSocioInstance, field: "fechaNacimiento")}</td>--}%
                    <g:if test="${(userSocioInstance.fechaNacimiento.month == mes) && (userSocioInstance.fechaNacimiento.date == dia)}">
                        <td style="color: red;">${fieldValue(bean: userSocioInstance, field: "fechaNacimiento")}</td>
                    </g:if>
                %{--</g:if>--}%

                %{--<g:elseif test="${(userSocioInstance.fechaNacimiento.month == mes)}">
                    <td style="color: yellowgreen;">${fieldValue(bean: userSocioInstance, field: "fechaNacimiento")}</td>
                </g:elseif>--}%
                <g:else>
                    <td>${fieldValue(bean: userSocioInstance, field: "fechaNacimiento")}</td>
                </g:else>
            </tr>
        </g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userSocioInstanceTotal}" />
	</div>
</section>

</body>

</html>
