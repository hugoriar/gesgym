<%@ page import="org.control.LogAtributo; org.control.UserPersonal; org.control.LogEntidad; org.control.LogTipoOperacion; org.control.LogOperacion; java.text.SimpleDateFormat; groovy.time.TimeCategory;" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <tooltip:resources/>
    <export:resource />
    <r:require module="export"/>
    <r:require modules="datetimepicker-pasado"/>
    <r:require modules="ajax-select-user"/>
    <r:require modules="highcharts"/>
    <g:set var="entityName" value="Log de Operaciones" />
	%{--<g:set var="entityName" value="${message(code: 'logOperacion.label', default: 'LogOperacion')}" />--}%
	<title><g:message code="default.list.label" args="[entityName]" /></title>
    <tooltip:resources/>
</head>

<body>
	
<section id="list-logOperacion" class="first">
    <g:form action="buscador" class="form-horizontal">
        <div class="span6">
            <fieldset class="form">
                <br/>
                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
                    <label for="userSocioInstance" class="control-label"><g:message code="usuario.nombre.label" default="Nombre Usuario" /></label>
                    <div class="controls">
                        <g:hiddenField name="userSocioInstanceId" id="userSocioInstanceId" value="${userSocioInstanceId}"/>
                        <g:textField name="userSocioInstance" id="userSocioInstance" value="${userSocioInstance}"/>
                        <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')}</span>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
                    <label for="logTipoOperacionInstance" class="control-label"><g:message code="logTipoOperacion.label" default="Tipo de Operación" /></label>
                    <div class="controls">
                        <g:select id="logTipoOperacionInstance" name="logTipoOperacionInstanceId" from="${LogTipoOperacion.list([cache: true])}" optionKey="id" value="${logTipoOperacionInstanceId}" class="many-to-one" noSelection="['': '']"/>
                        <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'logTipoOperacionInstance', 'error')}</span>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'autorizadoPor', 'error')}">
                    <label for="autorizadoPorId" class="control-label"><g:message code="matricula.autorizadoPor.label" default="Operador" /></label>
                    <div class="controls">
                        <g:select id="autorizadoPorId" name="autorizadoPorId" from="${UserPersonal.list()}" optionKey="id" value="${params?.autorizadoPorId}" class="many-to-one" noSelection="['': '']"/>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
                    <label for="logEntidadInstance" class="control-label"><g:message code="logEntidad.label" default="Entidad" /></label>
                    <div class="controls">
                        <g:select id="logEntidadInstance" name="logEntidadInstanceId" from="${LogEntidad.list([cache: true])}" optionKey="id" value="${logEntidadInstanceId}" class="many-to-one" noSelection="['': '']"/>
                        <span class="help-inline">${hasErrors(bean: logEntidadInstance, field: 'logTipoOperacionInstance', 'error')}</span>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
                    <label for="logEntidadInstance" class="control-label"><g:message code="logEntidad.label" default="Atributo" /></label>
                    <div class="controls">
                        <g:select id="logAtributoInstance" name="logAtributoInstanceId" from="${LogAtributo.list([cache: true])}" optionKey="id" value="${logAtributoInstanceId}" class="many-to-one" noSelection="['': '']"/>
                        <span class="help-inline">${hasErrors(bean: logEntidadInstance, field: 'logAtributoInstance', 'error')}</span>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')}">
                    <label for="observaciones" class="control-label"><g:message code="concepto.label" default="Observaciones" /></label>
                    <div class="controls">
                        %{--<g:select id="observaciones" name="observaciones" from="['Si', 'No']" value="${params?.observaciones}" class="many-to-one" noSelection="['': '']"/>--}%
                        <g:checkBox name="observaciones" checked="${observaciones}"/>
                        <span class="help-inline">${hasErrors(bean: logEntidadInstance, field: 'observaciones', 'error')}</span>
                    </div>
                </div>

                <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'estadoMembresia', 'error')}">
                    <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                        <g:checkBox name="usarFechas" checked="${usarFechas}" onchange="toogleCamposFechas();"/>
                        <label for="usarFechas" class="control-label"><g:message code="user.fechaTerminoEntre.label" default="Periodo " /></label>
                    </tooltip:tip>
                    <g:select name="periodo" id="periodo" value="${periodo}" onclick='activaFechas()' onchange="changePeriodo(this)" from="['Personalizado', 'Hoy', 'Ayer', 'Esta semana', 'La semana pasada', 'Este mes', 'El mes pasado', 'Últimos 7 días', 'Últimos 30 días', 'Este año']"/>
                    <div id="divPeriodo" class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'estadoMembresia', 'error')}">
                        <div class="controls" id="controls">
                            <g:textField name="desde" id="desde" value="${desde}" onclick="resetPeriodo()"/> <g:textField name="hasta" id="hasta" value="${hasta}" onclick="resetPeriodo()"/>
                            <br/>
                            <br/>
                            <div style="float: none;"><g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" style="width: 56%;" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /></div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </div>
    </g:form>

	<table class="table table-bordered table-condensed table-hover">
		<thead>
			<tr>
                <th></th>
                <g:sortableColumn property="dateCreated" title="${message(code: "logOperacion.dateCreated.label", default: "Fecha")}" />
                <th><g:message code="logOperacion.dateCreated.label"   default="Hora"/></th>
                <g:sortableColumn property="personal" title="${message(code: "logOperacion.personal.label", default: "Operador")}" />
                <g:sortableColumn property="entidad" title="${message(code: "logOperacion.entidad.label" , default: "Entidad")}" />
                <g:sortableColumn property="socio" title="${message(code: "logOperacion.socio.label", default: "Socio")}" />
                <g:sortableColumn property="atributo" title="${message(code: "logOperacion.atributo.label", default: "Atributo")}" />
                <th><g:message code="logOperacion.valorAntiguo.label"  default="Valor Antiguo"  /></th>
                <th><g:message code="logOperacion.valorNuevo.label"    default="Valor Nuevo"    /></th>
                <th><g:message code="logOperacion.observaciones.label" default="Observaciones"  /></th>
			</tr>
		</thead>
		<tbody>
		<g:each in="${logOperacionesInstanceList}" status="i" var="logOperacionInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td style="text-align: center;">
                    <tooltip:tip value="${fieldValue(bean: logOperacionInstance, field: "tipoOperacion")}">
                        <g:link action="show" id="${logOperacionInstance.id}">
                            <img style="height: 20px !important;" alt="Vencer!" src="${resource(dir: 'images/icons/',file: logOperacionInstance.tipoOperacion?.icono+'.png')}" />
                        </g:link>
                    </tooltip:tip>
                </td>

                <td>${logOperacionInstance.dateCreated.format("EEE dd-MM-yy").capitalize()}</td>

                <td>${logOperacionInstance.dateCreated.format("HH:mm")}</td>

                <td>
                    <g:if test="${logOperacionInstance.personal}">
                        <g:link controller="userPersonal" action="show" id="${logOperacionInstance.personal?.id}">${logOperacionInstance.personal.nombre.toLowerCase()?.capitalize()}</g:link>
                    </g:if>
                    <g:else>
                        ${fieldValue(bean: logOperacionInstance, field: "modalidad")}
                    </g:else>
                </td>

                <td>
                    <g:if test="${logOperacionInstance.tipoOperacion?.id != 3}">
                        <g:link controller="${logOperacionInstance.entidad?.nombreTabla}" action="show" id="${logOperacionInstance?.idEntidad}">${fieldValue(bean: logOperacionInstance, field: "entidad")}</g:link>
                    </g:if>
                    <g:else>
                        <tooltip:tip value="${fieldValue(bean: logOperacionInstance, field: "valorAntiguo")}">
                            ${fieldValue(bean: logOperacionInstance, field: "entidad")}
                        </tooltip:tip>
                    </g:else>
                </td>

				<td><g:link controller="userSocio" action="show" id="${logOperacionInstance.socio?.id}">${fieldValue(bean: logOperacionInstance, field: "socio")}</g:link></td>

                <td>${fieldValue(bean: logOperacionInstance, field: "atributo")}</td>

                <td>
                <g:if test="${logOperacionInstance.tipoOperacion?.id != 3}">
                        ${fieldValue(bean: logOperacionInstance, field: "valorAntiguo")}
                </g:if>
                </td>

				<td>${fieldValue(bean: logOperacionInstance, field: "valorNuevo")}</td>

                <td>${fieldValue(bean: logOperacionInstance, field: "observaciones")}</td>

			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		%{--<bs:paginate total="${logOperacionesInstanceList.totalCount?:0}" />--}%
	</div>
</section>

</body>

</html>
