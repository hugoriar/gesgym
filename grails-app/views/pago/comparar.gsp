<%@ page import="org.control.Sexo; org.control.ConceptoPago; org.control.Plan; org.control.UserPersonal; java.text.DateFormatSymbols; org.control.MedioPago; java.text.SimpleDateFormat; groovy.time.TimeCategory; org.control.UserSocio" %>
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
    <g:set var="entityName" value="Comparar Meses" />
    <g:set var="hoy" value="${new Date()}" />
    <g:set var="mesPrimero" value="${params.mesPrimero ? meses[params.mesPrimero-1] : meses[hoy[Calendar.MONTH]]}" />
    <g:set var="mesSegundo" value="${params.mesSegundo ? meses[params.mesSegundo-1] : meses[hoy[Calendar.MONTH]]}" />
    <g:set var="anioPrimero" value="${params.anioPrimero?:hoy[Calendar.YEAR]}" />
    <g:set var="anioSegundo" value="${params.anioSegundo?:hoy[Calendar.YEAR]-1}" />
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
        'periodo'             : periodo
    ]"/>
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

    <title>${entityName}</title>

</head>

<body>

    <g:form action="comparar" class="form-horizontal">
        <div class="row-fluid">
            <div class="span5">
                <fieldset class="form">
                    <br/>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'estadoMembresia', 'error')}">
                        <label for="plan" class="control-label"><g:message code="userSocio.filtrarEstado.label" default="Plan" /></label>
                        <div class="controls">
                            <g:select id="plan" onchange="" name="planId" from="${Plan.list([cache: true])}" optionKey="id" value="${params?.planId}" class="many-to-one" noSelection="['': '']"/>
                        </div>
                    </div>

                    <div class="control-group fieldcontain ${hasErrors(bean: userSocioInstance, field: 'userSocioInstance', 'error')} required">
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
                            <g:select id="autorizadoPorId" name="autorizadoPorId" from="${UserPersonal.list([cache: true])}" optionKey="id" value="${params?.autorizadoPorId}" class="many-to-one" noSelection="['': '']"/>
                            %{--<g:hiddenField name="autorizadoPor.id" value="${usuarioActual?.id}"/>--}%
                            %{--<span class="help-inline">${hasErrors(bean: matriculaInstance, field: 'autorizadoPor', 'error')}</span>--}%
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
                            <label for="usarFechas" class="control-label"><g:message code="user.fechaTerminoEntre.label" default="Periodo " /></label>
                        </tooltip:tip>
                        <div id="divPeriodo" class="control-group fieldcontain ${hasErrors(bean: userInstance, field: 'estadoMembresia', 'error')}">
                            <div class="controls" id="controls">
                                <div><g:select style="width: 134px;" name="mesPrimero" from="${meses}" value="${mesPrimero}" /> - <g:select style="width: 74px;" name="anioPrimero" value="${anioPrimero}" from="${hoy[Calendar.YEAR]..2004}" noSelection="['':'-Año-']"/></div>
                                <div><g:select style="width: 134px;" name="mesSegundo" from="${meses}" value="${mesSegundo}" /> - <g:select style="width: 74px;" name="anioSegundo" value="${anioSegundo}" from="${hoy[Calendar.YEAR]..2004}" noSelection="['':'-Año-']"/></div>
                                <br/>
                                <div style="float: none;"><g:submitButton name="listCambiarEstadoBatch" class="btn btn-primary" style="width: 76%;" value="${message(code: 'default.button.buscar.label', default: 'Buscar')}" /></div>
                            </div>
                        </div>
                    </div>

                </fieldset>
            </div>

            <div class="span7">
                %{--<div class="tabbable tabs-below">--}%
                <div class="tabbable">
                    <ul class="nav nav-pills">
                        <li class="active"><a href="#pestanaMontos" data-toggle="tab"><span class="icon-money"></span> Montos</a></li>
                        <li><a href="#pestanaCantidades" data-toggle="tab"><span class="icon-list-ol"></span> Cantidades</a></li>
                    </ul>
                    <div class="tab-content">
                    %{--<div class="tab-content" style="border: 1px solid #ddd; border-top: none; border-radius:3px;">--}%
                        <div class="tab-pane fade in active" id="pestanaMontos">
                            <table class="table table-bordered table-hover table-condensed" id="tableResumen2">
                                <thead>
                                    <tr class="odd" style="font-weight: bold;">
                                        <td></td>
                                        %{--<td style="text-align: center;" colspan="2"><a href="#pestanaListPagos1" id="homeL" data-toggle="pill">${mesPrimero} ${anioPrimero}</a></td>--}%
                                        <td style="text-align: center;" colspan="2">${mesPrimero} ${anioPrimero}</td>
                                        <td style="text-align: center;" colspan="2">${mesSegundo} ${anioSegundo}</td>
                                        <td style="text-align: center;">Análisis</td>
                                    </tr>
                                </thead>
                                <tbody style="font-weight: bold;">

                                    <% List<List> listaDeMapLists = [pagoMapList1, pagoMapList2] %>
                                    <% int pagoMapSuma = pagoMapSuma1 - pagoMapSuma2 %>

                                    <g:render template="templates/totalIngreso" model="[titulo: 'Total ingreso', clase: 'even', pagoMapSuma: pagoMapSuma, pagoMapSuma1: pagoMapSuma1, pagoMapSuma2: pagoMapSuma2]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Plan',          concepto: 'plan',                itemsList: Plan.list(),         listaDeMapLists: listaDeMapLists]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Concepto',      concepto: 'concepto',            itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Antigüedad',    concepto: 'esNuevo',             itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists, booleano: true, tituloVerdadero: 'Socio Nuevo', tituloFalso: 'Renovación']"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Medio de Pago', concepto: 'medioDePago',         itemsList: MedioPago.list(),    listaDeMapLists: listaDeMapLists]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Operadores',    concepto: 'autorizadoPorNombre', itemsList: UserPersonal.list(), listaDeMapLists: listaDeMapLists]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Sexo',          concepto: 'sexo',                itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists]"/>
                                    <g:render template="templates/totalIngreso" model="[titulo: 'Total ingreso', clase: 'odd', pagoMapSuma: pagoMapSuma, pagoMapSuma1: pagoMapSuma1, pagoMapSuma2: pagoMapSuma2]"/>

                                </tbody>
                            </table>
                        </div>
                        <div class="tab-pane fade in" id="pestanaCantidades">
                            <table class="table table-bordered table-hover table-condensed" id="tableResumen">
                                <thead>
                                    <tr class="odd" style="font-weight: bold;">
                                        <td></td>
                                        <td style="text-align: center;" colspan="2">${mesPrimero} ${anioPrimero}</td>
                                        <td style="text-align: center;" colspan="2">${mesSegundo} ${anioSegundo}</td>
                                        <td style="text-align: center;">Análisis</td>
                                    </tr>
                                </thead>
                                <tbody style="font-weight: bold;">
                                    <g:render template="templates/totalIngreso" model="[titulo: 'Total ingreso', clase: 'even', pagoMapSuma: pagoMapList1.size()+pagoMapList2.size(), pagoMapSuma1: pagoMapList1.size(), pagoMapSuma2: pagoMapList2.size(), cantidad: true]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Plan',          concepto: 'plan',                itemsList: Plan.list(),         listaDeMapLists: listaDeMapLists, cantidad: true]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Concepto',      concepto: 'concepto',            itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists, cantidad: true]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Antigüedad',    concepto: 'esNuevo',             itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists, cantidad: true, booleano: true, tituloVerdadero: 'Socio Nuevo', tituloFalso: 'Renovación']"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Medio de Pago', concepto: 'medioDePago',         itemsList: MedioPago.list(),    listaDeMapLists: listaDeMapLists, cantidad: true]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Operadores',    concepto: 'autorizadoPorNombre', itemsList: UserPersonal.list(), listaDeMapLists: listaDeMapLists, cantidad: true]"/>
                                    <g:render template="templates/itemGasto"    model="[titulo: 'Sexo',          concepto: 'sexo',                itemsList: new ArrayList(),     listaDeMapLists: listaDeMapLists, cantidad: true]"/>
                                    <g:render template="templates/totalIngreso" model="[titulo: 'Total ingreso', clase: 'odd', pagoMapSuma: pagoMapList1.size()+pagoMapList2.size(), pagoMapSuma1: pagoMapList1.size(), pagoMapSuma2: pagoMapList2.size(), cantidad: true]"/>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row-fluid">
            <section id="show-userSocio" class="first">

                <div class="tabbable">

                    <ul class="nav nav-pills">
                        <li class="active"><a href="#pestanaGraficos" data-toggle="pill"><span class="icon-bar-chart "></span>  Gráficos</a></li>
                        %{--<li><a href="#pestanaListPagos" data-toggle="pill"><span class="icon-list-alt "></span> Listado de Pagos</a></li>--}%
                        <li><a href="#pestanaListPagos1" data-toggle="pill"><span class="icon-money "></span> ${mesPrimero} ${anioPrimero}</a></li>
                        <li><a href="#pestanaListPagos2" data-toggle="pill"><span class="icon-money "></span> ${mesSegundo} ${anioSegundo}</a></li>
                    </ul>

                    %{--<div class="tab-content" style="border: 1px solid #ddd; border-bottom: none; border-radius:3px;">--}%
                    <div class="tab-content" style="overflow: visible;">
                        <div class="tab-pane fade in active" id="pestanaGraficos">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Ingresos',   cont: pagoMapSuma, cont1: pagoMapSuma1, cont2: pagoMapSuma2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo, monto: Boolean.TRUE]"/></td>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Membresías', cont: contMem1-contMem2, cont1: contMem1, cont2: contMem2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo]"/></td>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Matrículas', cont: contMat1-contMat2, cont1: contMat1, cont2: contMat2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo]"/></td>
                                </tr>
                                <tr>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Nuevos',     cont: contNue1-contNue2, cont1: contNue1, cont2: contNue2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo]"/></td>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Renovados',  cont: contRen1-contRen2, cont1: contRen1, cont2: contRen2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo]"/></td>
                                    <td style="width: 33%;"><g:render template="/graficos/pago/grafico3" model="[seriesName: 'Renovados',  cont: contRen1-contRen2, cont1: contRen1, cont2: contRen2, mesPrimero: mesPrimero, anioPrimero: anioPrimero, mesSegundo: mesSegundo, anioSegundo: anioSegundo]"/></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab-pane fade in" id="pestanaListPagos">
                            <table class="table table-bordered table-hover" id="domainTable">
                                <thead>
                                    <tr>
                                        <g:sortableColumn property="id" title="${message(code: 'pago.id.label', default: 'Id')}" />
                                        <g:sortableColumn property="fechaDeCobro" title="${message(code: 'pago.fechaDeCobro.label', default: 'Fecha')}" params="${pars}" />
                                        <th>${message(code: 'pago.fechaDeCobro.label', default: 'Hora')}</th>
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
                                    <g:each in="${pagoMapList1+pagoMapList2}" status="i" var="pagoMap">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
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
                            ${" "+(pagoMapList1+pagoMapList2).size()} resultados.
                            <br/>
                            <br/>
                        </div>
                        <div class="tab-pane fade in" id="pestanaListPagos1">
                            <table class="table table-bordered table-hover" id="domainTable1">
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
                                    <g:each in="${pagoMapList1}" status="i" var="pagoMap">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
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
                            ${(pagoMapList1).size()} resultados.
                            %{--<export:formats formats="['excel', 'pdf']" params="${pars}"/>--}%
                        </div>
                        <div class="tab-pane fade in" id="pestanaListPagos2">
                            <table class="table table-bordered table-hover" id="domainTable2">
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
                                    %{--<g:hiddenField name="pagoMapSuma" id="pagoMapSuma" value="${pagoMapSuma}"/>--}%
                                    %{--<g:hiddenField name="pagoMapList1" id="pagoMapList1" value="${pagoMapList1}"/>--}%
                                    <g:each in="${pagoMapList2}" status="i" var="pagoMap">
                                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
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
                            ${(pagoMapList2).size()} resultados.
                            %{--<export:formats formats="['excel', 'pdf']" params="${pars}"/>--}%
                        </div>
                    </div>

                </div>



            </section>
        </div>

    <div class="form-actions">
        %{--<g:submitButton name="cambiaEstadoBatch" class="btn btn-primary" value="${message(code: 'default.button.cambiaEstadoBatch.label', default: 'Cambiar Estados')}" />--}%
        <tooltip:tip value="Crear reporte en PDF">
            <g:submitButton formaction="generaReportesPagos" name="generaReportesPagos" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Crear Reporte')}"/>
        </tooltip:tip>
        %{--<tooltip:tip value="Enviar emails a los usuarios seleccionados">
            <g:submitButton formaction="aMailsBatch" name="aMailsBatch" class="btn btn-primary" value="${message(code: 'default.button.buscar.label', default: 'Enviar Emails')}" />
        </tooltip:tip>--}%
        %{--<button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>--}%
    </div>

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
