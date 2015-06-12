<%@ page import="org.control.Pago; org.joda.time.DateTime; org.control.Visita; org.control.LogCambiosDeEstado" %>
<%@ page import="org.control.calendario.Event" %>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
	<title><g:message code="default.welcome.title" args="[meta(name:'app.name')]"/> </title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="kickstart" />
    <tooltip:resources/>
    <r:require modules="datetimepicker-pasado"/>
    <r:require modules="highcharts"/>
    %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'kickstart.css')}" type="text/css">--}%
    <style>
        html, body {
            height: 100% !important;
            width: 100% !important;
            line-height: 1 !important;
        }

        #content {
            width: 1170px !important;
            height: 800px !important;
        }
    </style>
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

    <g:set var="format" value="dd-MM-yyyy HH:mm" />
    <g:set var="hoy"          value="${new Date().format(format)}" />
    <g:set var="hoyInicio"    value="${new DateTime().withTimeAtStartOfDay().toDate().format(format)}" />
    <g:set var="hoyFin"       value="${new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate().format(format)}" />
    <g:set var="ayerInicio"   value="${new DateTime().minusDays(1).withTimeAtStartOfDay().toDate().format(format)}" />
    <g:set var="ayerFin"      value="${new DateTime().withTimeAtStartOfDay().minusSeconds(1).toDate().format(format)}" />
    <g:set var="semanaInicio" value="${new DateTime().withDayOfWeek(1).withTimeAtStartOfDay().toDate().format(format)}" />
    <g:set var="semanaFin"    value="${new DateTime().withDayOfWeek(1).withTimeAtStartOfDay().plusWeeks(1).minusMinutes(1).toDate().format(format)}" />
    <g:set var="mesInicio"    value="${new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().toDate().format(format)}" />
    <g:set var="mesFin"       value="${new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().plusMonths(1).minusMinutes(1).toDate().format(format)}" />
    <g:set var="proxSemana"   value="${(new Date() + 7).format(format)}" />
    <g:set var="semanaPasada" value="${(new Date() - 7).format(format)}" />
</head>

<%
    /*Calendar fecha = GregorianCalendar.instance

    Calendar fechaAnual = GregorianCalendar.instance
    fechaAnual.set(2014-1900, 11, 1) // 0=Enero  11=Diciembre
    fecha.set(fechaAnual.get(Calendar.YEAR), fechaAnual.get(Calendar.MONTH), fechaAnual.get(Calendar.DATE)) // 0=Enero  11=Diciembre
    ArrayList<Integer> listVisitasAnualesHombres = new ArrayList<Integer>()
    ArrayList<Integer> listVisitasAnualesMujeres = new ArrayList<Integer>()
    for ( mes in 0..(fecha.get(Calendar.MONTH)) ) {
        def listVisitasMensuales = Visita.findAllByFechaDeVisitaBetween((new Date(fecha.get(Calendar.YEAR), mes, 1)), (new Date(fecha.get(Calendar.YEAR), mes, fecha.getActualMaximum(GregorianCalendar.DAY_OF_MONTH))))
        listVisitasAnualesHombres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 1}.size())
        listVisitasAnualesMujeres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 2}.size())
    }

    Calendar fechaMensual = GregorianCalendar.instance
    fechaMensual.set(2014-1900, 8, 1) // 0=Enero  11=Diciembre
    fecha.set(fechaMensual.get(Calendar.YEAR), fechaMensual.get(Calendar.MONTH), fechaMensual.get(Calendar.DATE)) // 0=Enero  11=Diciembre
    ArrayList<Integer> listVisitasMensualesHombres = new ArrayList<Integer>()
    ArrayList<Integer> listVisitasMensualesMujeres = new ArrayList<Integer>()
    for ( dia in 1..fecha.getActualMaximum(GregorianCalendar.DAY_OF_MONTH)) {
        def listVisitasMensuales = Visita.findAllByFechaDeVisita(new Date(fecha.get(Calendar.YEAR), fecha.get(Calendar.MONTH), dia))
        listVisitasMensualesHombres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 1}.size())
        listVisitasMensualesMujeres.add(listVisitasMensuales.findAll {it.usuario.sexoId == 2}.size())
//        System.out.println(new Date(fecha.get(Calendar.YEAR), fecha.get(Calendar.MONTH), dia).toString()+": "+listVisitasMensuales.findAll {it.usuario.sexoId == 1}.size()+" | "+listVisitasMensuales.findAll {it.usuario.sexoId == 2}.size())
    }

    Calendar fechaDiaria = GregorianCalendar.instance
    fechaDiaria.set(2014-1900, 8, 16) // 0=Enero  11=Diciembre
    fecha.set(fechaDiaria.get(Calendar.YEAR), fechaDiaria.get(Calendar.MONTH), fechaDiaria.get(Calendar.DATE)) // 0=Enero  11=Diciembre
    ArrayList<Visita> listVisitasDiarias = Visita.findAllByFechaDeVisita(new Date(fechaDiaria.get(Calendar.YEAR), fechaDiaria.get(Calendar.MONTH), fechaDiaria.get(Calendar.DATE)))
    ArrayList<Visita> listVisitasDiariasHombres = listVisitasDiarias.findAll {it.usuario.sexoId == 1}
    ArrayList<Visita> listVisitasDiariasMujeres = listVisitasDiarias.findAll {it.usuario.sexoId == 2}*/
