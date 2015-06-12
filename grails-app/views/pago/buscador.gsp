<%@ page import="org.control.Sexo; org.control.UserPersonal; org.control.MedioPago; java.text.SimpleDateFormat; groovy.time.TimeCategory; org.control.UserSocio" %>
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
    <g:set var="entityName" value="Buscar Pagos" />
    <g:set var="pars" value="[
        'userSocioInstanceId' : userSocioInstanceId,
        'medioPagoInstanceId' : medioPagoInstanceId,
        'numeroBoleta'        : numeroBoleta,
        'concepto'            : concepto,
        'usarFechas'          : usarFechas,
        'sort'                : sort,
        'order'               : order,
        'offset'              : params.int('offset'),
        'max'                 : max,
        'periodo'             : periodo,
        'desde'               : desde,
        'hasta'               : hasta,
        /*'pagoMapList'         : pagoMapList,*/
        'pagoMapSuma'         : pagoMapSuma
    ]"/>
    <title>${entityName}</title>
    <script type="text/javascript">
        Highcharts.setOptions({
            lang: {
                loading: 'Cargando...',
                months: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octobre', 'Noviembre', 'Diciembre'],
                shortMonths:  ['ene', 'feb', 'mar', 'abr', 'may', 'jun', 'jul', 'ago', 'sep', 'oct', 'nov', 'dic'],
                weekdays: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                exportButtonTitle: "Exportar",
                printButtonTitle: "Imprimir",
                rangeSelectorFrom: "Zoom del",
                rangeSelectorTo: "al",
                rangeSelectorZoom: "Zoom:",
                downloadPNG: 'Descargar imagen PNG',
                downloadJPEG: 'Descargar imagen JPEG',
                downloadPDF: 'Descargar imagen PDF',
                downloadSVG: 'Descargar imagen SVG',
                resetZoom: "Resetear zoom",
                resetZoomTitle: "Resetear zoom",
                printChart: "Imprimir gráfico",
                thousandsSep: ".",
                decimalPoint: ','
            }
        });

        Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
            return {
                radialGradient: { cx: 0.5, cy: 0.3, r: 0.7 },
                stops: [
                    [0, color],
                    [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                ]
            };
        });
    </script>
</head>

