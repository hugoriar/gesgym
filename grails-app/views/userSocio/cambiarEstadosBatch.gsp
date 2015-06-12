
<%@ page import="java.text.SimpleDateFormat; groovy.time.TimeCategory; org.control.UserSocio" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <tooltip:resources/>
    <export:resource />
    <r:require module="export"/>
    <r:require modules="datetimepicker-full"/>
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
    <g:set var="pars" value="[
            'usarFechas': usarFechas,
            'soloInactivos': soloInactivos,
            'estadoMembresiaId': estadoMembresiaId,
            'soloExpirados': soloExpirados,
            'planId': planId,
            'periodo': periodo,
            'desde': desde,
            'hasta': hasta
    ]"/>

	<g:set var="usuarios" value="${usuario}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

    <g:form action="cambiaEstadoAuto" class="form-horizontal" style="float: right; margin: 0 216px 0 0; ">
        <tooltip:tip value="Forzar al sistema a ejecutar procedimiento de Vencer usuarios Activos y Expirados">
            <g:submitButton name="cambiaEstadoAuto" class="btn btn-primary" style="position: absolute;" value="${message(code: 'default.button.buscar.label', default: 'Cambio de estado automático')}" />
        </tooltip:tip>
    </g:form>

   %{-- <g:form action="aMailsBatch" class="form-horizontal" style="float: right; margin: 40px 216px 0 0; ">
        <tooltip:tip value="Enviar emails a los usuarios seleccionados">
            <g:submitButton name="aMailsBatch" class="btn btn-primary" style="position: absolute;" value="${message(code: 'default.button.buscar.label', default: 'Enviar Emails')}" />
        </tooltip:tip>
    </g:form>--}%

    <g:form action="listCambiarEstadoBatch" class="form-horizontal">
        <fieldset class="form">
            %{--<legend>Filtrar:</legend>--}%
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <label for="estadoMembresia" class="control-label"><g:message code="userSocio.filtrarEstado.label" default="Filtrar por Estado: " /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <table>
                        <tbody>
                            <tr>
                                <td><g:select id="estadoMembresia" onchange="" name="estadoMembresiaId" from="${estadoMembresiaList}" optionKey="id" required="" value="${estadoMembresiaId}" class="many-to-one"/></td>
                                <td></td>
                                <td><tooltip:tip value="Busca sólo los socios cuya fecha de término ya expiró"><g:checkBox name="soloExpirados" checked="${soloExpirados}"/> Buscar sólo socios Expirados</tooltip:tip></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td><tooltip:tip value="Busca sólo los socios que no hayan venido en los últimos 30 días"><g:checkBox name="soloInactivos" checked="${soloInactivos}"/> Buscar sólo socios Inactivos</tooltip:tip></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <label for="estadoMembresia" class="control-label"><g:message code="userSocio.filtrarEstado.label" default="Filtrar por Plan: " /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:select id="plan" onchange="" name="planId" from="${planList}" optionKey="id" required="" value="${planId}" class="many-to-one"/>
                </div>
            </div>
            %{--<div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                    <g:checkBox name="usarFechas" checked="${usarFechas}" onchange="toogleCamposFechas();"/>
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.fechaTerminoEntre.label" default=" Con fecha de vencimiento entre: " /></label>
                </tooltip:tip>
                <div class="controls" id="controls">
                    <bs:datePicker name="desde" id="desde" precision="day" value="${desde}" default="none" noSelection="['': 'Entre']" />
                    y <bs:datePicker name="hasta" id="hasta" precision="day" value="${hasta}" default="none" noSelection="['': 'Hasta']" />
                    <g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> --}%%{--${userSocioInstanceTotal} Resultados--}%%{--
                </div>
            </div>--}%

            <div class="control-group fieldcontain ${hasErrors(bean: pagoInstance, field: 'estadoMembresia', 'error')}">
                <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                    <g:checkBox name="usarFechas" checked="${usarFechas}" onchange="toogleCamposFechas();"/>
                    <label for="usarFechas" class="control-label"><g:message code="user.fechaTerminoEntre.label" default=" Periodo: " /></label>
                </tooltip:tip>
                %{--<g:select name="periodo" id="periodo" value="${periodo}" onclick='activaFechas()' onchange="changePeriodo(this)" from="['Personalizado','Hoy','Mañana','Esta semana','La próxima semana','Este mes','El próximo mes','Próximos 7 días','Próximos 30 días','Este año']"/>--}%
                <g:select name="periodo" id="periodo" value="${periodo}" onclick='activaFechas()' onchange="changePeriodo(this)" from="['Personalizado', 'Hoy', 'Ayer', 'Mañana', 'Esta semana', 'La semana pasada', 'La próxima semana', 'Este mes', 'El mes pasado', 'El próximo mes', 'Últimos 7 días', 'Próximos 7 días', 'Últimos 30 días', 'Próximos 30 días', 'Este año']"/>
                <div id="divPeriodo" class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'estadoMembresia', 'error')}">
                    <div class="controls" id="controls">
                        <g:textField name="desde" id="desde" value="${desde}" onclick="resetPeriodo()"/> - <g:textField name="hasta" id="hasta" value="${hasta}" onclick="resetPeriodo()"/>
                        <g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> %{--${pagoInstanceTotal} Resultados--}%
                    </div>
                </div>
            </div>
        </fieldset>
    </g:form>

    %{--<g:jasperReport jasper="sample-jasper-plugin" format="PDF,HTML,XML,CSV,XLS,RTF,TEXT,ODT,ODS,DOCX,XLSX,PPTX" name="Parameter Example">--}%
    %{--<custom:jasperForm
            controller="userSocio"
            action="generateReportMembresias"
            name="Contrato_}"
            id="id"
            historialMembresiasInstanceId="ola"
            jasper="datos_contrato" >--}%

    <g:form action="cambiaEstadoBatch" class="form-horizontal" name="myform" id="myform">
    <section id="show-userSocio" class="first">
        <table class="table table-bordered table-hover" id="domainTable">
            <thead>
                <tr>
                    <td style="text-align: center"><g:checkBox name="select_all" value="" checked="true" onclick='selectAll();'/> </td>
                    <g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" params="${pars}" />
                    <g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" params="${pars}" />
                    <g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" params="${pars}" />
                    <g:sortableColumn property="fono" title="${message(code: 'userSocio.fono.label', default: 'Fono')}" params="${pars}" />
                    <g:sortableColumn property="email" title="${message(code: 'userSocio.email.label', default: 'Email')}" params="${pars}" />
                    <th><g:message code="historialMembresias.plan.label" default="Plan" /></th>
                    <g:sortableColumn property="estadoMembresia" title="Estado" params="${pars}" />
                    <th>Enrolado</th>
                    %{--<g:sortableColumn property="enrolado" title="${message(code: 'userSocio.enrolado.label', default: 'Enrolado')}" params="['usarFechas': usarFechas, 'soloInactivos': soloInactivos, 'estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />--}%
                    <g:sortableColumn property="ultimaVisita" title="${message(code: 'userSocio.ultimaVisita.label', default: 'Última Visita')}" params="${pars}" />
                    <g:sortableColumn property="historialMembresias.fechaFin" title="${message(code: 'userSocio.historialMembresias.fechaFin.label', default: 'Término Plan')}" params="${pars}" />
                </tr>
            </thead>
            <tbody>
                <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td style="text-align: center">
                            <g:checkBox id="usuario" name="usuario" value="${fieldValue(bean: userSocioInstance, field: "id")}" checked="true" onclick="countCbActivos(this)"/> </td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance.nombre.toLowerCase()?.capitalize()}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance.apellidoPaterno.toLowerCase()?.capitalize()}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance.apellidoMaterno.toLowerCase()?.capitalize()}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance.getFonos(true,true,false,2," - ")}</g:link></td>
                        %{--<td><g:link action="show" id="${userSocioInstance.id}">${(userSocioInstance.fono?userSocioInstance.fono:userSocioInstance.fonoCelular?userSocioInstance.fonoCelular:userSocioInstance.fonoTrabajo?userSocioInstance.fonoTrabajo:"S/N")}</g:link></td>--}%
                        <td><g:link action="show" id="${userSocioInstance.id}">${userSocioInstance.email?.toLowerCase()}</g:link></td>
                        <td>${userSocioInstance.getUltimoPlan()?.plan?.nombre} </td>
                        <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                            <tooltip:tip value="${userSocioInstance?.estadoMembresia?.descripcion}">
                                ${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}
                            </tooltip:tip>
                        </td>
                        <td>
                            <g:if test="${userSocioInstance?.huella()}">
                                <tooltip:tip value="Enrolado el ${userSocioInstance.huella()?.dateCreated?.format("dd-MM-yy")}">
                                    <g:link action="show" controller="huella" id="${userSocioInstance.huella()?.id}">
                                        Si
                                    </g:link>
                                </tooltip:tip>
                            </g:if>
                            <g:else>
                                <div style="color: red">
                                    No
                                </div>
                            </g:else>
                        </td>
                        <td>
                            <g:if test="${userSocioInstance.visitas.size() > 0}">
                                <tooltip:tip value="${'Hace ' + -(TimeCategory.minus(userSocioInstance.getUltimaVisita()?.fechaDeVisita, new Date()).days) +' días'}">
                                        ${userSocioInstance.ultimaVisita.fechaDeVisita?.format("dd-MM-yy")} ${userSocioInstance.ultimaVisita.horaDeEntrada?.format("HH:mm")}
                                </tooltip:tip>
                            </g:if>
                        </td>
                        <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                            <g:if test="${userSocioInstance?.historialMembresias}">
                                <tooltip:tip value="Del ${userSocioInstance.getUltimoPlan().fechaInicio?.getDateString()} al ${userSocioInstance.getUltimoPlan().fechaFin?.getDateString()}">
                                    ${userSocioInstance.getUltimoPlan().fechaFin?.getDateString()} (${(TimeCategory.minus(userSocioInstance.getUltimoPlan()?.fechaFin, new Date()).days).abs()} días)
                                    <g:if test="${(TimeCategory.minus(userSocioInstance.getUltimoPlan()?.fechaFin, new Date()).days) < 0}">
                                        <g:if test="${userSocioInstance.estadoMembresia?.id == 1}">
                                            <img style="height: 20px !important;" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningRed"+'.png')}" />
                                            %{--<img class="accionIcon" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningRed"+'.png')}" />--}%
                                        </g:if>
                                        <g:else>
                                            <img style="height: 20px !important;" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningYellow"+'.png')}" />
                                            %{--<img class="accionIcon" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningYellow"+'.png')}" />--}%
                                        </g:else>
                                    </g:if>
                                </tooltip:tip>
                            </g:if>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        %{--<export:formats formats="['pdf']" params="[
                'sort': sort,
                'order': order,
                'usarFechas': usarFechas,
                'soloInactivos': soloInactivos,
                'estadoMembresiaId': estadoMembresiaId,
                'soloExpirados': soloExpirados,
                'desde': desdeFormateado,
                'hasta': hastaFormateado,
                'planId': planId
        ]"/>--}%
        ${userSocioInstanceTotal} Resultados
        <br/>
            <fieldset class="form">
                %{--<legend>Operación:</legend>--}%
                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')} required">
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.cambiarEstado.label" default="Cambiar Estado a:" /><span class="required-indicator">*</span></label>
                    <div class="controls">
                        <g:select id="estadoMembresia" name="estadoMembresiaNuevo" from="${org.control.EstadoMembresia.list()}" optionKey="id" required="" value="${org.control.EstadoMembresia.findById(2)?.id}" class="many-to-one"/>
                    </div>
                </div>
            </fieldset>

            %{--Llenamos compos escondidos con datos de la consulta del formulario anterior--}%
            <g:hiddenField name="estadoMembresiaId" value="${estadoMembresiaId}" />
            <g:hiddenField name="soloExpirados" value="${soloExpirados}" />
            <g:hiddenField name="soloInactivos" value="${soloInactivos}" />
            <g:hiddenField name="usarFechas" value="${usarFechas}" />
            <g:hiddenField name="planId" value="${planId}" />
            <g:hiddenField name="desde" value="${desde}" />
            <g:hiddenField name="hasta" value="${hasta}" />
            %{--<g:hiddenField name="desde" value="${new SimpleDateFormat('dd-MM-yyyy').format(desde)}" />
            <g:hiddenField name="hasta" value="${new SimpleDateFormat('dd-MM-yyyy').format(hasta)}" />--}%
            <div class="form-actions">
                <g:submitButton name="cambiaEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.cambiaEstadoBatch.label', default: 'Cambiar Estados')}" />

                <tooltip:tip value="Crear reporte en PDF con registros seleccionados">
                    <g:submitButton formaction="generaReportes" name="generaReportes" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Crear Reporte')}"/>
                </tooltip:tip>

                <tooltip:tip value="Enviar emails a los usuarios seleccionados">
                    <g:submitButton formaction="aMailsBatch" name="aMailsBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Enviar Emails')}" />
                </tooltip:tip>
                <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </div>
    </g:form>
    %{--</custom:jasperForm>--}%

    </section>

<script type="text/javascript">

    function selectAll(){//this function is used to check or uncheck all checkboxes
        var select = document.getElementById('select_all');
        var checkboxes = document.forms['myform'].elements['usuario'];
        if (select.checked){
            for (i = 0; i < checkboxes.length; i++) checkboxes[i].checked = true;
        }else{
            for (i = 0; i < checkboxes.length; i++) checkboxes[i].checked = false;
        }
    }//this function works fine

    $(document).ready(function() {
        toogleCamposFechas();
    });

    function countCbActivos(e){
        return $("input:checkbox:checked").length -2;
    }

</script>
</body>

</html>