%>

<body>



    <section id="intro" class="first">

        %{--<div class="containerBanner">
            <div id="content-sliderBanner">
                <div id="slider">
                    <div id="mask">
                        <ul>
                            <li id="first" class="firstanimation">
                                <a href="#">
                                    <img src="${resource(dir: 'images/banner', file: '6.jpg')}" alt="ForPyme"/>
                                </a>
                                <div class="tooltip">
                                    --}%%{--<h1><g:fieldValue bean="${home1Instance}" field="nombre"/></h1>--}%%{--
                                </div>
                            </li>

                            <li id="second" class="secondanimation">
                                <a href="#">
                                    <img src="${resource(dir: 'images/banner', file: '7.jpg')}" alt="ForPyme"/>
                                </a>
                                <div class="tooltip">
                                    --}%%{--<h1><g:fieldValue bean="${home2Instance}" field="nombre"/></h1>--}%%{--
                                </div>
                            </li>

                            <li id="third" class="thirdanimation">
                                <a href="#">
                                    <img src="${resource(dir: 'images/banner', file: '3.jpg')}" alt="ForPyme"/>
                                </a>
                                <div class="tooltip">
                                    --}%%{--<h1><g:fieldValue bean="${home3Instance}" field="nombre"/></h1>--}%%{--
                                </div>
                            </li>

                            <li id="fourth" class="fourthanimation">
                                <a href="#">
                                    --}%%{--<img src="${resource(dir: 'images/banner', file: '4.jpg')}" alt="ForPyme"/>--}%%{--
                                </a>
                                <div class="tooltip">
                                    <h1></h1>
                                </div>
                            </li>

                            <li id="fifth" class="fifthanimation">
                                <a href="#">
                                    <img src="${resource(dir: 'images/banner', file: '5.jpg')}" alt="ForPyme"/>
                                </a>
                                <div class="tooltip">
                                    <h1></h1>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="progress-bar"></div>
                </div>
            </div>
        </div>--}%

        <h1>Bienvenido al sistema de gestión de usuarios</h1> %{--(Último proceso de auto cambios de estados: ${fecha})--}%
        <p>
            Use los controles superiores para entrar a las distintas opciones
            Algunas opciones están en fase de desarrollo. Siéntase libre para
            navegar por las distintas opciones.
        </p>
        %{--<a href="#run-sample">Generate Notify!</a>--}%

    </section>

    <div class="tabbable">
        <ul class="nav nav-pills" style="text-align:center; padding-top: 20px !important;">
            <li class="active" style="float:none; display:inline-block; *display:inline; zoom:1;"><a href="#opciones" data-toggle="tab"><span class="glyphicon glyphicon-home">Opciones</span></a></li>
            <li                style="float:none; display:inline-block; *display:inline; zoom:1;"><a href="#dashboardDiario" data-toggle="tab">Dashboard Diario</a></li>
            <li                style="float:none; display:inline-block; *display:inline; zoom:1;"><a href="#dashboardMensual" data-toggle="tab">Dashboard Mensual</a></li>
        </ul>

        <div class="tab-content">
            <div class="tab-pane fade in active" id="opciones">
                <section id="info" style="padding-top: 20px !important;">
                    <div class="row-fluid">
                        <div class="span4">
                            <h3 class="center">Socios</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        %{--<div class="center">--}%
                                        <g:link controller="userSocio" action="list" title="Listar Socios"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'usuario.png')}" /></g:link>
                                        %{--</div>--}%
                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><g:link controller="userSocio" action="list"><i class="icon-list"></i> Listar Socios</g:link></p>
                                        <p><g:link controller="userSocio" action="create"><i class="icon-plus-sign"></i> Crear Socio</g:link></p>
                                        <p><g:link controller="userSocio" action="listCambiarEstadoBatch" params="[estadoMembresiaId: 1, soloExpirados: Boolean.FALSE, usarFechas: Boolean.TRUE, planId: 1]"><i class="icon-circle-arrow-up"></i> Gestionar Estados</g:link></p>
                                    %{--<p><g:link controller="userSocio" action="listCambiarEstadoBatch" params="[estadoMembresiaId: 1, soloExpirados: Boolean.FALSE, usarFechas: Boolean.TRUE, desde: hoy, hasta: proxSemana, planId: 1]"><i class="icon-circle-arrow-up"></i> Gestionar Estados</g:link></p>--}%
                                        <p><g:link controller="userSocio" action="listCumpleanosUsuario" params="[usarFechas: Boolean.FALSE, operacion: 'cumpleanos']"><i class="icon-gift"></i> Cumpleaños</g:link></p>
                                        <p><g:link controller="email" action="create" params="[de: 'comunicaciones@marcoscafenaspa.cl']"><i class="icon-envelope-alt"></i> Enviar Email</g:link></p>
                                        %{--<p><i class="icon-list"></i><g:link controller="userSocio" action="listCambiarEstadoBatch" params="[estadoMembresiaId: 1, soloExpirados: Boolean.TRUE, usarFechas: Boolean.FALSE]"> Cambiar Estados</g:link></p>--}%
                                        %{--<p><i class="icon-list"></i><g:link controller="historialMembresias" action="list"> Listar Membresias</g:link></p>--}%
                                        %{--<p><i class="icon-remove-sign"></i><g:link controller="userSocio" action="delete"> Eliminar usuarios</g:link></p>--}%
                                        %{--<p><i class="icon-remove-sign"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'eliminarUsuario']"> Eliminar usuarios</g:link></p>--}%
                                        %{--<p><i class="icon-circle-arrow-up"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'renovarPlan']"> Renovar Plan</g:link></p>--}%
                                        %{--<p><i class="icon-asterisk"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'renovarPlan']"> Congelar Usuario</g:link></p>--}%
                                        %{--<p><i class="icon-edit"></i><g:link controller="userSocio" action="listAccionesUsuario" params="[accion: 'cambiarEstado']"> Cambiar Estado</g:link></p>--}%
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión de usuarios. Use las distintas opciones en el listado para gestionar
                                los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>

                        <div class="span4">
                            <h3 class="center">Asistencias</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        %{--<div class="center">--}%
                                        <g:link controller="visita" action="list" params="[desde: hoyInicio, hasta: hoyFin, order: 'desc']" title="Ver asistencias de hoy"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'asistencias.png')}" /></g:link>
                                        %{--</div>--}%
                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><g:link controller="visita" action="list" params="[periodo: 'Hoy', desde: hoyInicio, hasta: hoyFin, order: 'desc']"><i class="icon-list"></i> Hoy</g:link></p>
                                        <p><g:link controller="visita" action="list" params="[periodo: 'Ayer', desde: ayerInicio, hasta: ayerFin, order: 'desc']"><i class="icon-list"></i> Ayer</g:link></p>
                                        <p><g:link controller="visita" action="list" params="[periodo: 'Esta semana', desde: semanaInicio, hasta: semanaFin, order: 'desc']"><i class="icon-list"></i> Esta Semana</g:link></p>
                                        <p><g:link controller="visita" action="list" params="[periodo: 'Este mes', desde: mesInicio, hasta: mesFin, order: 'desc']"><i class="icon-list"></i> Este Mes</g:link></p>
                                        <p><g:link controller="visita" action="list" params="[periodo: 'Personalizado', desde: hoyInicio, hasta: hoyFin, order: 'desc']"><i class="icon-search"></i> Más Filtros</g:link></p>
                                        %{--<p><i class="icon-list"></i><g:link controller="visita" action="listUsuarios" params="[desde: hoy, hasta: hoy, order: 'desc']"> Filtrar x Usuario</g:link></p>--}%
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión de asistencias. Use las distintas opciones en el listado para gestionar
                            los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>

                        <div class="span4">
                            <h3 class="center">Rankings</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        %{--<div class="center">--}%
                                        <g:link controller="visita" action="list" params="[desde: hoy, hasta: hoy, order: 'desc']" title="Ver asistencias de hoy"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'estadisticas.png')}" /></g:link>
                                    %{--</div>--}%
                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeSemana: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de esta semana']"><i class="icon-list"></i> Esta Semana</g:link></p>
                                        <p><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeMes: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de este mes']"><i class="icon-list"></i> Este Mes</g:link></p>
                                        <p><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, inicioDeAnio: Boolean.TRUE, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'de este año']"><i class="icon-list"></i> Este Año</g:link></p>
                                        <p><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.TRUE, desde: semanaPasada, hasta: hoy, sort: 'cantVisitas', order: 'desc']"><i class="icon-search"></i> Más Filtros</g:link></p>
                                        %{--<p><g:link controller="userSocio" action="rankings" params="[usarFechas: Boolean.FALSE, desde: semanaPasada, hasta: hoy, sort: 'cantVisitas', order: 'desc', sufijoTitulo: 'Histórico']"><i class="icon-list"></i> Histórico</g:link></p>--}%
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión del personal. Use las distintas opciones en el listado para gestionar
                            los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>
                    </div>
                </section>


            <section id="info2">
                <div class="row-fluid">

                    %{--<div class="span4">
                        <h3 class="center">Gestión de Tags</h3>
                        <p/>
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    --}%%{--<div class="center">--}%%{--
                                    <g:link controller="tag" action="list" title="Listar tags"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'tag.png')}" /></g:link>
                                --}%%{--</div>--}%%{--
                                </td>
                                <td style="vertical-align: top; font-size: 16px;">
                                    <p><i class="icon-list"></i><g:link controller="tag" action="list"> Listar tags</g:link></p>
                                    <p><i class="icon-plus-sign"></i><g:link controller="tag" action="create"> Nuevo tag</g:link></p
                                    <p><i class="icon-plus-sign"></i><g:link controller="modeloTag" action="list"> Modelos de tag</g:link></p>
                                    <p><i class="icon-list"></i><g:link controller="estadoTag" action="list"> Estados</g:link></p>
                                    <p><i class="icon-list"></i><g:link controller="marcaTag" action="list"> Marcas</g:link></p>
                                    <p><i class="icon-list"></i><g:link controller="reporteEscaneoTag" action="list"> Reporte</g:link></p>
                                    --}%%{--<p><i class="icon-plus-sign"></i><g:link controller="userPersonal" action="create"> Crear personal</g:link></p>--}%%{--
                                    --}%%{--<p><g:link controller="userPersonalInstructor" action="delete">Eliminar instructores</g:link></p>--}%%{--
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Módulo de gestión de tags. Use las distintas opciones en el listado para gestionar
                        los datos, entre ellos enlistar, enrolar, editar y eliminar.
                        </p>
                    </div>--}%

                    <div class="span4">
                        <h3 class="center">Instructores y Personal</h3>
                        <p/>
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    %{--<div class="center">--}%
                                    <g:link controller="userPersonalInstructor" action="list" title="Listar instructores"><img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'instructorYpersonal.png')}" /></g:link>
                                %{--</div>--}%
                                </td>
                                <td style="vertical-align: top; font-size: 16px;">
                                    <p><g:link controller="userPersonalInstructor" action="list"><i class="icon-list"></i> Listar instructores</g:link></p>
                                    <p><g:link controller="userPersonalInstructor" action="create"><i class="icon-plus-sign"></i> Crear instructores</g:link></p>
                                    <p><g:link controller="userPersonal" action="list"><i class="icon-list"></i> Listar personal</g:link></p>
                                    <p><g:link controller="userPersonal" action="create"><i class="icon-plus-sign"></i> Crear personal</g:link></p>
                                    %{--<p><g:link controller="userPersonalInstructor" action="delete">Eliminar instructores</g:link></p>--}%
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Módulo de gestión de instructores y personal. Use las distintas opciones en el listado para gestionar
                        los datos, entre ellos enlistar, enrolar, editar y eliminar.
                        </p>
                    </div>

                    <div class="span4">
                        <h3 class="center">Gestión de Cursos</h3>
                        <p/>
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="center">

                                        <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'empresa.png')}" />
                                    </div>

                                </td>
                                <td style="vertical-align: top; font-size: 16px;">
                                    <p><g:link url="./04_recurring" params=""><i class="icon-calendar"></i> Calendario</g:link></p>
                                    <p><g:link controller="cursoEspecial" action="list"><i class="icon-info-sign"></i> Cursos Especiales</g:link></p>
                                    <p><g:link controller="horario" action="list"><i class="icon-info-sign"></i> Cursos</g:link></p>
                                    <p><g:link controller="horario" action="create"><i class="icon-info-sign"></i> Nuevo Curso</g:link></p>
                                    %{--<p><g:link controller="categoria" action="list"><i class="icon-list"></i> Categorías</g:link></p>--}%
                                    %{--<p><i class="icon-list"></i><g:link controller="subCategoria" action="list"> SubCategorías</g:link></p>--}%
                                    %{--<p><g:link controller="descuento" action="list"><i class="icon-list"></i> Descuentos</g:link></p>--}%
                                    %{--<p><g:link controller="boleta" action="list"><i class="icon-list"></i> Boletas</g:link></p>--}%
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Módulo de gestión de Ingresos. Use las distintas opciones en el listado para gestionar
                        los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                        </p>
                    </div>

                    <div class="span4">
                        <h3 class="center">Herramientas</h3>
                        <p/>
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    <div class="center">

                                        <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'herramientas.png')}" />
                                    </div>

                                </td>
                                <td style="vertical-align: top; font-size: 16px;">
                                    <p><g:link controller="cargoInterno" action="list"><i class="icon-wrench"></i> Cargos</g:link></p>
                                    <p><g:link controller="plan" action="list"><i class="icon-wrench"></i> Planes</g:link></p>
                                    <p><g:link controller="ciudad" action="list"><i class="icon-wrench"></i> Ciudades</g:link></p>
                                    <p><g:link controller="sector" action="list"><i class="icon-wrench"></i> Sectores</g:link></p>
                                    <p><g:link controller="logCambiosDeEstado" action="list"><i class="icon-wrench"></i> Cambios Estado</g:link></p>
                                    <p><g:link controller="configuracion" action="ip"><i class="icon-wrench"></i> Configurar IP</g:link></p>
                                    <p><g:link controller="configuracion" action="empresa"><i class="icon-wrench"></i> Configurar Empresa</g:link></p>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <p>Módulo de gestión de herramientas. Use las distintas opciones en el listado para gestionar
                        los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                        </p>
                    </div>

                </div>
            </section>

            <section id="info3">
                    <div class="row-fluid">
                        <div class="span4">
                            <h3 class="center">Gestión de Ingresos</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="center">

                                            <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'paper_money.png')}" />
                                        </div>

                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><g:link controller="pago" action="list"><i class="icon-eye-open"></i> Pagos</g:link></p>
                                        <p><g:link controller="pago" action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc', periodo: 'Hoy', desde: hoyInicio, hasta: hoyFin]"><i class="icon-list"></i> Hoy</g:link></p>
                                        <p><g:link controller="pago" action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc', periodo: 'Ayer', desde: ayerInicio, hasta: ayerFin]"><i class="icon-list"></i> Ayer</g:link></p>
                                        <p><g:link controller="pago" action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc', periodo: 'Esta semana', desde: semanaInicio, hasta: semanaFin]"><i class="icon-list"></i> Esta Semana</g:link></p>
                                        <p><g:link controller="pago" action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc', periodo: 'Este mes', desde: mesInicio, hasta: mesFin]"><i class="icon-list"></i> Este Mes</g:link></p>
                                        <p><g:link controller="pago" action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc']"><i class="icon-search"></i> Más Filtros</g:link></p>
                                        <p><g:link controller="pago" action="comparar" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeCobro', order: 'desc']"><i class="icon-calendar"></i> Comparar Meses</g:link></p>
                                        %{--<p><g:link controller="pago" action="buscador" params="[desde: hoy, hasta: hoy, order: 'desc']"><i class="icon-list"></i> Buscador</g:link></p>--}%
                                        %{--<p><g:link controller="producto" action="list"><i class="icon-list"></i> Productos</g:link></p>--}%
                                        %{--<p><g:link controller="categoria" action="list"><i class="icon-list"></i> Categorías</g:link></p>--}%
                                        %{--<p><i class="icon-list"></i><g:link controller="subCategoria" action="list"> SubCategorías</g:link></p>--}%
                                        %{--<p><g:link controller="descuento" action="list"><i class="icon-list"></i> Descuentos</g:link></p>--}%
                                        %{--<p><g:link controller="boleta" action="list"><i class="icon-list"></i> Boletas</g:link></p>--}%
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión de Ingresos. Use las distintas opciones en el listado para gestionar
                            los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>

                        <div class="span4">
                            <h3 class="center">Auditoría</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="center">
                                            <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'card_file.png')}" />
                                        </div>

                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><g:link controller="logCambiosDeEstado" action="list" params="[usarFechas: Boolean.TRUE, sort: 'fechaDeOperacion', order: 'desc', max: 99]"><i class="icon-eye-open"></i> Cambios de Estado</g:link></p>
                                        %{--<p><g:link controller="logOperacion"       action="list" params="[usarFechas: Boolean.TRUE, sort: 'dateCreated', order: 'desc', max: 99]"><i class="icon-eye-open"></i> Operaciones</g:link></p>--}%
                                        <p><g:link controller="logOperacion"       action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'dateCreated', order: 'desc', periodo: 'Hoy', desde: hoyInicio, hasta: hoyFin]"><i class="icon-list"></i> Hoy</g:link></p>
                                        <p><g:link controller="logOperacion"       action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'dateCreated', order: 'desc', periodo: 'Ayer', desde: ayerInicio, hasta: ayerFin]"><i class="icon-list"></i> Ayer</g:link></p>
                                        <p><g:link controller="logOperacion"       action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'dateCreated', order: 'desc', periodo: 'Esta semana', desde: semanaInicio, hasta: semanaFin]"><i class="icon-list"></i> Esta Semana</g:link></p>
                                        <p><g:link controller="logOperacion"       action="buscador" params="[usarFechas: Boolean.TRUE, sort: 'dateCreated', order: 'desc', periodo: 'Este mes', desde: mesInicio, hasta: mesFin]"><i class="icon-list"></i> Este Mes</g:link></p>
                                        <p><g:link controller="logEntidad"         action="list"><i class="icon-wrench"></i> Entidades</g:link></p>
                                        <p><g:link controller="logTipoOperacion"   action="list"><i class="icon-wrench"></i> Tipos de Operación</g:link></p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión de Ingresos. Use las distintas opciones en el listado para gestionar
                            los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>
                        %{--<div class="span4">
                            <h3 class="center">Herramientas</h3>
                            <p/>
                            <table>
                                <tbody>
                                <tr>
                                    <td>
                                        <div class="center">

                                            <img class="frontpageImage" src="${resource(dir: 'images/icons',file: 'herramientas.png')}" />
                                        </div>

                                    </td>
                                    <td style="vertical-align: top; font-size: 16px;">
                                        <p><i class="icon-info-sign"></i><g:link controller="cargoInterno" action="list"> Cargos</g:link></p>
                                        <p><i class="icon-info-sign"></i><g:link controller="plan" action="list"> Planes</g:link></p>
                                        --}%%{--<p><i class="icon-info-sign"></i><g:link controller="medioPago" action="list"> Medios de Pago</g:link></p>--}%%{--
                                        <p><i class="icon-info-sign"></i><g:link controller="ciudad" action="list"> Ciudades</g:link></p>
                                        <p><i class="icon-info-sign"></i><g:link controller="sector" action="list"> Sectores</g:link></p>
                                        <p><i class="icon-list"></i><g:link controller="empresa" action="list"> Gestionar Convenios</g:link></p>
                                        <p><i class="icon-info-sign"></i><g:link controller="logCambiosDeEstado" action="list"> Log Cambios de Estado</g:link></p>
                                        <p><i class="icon-info-sign"></i><g:link controller="configuracion" action="ip"> Configurar IP</g:link></p>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <p>Módulo de gestión de usuarios. Use las distintas opciones en el listado para gestionar
                            los datos de los usuarios, entre ellos enlistar, enrolar, editar y eliminar.
                            </p>
                        </div>--}%
                        %{--<div class="span4">
                            <div class="center">
                                <img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'Datepicker.png')}" />
                                <h3>Datepicker</h3>
                            </div>
                            <p>Kickstart uses the <a href ="https://github.com/eternicode/bootstrap-datepicker">Datepicker for Bootstrap</a> by Stefan Petre and Andrew Rowls</p>
                        </div>
                        <div class="span4">
                            <div class="center">
                                <img class="" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'flags_preview_large.png')}" />
                                <h3>Language Selector</h3>
                            </div>
                            <p>Kickstart contains a language selector that uses the <a href="http://www.famfamfam.com/lab/icons/flags/">FamFamFam flag icons</a> by Mark James.
                            It automatically detects which languages are available and offers them in a dropdown menu.</p>
                        </div>
                        <div class="span4">
                            <div class="center">
                                <img class="frontpageImage" src="${resource(plugin: 'kickstart-with-bootstrap', dir: 'images/frontpage',file: 'browser_logos.png')}" />
                                <h3>Browser support</h3>
                            </div>
                            <p>Bootstrap is tested and supported in major modern browsers like Chrome 14, Safari 5+, Opera 11, Internet Explorer 7, and Firefox 5.</p>
                        </div>--}%
                    </div>
                </section>

            <br/>
            <br/>
            <br/>

            <section id="create-event" class="first">

                <g:hasErrors bean="${eventInstance}">
                    <div class="alert alert-error">
                        <g:renderErrors bean="${eventInstance}" as="list" />
                    </div>
                </g:hasErrors>
            %{--${sample_name}--}%
                <div style="text-align: center;"><h2>Calendario de Actividades</h2></div>
                <div class="content" id="content">
                    <div id="planner">${planner}</div>
                </div>

            </section>

            %{--	<section id="info3">
                    <div class="row">
                        <div class="span4">
                            <div class="center">
                                <h3>Other Features</h3>
                            </div>
                            <p>Kickstart contains several pages as starting points for the average website such as an About Page, Contact Page, 404, etc.</p>
                        </div>
                        <div class="span4">
                            <div class="center">
                                <h3>Usage</h3>
                            </div>
                            <p>After installation you can call the script "grails
                                kickstartWithBootstrap" which will copy some files into your
                                project. It will overwrite only few files (e.g., in conf, src, and
                                views) - <b>you should use it only on fresh new Grails projects</b>.
                            </p>
                        </div>
                        <div class="span4">
                            <div class="center">
                                <h3>Notes</h3>
                            </div>
                            <p></p>
                            <ul>
                                <li>Currently, Kickstart works with Grails 2.x!</li>
                                <li>Kickstart does NOT use the Bootstrap plugin.</li>
                                <li>I18N is only available for English and German!</li>
                            </ul>
                        </div>--}%
            <%--	    	<div class="span4">--%>
            <%--		    	<div class="center">--%>
            <%--					<h3>Terms of Use</h3>--%>
            <%--				</div>--%>
            <%--				<p></p>--%>
            <%--				<ul>--%>
            <%--					<li>Bootstrap (from Twitter): Code licensed under the Apache--%>
            <%--						License v2.0. Documentation licensed under CC BY 3.0.--%>
            <%--						(<a href="http://twitter.com/TwBootstrap">@TwBootstrap</a> , <a href="http://twitter.github.com/bootstrap/">http://twitter.github.com/bootstrap/</a>)</li>--%>
            <%--					<li>Kickstart Plugins: Code licensed under the Apache License--%>
            <%--						v2.0. Documentation licensed under CC BY 3.0. Copyright 2011 Jörg--%>
            <%--						Rech (<a href="http://twitter.com/JoergRech">@JoergRech</a>, <a href="http://joerg-rech.com">http://joerg-rech.com</a>)</li>--%>
            <%--				</ul>--%>
            <%--			</div>--%>
                    %{--</div>

                </section>--}%
            %{--
            <g:render template="/graficos/simple" model="[listVisitasAnualesHombres: listVisitasAnualesHombres, listVisitasAnualesMujeres: listVisitasAnualesMujeres, stacking: 'normal', stack: 'no']"/>
            <g:render template="/graficos/pie"       model="[nombreDiv: 'graficoPie', listVisitasHombres: listVisitasDiariasHombres,   listVisitasMujeres: listVisitasDiariasMujeres, listVisitasDiarias: listVisitasDiarias]"/>
            <g:render template="/graficos/3d"        model="[nombreDiv: 'grafico2',   listVisitasHombres: listVisitasAnualesHombres,   listVisitasMujeres: listVisitasAnualesMujeres,   stacking: 'normal', stack: 'no']"/>
            <g:render template="/graficos/3dMensual" model="[nombreDiv: 'grafico1',   listVisitasHombres: listVisitasMensualesHombres, listVisitasMujeres: listVisitasMensualesMujeres, stacking: 'normal', stack: 'si', fecha: fechaMensual]"/>
            --}%
            </div>
            <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="dashboardDiario">
                <section id="dash1" style="padding-top: 20px !important;">
                    <div class="row-fluid">
                        <div class="span4">
                            <h3 class="center">Visitas</h3>
                            <g:render template="/graficos/dashboard/visita" model="[seriesName: 'Asistencias', prefijoDiv: 'grafDashDiaSupAsistencia', cont: pagoMapSuma, concepto: 'usuario.sexo.sexo', cantidad: true, list: Visita.findAllByFechaDeVisitaBetween(new DateTime().withTimeAtStartOfDay().toDate(), new DateTime().plusDays(1).withTimeAtStartOfDay().minusMinutes(1).toDate(), [sort: 'horaDeEntrada', order: 'desc'])]"/>
                        </div>
                        <div class="span4">
                            <h3 class="center">Operaciones</h3>
                            <g:render template="/graficos/dashboard/pagos" model="[seriesName: 'Operador', prefijoDiv: 'grafDashDiaSupOperador', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'autorizadoPorNombre', cantidad: false]"/>

                        </div>
                        <div class="span4">
                            <h3 class="center">Finanzas</h3>
                            <g:render template="/graficos/dashboard/pagos" model="[seriesName: 'Medio de Pago', prefijoDiv: 'grafDashDiaSupMedioPago', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'medioDePago', cantidad: false]"/>
                        </div>
                    </div>
                </section>

            </div>
            <div class="tab-pane fade in" style="border: 1px solid #ddd;" id="dashboardMensual">
                <section id="dash2" style="padding-top: 20px !important;">
                    <div class="row-fluid">
                        %{--<g:render template="/graficos/3dMensual" model="[nombreDiv: 'grafico1',   listVisitasHombres: listVisitasMensualesHombres, listVisitasMujeres: listVisitasMensualesMujeres, stacking: 'normal', stack: 'si', fecha: fechaMensual]"/>--}%
                        <div class="span4">
                            <h3 class="center">Visitas</h3>
                            <g:render template="/graficos/dashboard/visita" model="[seriesName: 'Asistencias', prefijoDiv: 'grafDashMesSupAsistencia', cont: pagoMapSuma, concepto: 'usuario.sexo.sexo', cantidad: true, list: Visita.findAllByFechaDeVisitaBetween(new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().toDate(), new DateTime().withDayOfMonth(1).withTimeAtStartOfDay().plusMonths(1).minusSeconds(1).toDate(), [sort: 'horaDeEntrada', order: 'desc']), noDetalleAsistencias: Boolean.TRUE]"/>
                        </div>
                        <div class="span4">
                            <h3 class="center">Operaciones</h3>
                            <g:render template="/graficos/dashboard/pagos" model="[seriesName: 'Operador', prefijoDiv: 'grafDashMesSupOperador', pagoMapList: pagoMapListMes, cont: pagoMapSumaMes, concepto: 'autorizadoPorNombre', cantidad: false]"/>

                        </div>
                        <div class="span4">
                            <h3 class="center">Finanzas</h3>
                            <g:render template="/graficos/dashboard/pagos" model="[seriesName: 'Medio de Pago', prefijoDiv: 'grafDashMesSupMedioPago', pagoMapList: pagoMapListMes, cont: pagoMapSumaMes, concepto: 'medioDePago', cantidad: false]"/>
                        </div>
                    </div>
                </section>

            </div>
            %{--<div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_plan"></div>--}%
        %{--<div class="tab-pane fade in" style="border: 1px solid #ddd;" id="grafico_plan">               <g:render template="/graficos/pago/graficoTabla" model="[seriesName: 'Plan',          prefijoDiv: 'grafSup', pagoMapList: pagoMapList, cont: pagoMapSuma, concepto: 'plan']"/></div>--}%
        </div>
    </div>
</body>

</html>
