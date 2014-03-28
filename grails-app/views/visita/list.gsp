
<%@ page import="java.text.SimpleDateFormat; org.gym.Visita" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'visita.label', default: 'Visita')}" />
    <g:set var="desdeFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(desde)}" />
    <g:set var="hastaFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(hasta)}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
    <export:resource />
</head>

<body>
<h1 style="vertical-align: bottom;"><img src="${resource(dir: 'images',file: 'asistencia.png')}" />Listado de Asistencias</h1>
<br/>
    <g:form action="list" class="form-horizontal">
        <fieldset class="form">
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.fechaTerminoEntre.label" default="Entre los días: " /></label>
                </tooltip:tip>
                <div class="controls" id="controls">
                    <bs:datePicker name="desde" id="desde" precision="day" value="${desde}" default="none" noSelection="['': 'Entre']" />
                    y <bs:datePicker name="hasta" id="hasta" precision="day" value="${hasta}" default="none" noSelection="['': 'Hasta']" />
                    <g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> %{--${userSocioInstanceTotal} Resultados--}%
                </div>
            </div>
        </fieldset>
    </g:form>
	
<section id="list-visita" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<th><g:message code="visita.usuario.label" default="Usuario" /></th>
                %{--<th><g:message code="visita.usuario.label" default="Rut" /></th>--}%
                %{--<th>${message(code: 'visita.horaDeSalida.label', default: 'Estado')}</th>--}%
                <g:sortableColumn property="fechaDeVisita" title="${message(code: 'visita.fechaDeVisita.label', default: 'Fecha De Visita')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado]"/>
				<g:sortableColumn property="horaDeEntrada" title="${message(code: 'visita.horaDeEntrada.label', default: 'Hora De Entrada')}" params="['desde': desdeFormateado, 'hasta': hastaFormateado]"/>
				%{--<g:sortableColumn property="horaDeSalida" title="${message(code: 'visita.horaDeSalida.label', default: 'Hora De Salida')}" />--}%
			</tr>
		</thead>
		<tbody>
		<g:each in="${visitaInstanceList}" status="i" var="visitaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" controller="userSocio" id="${visitaInstance.usuario?.id}">${fieldValue(bean: visitaInstance, field: "usuario")}</g:link></td>
                %{--<td><g:link action="show" controller="userSocio" id="${visitaInstance.usuario?.id}">${fieldValue(bean: visitaInstance, field: "usuario.rut")}</g:link></td>--}%
                %{--<td>${visitaInstance.usuario?.estadoMembresia}</td>--}%
                <td><g:link action="show" id="${visitaInstance.id}"><g:formatDate date="${visitaInstance.fechaDeVisita}" /></g:link></td>
				<td><g:formatDate date="${visitaInstance.horaDeEntrada}" format="HH:mm"/></td>
				%{--<td><g:formatDate date="${visitaInstance.horaDeSalida}" format="HH:MM"/></td>--}%
			</tr>
		</g:each>
		</tbody>
	</table>
	%{--<div class="pagination">--}%
		%{--<bs:paginate total="${visitaInstanceTotal}" />--}%
	%{--</div>--}%
    <export:formats formats="['pdf']" params="['desde': desdeFormateado, 'hasta': hastaFormateado]"/>
    ${visitaInstanceTotal} Resultados
    %{--<export:formats formats="['csv', 'excel', 'ods', 'pdf', 'rtf', 'xml']" params="['desde': desdeFormateado, 'hasta': hastaFormateado]"/>--}%
</section>

</body>

</html>
