
<%@ page import="org.control.UserSocio" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
    %{--Filter Pane--}%
    <r:require module="filterpane" />
    %{--<r:require module="typeahead-js" />--}%
    %{--<r:require modules="typeahead-bootstrap-css"/>--}%
    %{--<g:javascript>

        var users = [
            <g:each in="${userSocioInstanceCompleteList}" var="u">
                '${ (u?.nombre +" "+ u?.apellidoPaterno +" "+ u?.apellidoMaterno).toUpperCase() }',
            </g:each>
        ];

        $('#typeahead').typeahead({
            'local': users
        });

    </g:javascript>
    <style>
        /*.container { margin:30px; }*/

        .twitter-typeahead {
            width: 100%;
            position: relative;
        }
        .twitter-typeahead .tt-query,
        .twitter-typeahead .tt-hint {
            margin-bottom: 0;
            width:100%;
            height: 34px;
            position: absolute;
            top:0;
            left:0;
        }
        .twitter-typeahead .tt-hint {
            color:#a1a1a1;
            z-index: 1;
            padding: 6px 12px;
            border:1px solid transparent;
        }
        .twitter-typeahead .tt-query {
            z-index: 2;
            border-radius: 4px!important;
            border-top-right-radius: 0!important;
            border-bottom-right-radius: 0!important;
        }

        .tt-dropdown-menu {
            min-width: 160px;
            margin-top: 2px;
            padding: 5px 0;
            background-color: #fff;
            border: 1px solid #ccc;
            border: 1px solid rgba(0,0,0,.2);
            *border-right-width: 2px;
            *border-bottom-width: 2px;
            -webkit-border-radius: 6px;
            -moz-border-radius: 6px;
            border-radius: 6px;
            -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
            -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
            box-shadow: 0 5px 10px rgba(0,0,0,.2);
            -webkit-background-clip: padding-box;
            -moz-background-clip: padding;
            background-clip: padding-box;
        }

        .tt-suggestion {
            display: block;
            padding: 3px 20px;
        }

        .tt-suggestion.tt-is-under-cursor {
            color: #fff;
            background-color: #0081c2;
            background-image: -moz-linear-gradient(top, #0088cc, #0077b3);
            background-image: -webkit-gradient(linear, 0 0, 0 100%, from(#0088cc), to(#0077b3));
            background-image: -webkit-linear-gradient(top, #0088cc, #0077b3);
            background-image: -o-linear-gradient(top, #0088cc, #0077b3);
            background-image: linear-gradient(to bottom, #0088cc, #0077b3);
            background-repeat: repeat-x;
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#ff0088cc', endColorstr='#ff0077b3', GradientType=0)
        }

        .tt-suggestion.tt-is-under-cursor a {
            color: #fff;
        }

        .tt-suggestion p {
            margin: 0;
        }
    </style>--}%
</head>

<body>

<section id="list-userSocio" class="first">
    %{--<input class="typeahead" type="text" id="typeahead" placeholder="Buscar socio...">--}%

    <div class="table-responsive">
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
				<td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</g:link></td>
				<td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</g:link></td>
				<td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</g:link></td>
				<td style="color: ${userSocioInstance?.estadoMembresia?.color}">${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}</td>
				<td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                    <g:if test="${userSocioInstance?.historialMembresias}">
                        ${userSocioInstance.ultimoPlan.fechaFin?.getDateString()}
                    </g:if>
                </td>
			</tr>
		</g:each>
		</tbody>
	</table>
        </div>
	<div class="pagination">
		<bs:paginate total="${userSocioInstanceTotal}" />
        %{--<filterpane:filterButton  text="${message(code: 'fp.tag.filterButton.text', default: 'Aplicar Filtro')}" />--}%
	</div>
    <filterpane:filterPane domain="UserSocio" visible="true" filterProperties="nombre, apellidoPaterno, apellidoMaterno, rut"/>
</section>

</body>

</html>
