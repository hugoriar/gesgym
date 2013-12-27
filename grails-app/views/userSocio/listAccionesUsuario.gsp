
<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title>${message(code: 'userSocio.'+accion+'.label', default: 'Acción')}</title>
</head>

<body>
	
<section id="list-userSocio" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="nombre"             title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" />
				<g:sortableColumn property="apellidoPaterno"    title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" />
				<g:sortableColumn property="apellidoMaterno"    title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" />
				<g:sortableColumn property="rut"                title="${message(code: 'userSocio.rut.label', default: 'Rut')}" />
				<g:sortableColumn property="estadoMembresia"                title="${message(code: 'userSocio.estadoMembresia.label', default: 'Estado')}" />
				<td title="Acción" >Acción</td>
			</tr>
		</thead>
		<tbody>
        <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "rut")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "estadoMembresia.estado")}</td>
                <td>
                    %{--<g:hiddenField name="accion" value="${accion}" id="accion"/>--}%
                    <g:if test="${accion == 'eliminarUsuario'}">
                        <g:render template="/_common/modals/deleteTextLink"/>
                    </g:if>
                    <g:else>
                        <g:link action="${accion}" id="${userSocioInstance.id}">
                            %{--<img class="accionIcon" alt="${accion}" src="${resource(dir: 'images/icons/acciones',file: accion+'.png')}" />--}%
                            ${message(code: 'userSocio.'+accion+'.label', default: 'Acción')}
                        </g:link>
                    </g:else>
                </td>
            </tr>
        </g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${userSocioInstanceTotal}" params="${[accion: accion]}" />
	</div>
</section>

</body>

</html>
