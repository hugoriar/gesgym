
<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<g:set var="hoy" value="${Calendar.getInstance()}" />
	<g:set var="mes" value="${hoy.get(GregorianCalendar.MONTH)}" />
	<g:set var="dia" value="${hoy.get(GregorianCalendar.DAY_OF_MONTH)}" />
	<g:set var="anio" value="${hoy.get(GregorianCalendar.YEAR)}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
<h1 style="vertical-align: bottom;"><img class="cumpleanosImage" src="${resource(dir: 'images',file: 'gift.png')}" />Cumpleaños</h1>
<br/>

<g:form action="listCumpleanosUsuario" class="form-horizontal">
    <g:hiddenField name="operacion" value="cumpleanos"/>
    <g:hiddenField name="sort" value="fechaNacimiento"/>
    <fieldset class="form">
        <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
            <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                <label for="estadoMembresia" class="control-label"><g:message code="userSocio.fechaTerminoEntre.label" default="Fecha de cumpleaños entre: " /></label>
            </tooltip:tip>
            <div class="controls" id="controls">
                <g:field type="number" name="desdeDia" id="desdeDia" min="1" max="31" style="width: 3em" required="" value="${desdeDia.date}"/> <g:select name="desdeMes" id="desdeMes" style="width: 12em; text-transform: capitalize" from="${meses}" min="1" max="12" required="" value="${desdeMes.format('MMMM')}"/>
                y
                <g:field type="number" name="hastaDia" id="hastaDia" min="1" max="31" style="width: 3em" required="" value="${hastaDia.date}"/> <g:select name="hastaMes" id="hastaMes" style="width: 12em; text-transform: capitalize" from="${meses}" min="1" max="12" required="" value="${hastaMes.format('MMMM')}"/>
                <g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> %{--${userSocioInstanceTotal} Resultados--}%
            </div>
        </div>
    </fieldset>
</g:form>
	
<section id="list-userSocio" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
				<g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" />
				<g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" />
				<g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" />
                <g:sortableColumn property="estadoMembresia" title="${message(code: 'userSocio.estadoMembresia.label', default: 'Estado Membresía')}" />
                <g:sortableColumn property="fechaNacimiento" defaultOrder="desc" title="${message(code: 'userSocio.cumpleanos.label', default: 'Cumpleaños')}" />
			</tr>
		</thead>
		<tbody>
        <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</td>
                <td>${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</td>
                <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                    <tooltip:tip value="${userSocioInstance?.estadoMembresia?.descripcion}">
                        ${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}
                    </tooltip:tip>
                </td>
                <g:if test="${(userSocioInstance.fechaNacimiento?.month == mes) && (userSocioInstance.fechaNacimiento?.date == dia)}">
                    <td style="color: red;"><img class="accionIcon" src="${resource(dir: 'images',file: 'gift.png')}" />
                </g:if>
                <g:else>
                    <td>
                </g:else>
                    ${fieldValue(bean: userSocioInstance, field: "fechaNacimiento")} (${(anio - userSocioInstance.fechaNacimiento?.year)-1900} años)</td>
            </tr>
        </g:each>
		</tbody>
	</table>
	%{--<div class="pagination">
		<bs:paginate total="${userSocioInstanceTotal}" />
	</div>--}%
</section>

</body>

</html>
