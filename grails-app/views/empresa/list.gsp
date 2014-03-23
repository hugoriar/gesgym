
<%@ page import="org.gym.UserSocio; org.gym.Empresa" %>
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

                <th><g:message code="empresa.usuarios.label" default="Usuarios" /></th>

			</tr>
		</thead>
		<tbody>
		<g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${empresaInstance.id}">${fieldValue(bean: empresaInstance, field: "nombreEmpresa")}</g:link></td>
			
				<g:if test="empresaInstance.direccionEmpresa == ${null}">
                    <td></td>
				</g:if>
                <g:else>
                    <td>${fieldValue(bean: empresaInstance, field: "direccionEmpresa")}</td>
                </g:else>

				<td>${fieldValue(bean: empresaInstance, field: "fonoEmpresa")}</td>

                <td>
                    <ul>
                    <g:each in="${UserSocio.findAllByEmpresa(empresaInstance)}" status="e" var="userSocioInstance">
                        <li><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance}</g:link></li>
                    </g:each>
                    </ul>
                </td>

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
