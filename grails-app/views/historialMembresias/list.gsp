
<%@ page import="org.control.HistorialMembresias" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historialMembresias.label', default: 'HistorialMembresias')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
    %{--Filter Pane--}%
    <r:require module="filterpane" />
</head>

<body>
	
<section id="list-historialMembresias" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
                <g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" />
                <g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" />
                <g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" />
				<th><g:message code="historialMembresias.plan.label" default="Plan" /></th>
				%{--<g:sortableColumn property="plan" params="${plan}" title="${message(code: 'historialMembresias.plan.label', default: 'Plan')}" />--}%
				<g:sortableColumn property="diasCongelacion" title="${message(code: 'historialMembresias.diasCongelacion.label', default: 'Dias Congelacion')}" />
				<th><g:message code="historialMembresias.promocionDeMatricula.label" default="Promocion De Matricula" /></th>
				<g:sortableColumn property="fechaInicio" title="${message(code: 'historialMembresias.fechaInicio.label', default: 'Fecha Inicio')}" />
				<g:sortableColumn property="fechaFin" title="${message(code: 'historialMembresias.fechaFin.label', default: 'Fecha Fin')}" />
				%{--<th><g:message code="historialMembresias.autorizadoPor.label" default="Autorizado Por" /></th>--}%
			</tr>
		</thead>
		<tbody>
		<g:each in="${historialMembresiasInstanceList}" status="i" var="historialMembresiasInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link action="show" id="${historialMembresiasInstance.usuario.id}">${fieldValue(bean: historialMembresiasInstance, field: "usuario.nombre")}</g:link></td>
                <td>${fieldValue(bean: historialMembresiasInstance, field: "usuario.apellidoPaterno")}</td>
                <td>${fieldValue(bean: historialMembresiasInstance, field: "usuario.apellidoMaterno")}</td>

				<td><g:link action="show" id="${historialMembresiasInstance.id}">${fieldValue(bean: historialMembresiasInstance, field: "plan")}</g:link></td>
				%{--<td>${fieldValue(bean: historialMembresiasInstance, field: "plan")}</td>--}%
				<td>${fieldValue(bean: historialMembresiasInstance, field: "diasCongelacion")}</td>
				<td>${fieldValue(bean: historialMembresiasInstance, field: "promocionDeMatricula")}</td>
				<td><g:formatDate date="${historialMembresiasInstance.fechaInicio}" /></td>
				<td><g:formatDate date="${historialMembresiasInstance.fechaFin}" /></td>
				%{--<td>${fieldValue(bean: historialMembresiasInstance, field: "autorizadoPor")}</td>--}%
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${historialMembresiasInstanceTotal}" />
        <filterpane:filterButton  text="${message(code: 'fp.tag.filterButton.text', default: 'Filtro x Membresia')}" filterPaneId="1"/>
        %{--<filterpane:filterButton  text="${message(code: 'fp.tag.filterButton.Plan.text', default: 'Filtro x Planes')}" filterPaneId="2"/>--}%
	</div>
    %{--Filter Pane--}%
    %{--<filterpane:filterPane domain="HistorialMembresias, HistorialMembresias.plan" />--}%
    <filterpane:filterPane domain="HistorialMembresias" id="1" />
    %{--<filterpane:filterPane domain="Plan" id="2" controller="" />--}%
</section>

</body>

</html>
