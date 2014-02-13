
<%@ page import="java.text.SimpleDateFormat; groovy.time.TimeCategory; org.gym.UserSocio" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <tooltip:resources/>
    <r:require module="export"/>
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<g:set var="desdeFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(desde)}" />
	<g:set var="hastaFormateado" value="${new SimpleDateFormat('dd-MM-yyyy').format(hasta)}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>

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

        function toogleCamposFechas(){
            var cbUsarFecha = document.getElementById('usarFechas');
            var fieldDesde = document.getElementById('desde');
            var fieldhasta = document.getElementById('hasta');
            if (cbUsarFecha.checked){
                fieldDesde.disabled = false;
                fieldhasta.disabled = false;
            }else{
                fieldDesde.disabled = true;
                fieldhasta.disabled = true;
                fieldDesde.readonly = true;
                fieldhasta.readonly = true;
                $("#fieldDesde").hide();
                $("#fieldhasta").hide();
            }
        }

        $(document).ready(function() {
//            if($("#desde").val() == "Close"){
//                $("#floyd").hide();
            toogleCamposFechas();
//            }
        });

        function countCbActivos(){
            return $("input:checkbox:checked").length -2;
        }
    </script>

    <script type="text/javascript" src="/js/jquery/i18n/jquery.ui.datepicker-es.js"></script>

</head>

<body>

    <g:form action="cambiaEstadoAuto" class="form-horizontal" style="float: right; margin: 0px 216px 0px 0px; ">
        <tooltip:tip value="Forzar al sistema a ejecutar procedimiento de Vencer usuarios Activos y Expirados">
            <g:submitButton name="cambiaEstadoAuto" class="btn btn-primary" style="position: absolute;" value="${message(code: 'default.button.buscar.label', default: 'Cambio de estado automático')}" />
        </tooltip:tip>
    </g:form>

    <g:form action="listCambiarEstadoBatch" class="form-horizontal">
        <fieldset class="form">
            %{--<legend>Filtrar:</legend>--}%
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <label for="estadoMembresia" class="control-label"><g:message code="userSocio.filtrarEstado.label" default="Filtrar por Estado: " /><span class="required-indicator">*</span></label>
                <div class="controls">
                    <g:select id="estadoMembresia" onchange="" name="estadoMembresiaId" from="${estadoMembresiaList}" optionKey="id" required="" value="${estadoMembresiaId}" class="many-to-one"/>%{--${userSocioInstanceTotal} resultados--}%
                    <tooltip:tip value="Busca sólo los socios cuya fecha de término ya expiró"><g:checkBox name="soloExpirados" checked="${soloExpirados}"/> Buscar sólo socios Expirados<br/></tooltip:tip>
                </div>
            </div>
            <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                <tooltip:tip value="Filtrar resultados según el rango de fechas especificado">
                    <g:checkBox name="usarFechas" checked="${usarFechas}" onchange="toogleCamposFechas();"/>
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.fechaTerminoEntre.label" default=" Con fecha de vencimiento entre: " /></label>
                </tooltip:tip>
                <div class="controls" id="controls">
                    <bs:datePicker name="desde" id="desde" precision="day" value="${desde}" default="none" noSelection="['': 'Entre']" />
                    y <bs:datePicker name="hasta" id="hasta" precision="day" value="${hasta}" default="none" noSelection="['': 'Hasta']" />
                    <g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /> %{--${userSocioInstanceTotal} Resultados--}%
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
        <table class="table table-bordered" id="domainTable">
            <thead>
                <tr>
                    <td style="text-align: center"><g:checkBox name="select_all" value="" checked="true" onclick='selectAll();'/> </td>
                    <g:sortableColumn property="nombre" title="${message(code: 'userSocio.nombre.label', default: 'Nombre')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                    <g:sortableColumn property="apellidoPaterno" title="${message(code: 'userSocio.apellidoPaterno.label', default: 'Apellido Paterno')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                    <g:sortableColumn property="apellidoMaterno" title="${message(code: 'userSocio.apellidoMaterno.label', default: 'Apellido Materno')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                    <g:sortableColumn property="rut" title="${message(code: 'userSocio.rut.label', default: 'Rut')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                    <g:sortableColumn property="estadoMembresia" title="${message(code: 'userSocio.estadoMembresia.label', default: 'Estado Membresía')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                    <g:sortableColumn property="historialMembresias.fechaFin" title="${message(code: 'userSocio.historialMembresias.fechaFin.label', default: 'Término Plan')}" params="['estadoMembresiaId': estadoMembresiaId, 'soloExpirados': soloExpirados, 'desde': desdeFormateado, 'hasta': hastaFormateado]" />
                </tr>
            </thead>
            <tbody>
                <g:each in="${userSocioInstanceList}" status="i" var="userSocioInstance">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td style="text-align: center"><g:checkBox id="usuario" name="usuario" value="${fieldValue(bean: userSocioInstance, field: "id")}" checked="true" onclick="countCbActivos()"/> </td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "nombre")}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</g:link></td>
                        <td><g:link action="show" id="${userSocioInstance.id}">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</g:link></td>
                        <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                            <tooltip:tip value="${userSocioInstance?.estadoMembresia?.descripcion}">
                                ${fieldValue(bean: userSocioInstance, field: "estadoMembresia")}
                            </tooltip:tip>
                        </td>
                        <td style="color: ${userSocioInstance?.estadoMembresia?.color}">
                        <g:if test="${userSocioInstance?.historialMembresias}">
                            <tooltip:tip value="Del ${userSocioInstance.historialMembresias.last().fechaInicio?.getDateString()} al ${userSocioInstance.historialMembresias.last().fechaFin?.getDateString()}">
                                ${userSocioInstance.historialMembresias.last().fechaFin?.getDateString()} (${(TimeCategory.minus(userSocioInstance.historialMembresias.last()?.fechaFin, new Date()).days).abs()} días)
                                <g:if test="${(TimeCategory.minus(userSocioInstance.historialMembresias.last()?.fechaFin, new Date()).days) < 0}">
                                    <g:if test="${userSocioInstance.estadoMembresia?.id == 1}">
                                        <img class="accionIcon" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningRed"+'.png')}" />
                                    </g:if>
                                    <g:else>
                                        <img class="accionIcon" alt="Vencer!" src="${resource(dir: 'images/icons/warning',file: "warningYellow"+'.png')}" />
                                    </g:else>
                                </g:if>
                            </tooltip:tip>
                        </g:if>
                        </td>
                    </tr>
                </g:each>
            </tbody>
        </table>
        ${userSocioInstanceTotal} Resultados
        <br/>
            <fieldset class="form">
                %{--<legend>Operación:</legend>--}%
                <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')} required">
                    <label for="estadoMembresia" class="control-label"><g:message code="userSocio.cambiarEstado.label" default="Cambiar Estado a:" /><span class="required-indicator">*</span></label>
                    <div class="controls">
                        <g:select id="estadoMembresia" name="estadoMembresiaNuevo" from="${org.gym.EstadoMembresia.list()}" optionKey="id" required="" value="${org.gym.EstadoMembresia.findById(2)?.id}" class="many-to-one"/>
                    </div>
                </div>
            </fieldset>

            <div class="form-actions">
                <g:submitButton name="cambiaEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.cambiaEstadoBatch.label', default: 'Cambiar Estados')}" />
                <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
            </div>
    </g:form>
    %{--</custom:jasperForm>--}%

    </section>
</body>

</html>