<body>

    <g:form action="buscador" class="form-horizontal">
        <div class="row-fluid">
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
                        <label for="userSocioInstance" class="control-label"><g:message code="numeroBoleta.label" default="Número de Boleta" /></label>
                        <div class="controls">
                            <g:field type="number" name="numeroBoleta" value="${numeroBoleta}"/>
                            <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'medioPagoInstance', 'error')}</span>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                        <label for="plan" class="control-label"><g:message code="userSocio.filtrarEstado.label" default="Plan" /></label>
                        <div class="controls">
                            <g:select id="plan" onchange="" name="planId" from="${planList}" optionKey="id" value="${params?.planId}" class="many-to-one" noSelection="['': '']"/>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')}">
                        <label for="userSocioInstance" class="control-label"><g:message code="concepto.label" default="Concepto" /></label>
                        <div class="controls">
                            <g:select id="concepto" name="concepto" from="['Membresías', 'Matrículas']" value="${concepto}" class="many-to-one" noSelection="['': '']"/>
                            <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'medioPagoInstance', 'error')}</span>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')}">
                        <label for="userSocioInstance" class="control-label"><g:message code="concepto.label" default="Antigüedad" /></label>
                        <div class="controls">
                            <g:select id="antiguedad" name="antiguedad" from="['Socios Nuevos', 'Socios Renovados']" value="${params?.antiguedad}" class="many-to-one" noSelection="['': '']"/>
                            <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'medioPagoInstance', 'error')}</span>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
                        <label for="userSocioInstance" class="control-label"><g:message code="medioPago.label" default="Medio de Pago" /></label>
                        <div class="controls">
                            <g:select id="medioPagoInstance" name="medioPagoInstanceId" from="${MedioPago.list([cache: true])}" optionKey="id" value="${medioPagoInstanceId}" class="many-to-one" noSelection="['': '']"/>
                            <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'medioPagoInstance', 'error')}</span>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: matriculaInstance, field: 'autorizadoPor', 'error')}">
                        <label for="autorizadoPorId" class="control-label"><g:message code="matricula.autorizadoPor.label" default="Operador" /></label>
                        <div class="controls">
                            <g:select id="autorizadoPorId" name="autorizadoPorId" from="${UserPersonal.list()}" optionKey="id" value="${params?.autorizadoPorId}" class="many-to-one" noSelection="['': '']"/>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'sexo', 'error')}">
                        <label for="sexo" class="control-label"><g:message code="userSocio.sexo.label" default="Sexo" /></label>
                        <div class="controls">
                            <g:select id="sexo" name="sexo.id" from="${Sexo.list()}" optionKey="id" value="${params?.sexo?.id}" class="many-to-one" noSelection="['': '']"/>
                            <span class="help-inline">${hasErrors(bean: userSocioInstance, field: 'sexo', 'error')}</span>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')}">
                        <label for="userSocioInstance" class="control-label"><g:message code="concepto.label" default="Pago Confirmado" /></label>
                        <div class="controls">
                            <g:select id="pagoConfirmado" name="pagoConfirmado" from="['Si', 'No']" value="${params?.pagoConfirmado}" class="many-to-one" noSelection="['': '']"/>
                            <span class="help-inline">${hasErrors(bean: medioPagoInstance, field: 'medioPagoInstance', 'error')}</span>
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

            <div class="span6">
                <g:render template="/graficos/pago/grafico" model="[
                        pagoMapList: pagoMapList,
                        pagoMapSuma: pagoMapSuma,

                        contMem    : contMem,
                        contMat    : contMat,
                        contNuevos : contNuevos,
                        contRen    : contRen,
                ]"/>
            </div>
        </div>

        <section id="show-userSocio" class="first">

            <table class="table table-bordered" style="width: 100%;">
                <tr>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Plan',          prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'plan']"/></td>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Concepto',      prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'concepto']"/></td>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Antigüedad',    prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'esNuevo', booleano: true]"/></td>
                </tr>
                <tr>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Medio de Pago', prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'medioDePago']"/></td>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Operador',      prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'autorizadoPorNombre']"/></td>
                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico4" model="[seriesName: 'Sexo',          prefijoDiv: 'grafInf', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'sexo']"/></td>
                </tr>
            </table>

            <table class="table table-bordered table-hover" id="domainTable">
                <thead>
                    <tr>
                        <g:sortableColumn property="id" title="${message(code: 'pago.id.label', default: 'Id')}" />
                        <g:sortableColumn property="fechaDeCobro" title="${message(code: 'pago.fechaDeCobro.label', default: 'Fecha')}" params="${pars}" />
                        <th>${message(code: 'pago.fechaDeCobro.label', default: 'Hora')}</th>
                        %{--<g:sortableColumn property="fechaDeCreacion" title="${message(code: 'pago.fechaDeCreacion.label', default: 'Fecha de Creacion')}" />--}%
                        %{--<g:sortableColumn property="horaDeCreacion" title="${message(code: 'pago.horaDeCreacion.label', default: 'Hora de Creacion')}" />--}%
                        <g:sortableColumn property="concepto" title="${message(code: 'pago.dateCreated.label', default: 'Concepto')}" params="${pars}" />
                        <g:sortableColumn property="usuarioNombre" title="${'Usuario'}" params="${pars}" />
                        <th><g:message code="historialMembresias.plan.label" default="Plan" /></th>
                        <g:sortableColumn property="medioDePago" title="${message(code: 'pago.medioDePago.label', default: 'Medio de Pago')}" params="${pars}" />
                        <tooltip:tip value="O factura">
                            <g:sortableColumn property="numeroDeBoleta" title="${message(code: 'pago.numeroDeBoleta2.label', default: 'Boleta')}" params="${pars}" />
                        </tooltip:tip>
                        %{--<g:sortableColumn property="pagoConfirmado" title="${message(code: 'pago.numeroDeBoleta2.label', default: 'Confirmado')}" params="${pars}" />--}%
                        <g:sortableColumn property="autorizadoPorNombre" title="${message(code: 'pago.numeroDeBoleta2.label', default: 'Autorización')}" params="${pars}" />
                        <g:sortableColumn property="monto" title="${message(code: 'pago.montoCancelado.label', default: 'Monto')}" colspan="2" params="${pars}" />
                    </tr>
                </thead>
                <tbody>
                    <g:hiddenField name="pagoMapSuma" id="pagoMapSuma" value="${pagoMapSuma}"/>
                    <g:hiddenField name="pagoMapList" id="pagoMapList" value="${pagoMapList}"/>
                    <g:each in="${pagoMapList}" status="i" var="pagoMap">
                        %{--<tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id='${pagoMap.pagoId}' onmouseover="alert(this.id);" >--}%
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" id='${pagoMap.pagoId}'>
                            <td>
                                <g:if test="${!pagoMap.pagoConfirmado}">
                                    <tooltip:tip value="¡Pago NO confirmado!">
                                        ${pagoMap.pagoId}!
                                    </tooltip:tip>
                                </g:if>
                                <g:else>
                                    ${pagoMap.pagoId}
                                </g:else>
                            </td>
                            <g:if test="${pagoMap.fechaDeCobro != null}">
                                <td>${(new Date(pagoMap.fechaDeCobro).format("EEE dd-MM-yy")).capitalize()}</td>
                                <td>${(new Date(pagoMap.fechaDeCobro).format("HH:mm"))}</td>
                            </g:if>
                            <g:else>
                                <td></td>
                                <td></td>
                            </g:else>
                            %{--<td><g:if test="${pagoMap.getAt("fechaDeCreacion") != null}">${new Date(pagoMap.getAt("fechaDeCreacion")).format("dd-MM-yyyy HH:mm")}</g:if></td>--}%
                            <td>${pagoMap.concepto}</td>
                            <g:if test="${pagoMap.usuario != null}">
                                <g:set var="usuario" value="${pagoMap.usuario as UserSocio}"/>
                                <td><g:link controller="userSocio" action="show" id="${usuario.id}">${usuario}</g:link>
                                    <g:if test="${usuario.historialMembresias.size() <= 1}">
                                        <tooltip:tip value="¡Socio Nuevo!">
                                            <i class="icon-star-empty glyphicon-inverse"></i>
                                        </tooltip:tip>
                                    </g:if>
                                </td>
                            </g:if>
                            <g:else>
                                <td></td>
                            </g:else>
                            <td>${pagoMap.plan?.nombre} </td>
                            <td>${pagoMap.medioDePago}</td>
                            <td>${pagoMap.numeroDeBoleta}</td>
                            %{--<td>${pagoMap.pagoConfirmado?"Si":"No"}</td>--}%
                            <td>
                                <tooltip:tip value="${pagoMap.autorizadoPor}">
                                    ${String.valueOf(pagoMap.autorizadoPor.nombre).toLowerCase().capitalize()}
                                </tooltip:tip>
                            </td>
                            <td>$</td>
                            <td style="text-align: right; border-left: none !important;">
                                    <g:link action="show" id="${pagoMap.pagoId}">
                                        ${String.format("%,d", pagoMap.monto?:0)}
                                    </g:link>
                            </td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            ${pagoMapList.size()} resultados.

            %{--<export:formats formats="['excel', 'pdf']" params="${pars}"/>--}%

            <br/>
            <br/>

            <div class="form-actions">
                <tooltip:tip value="Crear reporte en PDF">
                    <g:submitButton formaction="generaReportesPagos" name="generaReportesPagos" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Crear Reporte')}"/>
                </tooltip:tip>
            </div>

        </section>
    </g:form>
</body>


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

    /*        function disableButton(boton){
     var boton = document.getElementById('usarFechas');
     boton.disabled = true;
     }

     $('input:submit').click(function(){
     $('p').text("Form submiting.....").addClass('submit');
     $('input:submit').attr("disabled", true);
     });*/

    $(document).ready(function() {
        toogleCamposFechas();
    });

    function countCbActivos(e){
        return $("input:checkbox:checked").length -2;
    }

</script>
</html>
