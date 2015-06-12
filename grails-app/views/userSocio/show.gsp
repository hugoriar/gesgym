<%@ page import="org.joda.time.LocalDate; org.joda.time.Years; org.control.HistorialMembresias; org.control.Matricula; org.control.Pago; java.text.NumberFormat; org.joda.time.DateTime; groovy.time.TimeCategory" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">

    <tooltip:resources/>
    <resource:tabView/>
    %{--<r:require modules="jquery"/>--}%
    %{--<r:require modules="jquery-ui"/>--}%
    %{--<r:require modules="fancybox"/>--}%
    <r:require modules="timeago"/>
    %{--<r:require modules="lightbox"/>--}%

   %{--<script src="${resource(dir: 'js', file: 'lightbox.js')}"></script>--}%
   %{--<link rel="stylesheet" href="${resource(dir: 'css', file: 'lightbox.css')}" type="text/css">--}%
%{----}%
    <g:javascript>
        $(document).ready(function(){
            $("time.timeago").timeago();
//            $(".fancybox").fancybox();
        });
    </g:javascript>

    <g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
    <g:if test="${lastHistorialMembresiasInstance != null}">
        <g:set var="fechaFinUltimaMembresia" value="${new DateTime(lastHistorialMembresiasInstance?.fechaFin).toLocalDate()}" />
        <g:set var="diasDiferenciaFechaFinUltimaMembresia" value="${(TimeCategory.minus(lastHistorialMembresiasInstance?.fechaFin, new Date()).days)}" />
        <g:if     test="${diasDiferenciaFechaFinUltimaMembresia < 0}"><g:set var="diasDiferenciaFechaFinUltimaMembresia" value="${diasDiferenciaFechaFinUltimaMembresia}" /></g:if>
        <g:elseif test="${diasDiferenciaFechaFinUltimaMembresia > 0}"><g:set var="diasDiferenciaFechaFinUltimaMembresia" value="${diasDiferenciaFechaFinUltimaMembresia+1}" /></g:elseif>
        <g:set var="today"     value="${new DateTime().toLocalDate()}" /><g:if test="${fechaFinUltimaMembresia.equals(today)}">    <g:set var="isToday" value="${Boolean.TRUE}" /></g:if>    <g:else><g:set var="isToday" value="${Boolean.FALSE}" /></g:else>
        <g:set var="yesterday" value="${today.minusDays(1)}" />          <g:if test="${fechaFinUltimaMembresia.equals(yesterday)}"><g:set var="isYesterday" value="${Boolean.TRUE}" /></g:if><g:else><g:set var="isYesterday" value="${Boolean.FALSE}" /></g:else>
        <g:set var="tomorrow"  value="${today.plusDays(1)}" />           <g:if test="${fechaFinUltimaMembresia.equals(tomorrow)}"> <g:set var="isTomorrow" value="${Boolean.TRUE}" /></g:if> <g:else><g:set var="isTomorrow" value="${Boolean.FALSE}" /></g:else>

    </g:if>

	<title><g:message code="default.show.label" args="[entityName]" /></title>

</head>

<body>

<section id="show-userSocio" class="first">
<custom:jasperForm controller="userSocio" action="generateReport" name="Contrato_${userSocioInstance?.rut+"-"+userSocioInstance?.dv}" id="${userSocioInstance?.id}" historialMembresiasInstanceId="${lastHistorialMembresiasInstance?.id?:""}" jasper="datos_contrato" >
    <table id="tabl" style="table-layout: fixed !important; overflow: hidden;">
        <tbody>
            <tr>
                <td valign="top" class="value">
                %{--<td valign="top" class="value" style="width: 70% !important; vertical-align: top !important;" >--}%
                    <h1 style="text-shadow: 2px 2px 2px #CCC; margin-top: -5px !important;">${userSocioInstance.nombre?.toUpperCase()} ${userSocioInstance.apellidoPaterno?.toUpperCase()} ${userSocioInstance.apellidoMaterno?.toUpperCase()}</h1>
                    %{--<h1>${fieldValue(bean: userSocioInstance, field: "nombre")} ${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")} ${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</h1>--}%

                %{--<div class="panel-heading">
                    <ul class="nav nav-pills">
                        <li class="active"><a href="#datosPersonales" data-toggle="tab"><span class="glyphicon glyphicon-home">Datos Personales</span></a></li>
                        <li><a href="#asistencias" data-toggle="tab">Asistencias</a></li>
                        <li><a href="#tab3default" data-toggle="tab">Contacto de Emergencia</a></li>
                        <li><a href="#tab4default" data-toggle="tab">Ficha Médica</a></li>
                        <li><a href="#" data-toggle="tab">Cursos</a></li>
                        <li><a href="#" data-toggle="tab">Pagos</a></li>
                    </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="datosPersonales">
                                <table class="table" id="tablA">
                                --}%%{--<table class="table" style="-webkit-border-radius: 20px;-moz-border-radius: 20px;border-radius: 20px;border: 2px solid #ddd;" id="tablA">--}%%{--
                                    <tbody>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.rut.label" default="Rut" /></td>
                                        <td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
                                        <td valign="top" class="value"><g:formatDate date="${userSocioInstance?.fechaNacimiento}" /></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.sexo.label" default="Sexo" /></td>
                                        <td valign="top" class="value"><g:link controller="sexo" action="show" id="${userSocioInstance?.sexo?.id}">${userSocioInstance?.sexo}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.fono.label" default="Fono" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fono?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.fonoCelular.label" default="Fono Celular" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fonoCelular?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.fonoTrabajo.label" default="Fono Trabajo" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fonoTrabajo?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.email.label" default="Email" /></td>
                                        <td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "email")}</td>
                                        --}%%{--<td valign="top" class="value"><a href="${"mailto:"+fieldValue(bean: userSocioInstance, field: "email")}">${fieldValue(bean: userSocioInstance, field: "email")}</a></td>--}%%{--
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.domicilio.label" default="Domicilio" /></td>
                                        <td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userSocioInstance?.domicilio?.id}">${userSocioInstance?.domicilio}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.condicionMedica.label" default="Condicion Medica" /></td>
                                        <td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userSocioInstance?.condicionMedica?.id}">${userSocioInstance?.condicionMedica}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.contactoEmergencia.label" default="Contacto Emergencia" /></td>
                                        <td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userSocioInstance?.contactoEmergencia?.id}">${userSocioInstance?.contactoEmergencia}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.ocupacion.label" default="Ocupacion" /></td>
                                        <td valign="top" class="value"><g:link controller="ocupacion" action="show" id="${userSocioInstance?.ocupacion?.id}">${userSocioInstance?.ocupacion}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.estadoMembresia.label" default="Estado Membresia" /></td>
                                        <td valign="top" class="value"> ${userSocioInstance?.estadoMembresia}
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.tagAsignado.label" default="Tag Asignado" /></td>
                                        <td valign="top" class="value"><g:link controller="tag" action="show" id="${userSocioInstance?.tagAsociado?.id}">${userSocioInstance?.tagAsociado}</g:link></td>
                                    </tr>
                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.instructor.label" default="Instructor" /></td>
                                        <td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${userSocioInstance?.instructor?.id}">${userSocioInstance?.instructor}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.empresa.label" default="Empresa" /></td>
                                        <td valign="top" class="value"><g:link controller="empresa" action="show" id="${userSocioInstance?.empresa?.id}">${userSocioInstance?.empresa}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.cursos.label" default="Cursos Inscritos" /></td>
                                        <td valign="top" style="text-align: left;" class="value">
                                            <ul>
                                                <g:each in="${userSocioInstance?.horarios}" var="h">
                                                    <li><g:link controller="horario" action="show" id="${h.id}">${h.curso?.nombre+" - "+h?.nombre}</g:link></li>
                                                </g:each>
                                            --}%%{--+ Agregar más--}%%{--
                                            </ul>
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /> y sus Matrículas</td>
                                        <td valign="top" style="text-align: left;" class="value">
                                            <ul>
                                                <g:each in="${historialMembresiasInstance?}" var="h">
                                                    <li><g:link controller="historialMembresias" action="show" id="${h.id}">${h}</g:link></li>
                                                </g:each>
                                            </ul>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                        </div>

                        <div class="tab-pane fade" id="asistencias">
                                <g:if test="${userSocioInstance.visitas?.size() > 0}">
                                    <table class="table" id="tablC">
                                        <tbody>
                                        <g:set var="mesActual" value="-1"/>
                                        <g:each status="i" in="${userSocioInstance.visitas?.sort{-it.id}}" var="v">
                                            <g:if test="${mesActual != v.fechaDeVisita.month}">
                                                <tr class="prop">
                                                    <td valign="top" class="value" style="border-top: 0px !important;"><h4>${v.fechaDeVisita.format("MMMM").toUpperCase()}</h4></td>
                                                </tr>
                                            </g:if>
                                            <tr class="prop">
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("EEEE")}</g:link></td>
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("dd-MM-yy")}</g:link></td>
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.horaDeEntrada.format("HH:mm")}</g:link></td>
                                            </tr>
                                            <g:set var="mesActual" value="${v.fechaDeVisita.month}"/>
                                        </g:each>
                                        </tbody>
                                    </table>
                                </g:if>
                                <g:else>
                                    <br/>
                                    <h3>Usuario no tiene registros de asistencias aún.</h3>
                                    <br/>
                                </g:else>
                        </div>
                        <div class="tab-pane fade" id="tab3default">Default 3</div>
                        <div class="tab-pane fade" id="tab4default">Default 4</div>
                        <div class="tab-pane fade" id="tab5default">Default 5</div>
                    </div>
                </div>--}%


                    <richui:tabView id="tabView">
                        <richui:tabLabels>
                            <richui:tabLabel selected="true" title="Datos Personales" />
                            <richui:tabLabel title="Asistencias" />
                            <richui:tabLabel title="Contacto de Emergencia" />
                            <richui:tabLabel title="Ficha Médica" />
                            <richui:tabLabel title="Cursos" />
                            <richui:tabLabel title="Pagos" />
                        </richui:tabLabels>

                        <richui:tabContents>
                            <richui:tabContent>
                                <table class="table" style="-webkit-border-radius: 20px;-moz-border-radius: 20px;border-radius: 20px;border: 2px solid #ddd;" id="tablA">
                                    <tbody>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.rut.label" default="Rut" /></td>
                                        <td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
                                        <td valign="top" class="value"><g:formatDate date="${userSocioInstance?.fechaNacimiento}" format="dd-MM-yyyy"/> (${Years.yearsBetween(new LocalDate (userSocioInstance?.fechaNacimiento), new LocalDate()).getYears() } años)</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.sexo.label" default="Sexo" /></td>
                                        <td valign="top" class="value">${userSocioInstance?.sexo}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.fono.label" default="Fono" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fono?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.fonoCelular.label" default="Fono Celular" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fonoCelular?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.fonoTrabajo.label" default="Fono Trabajo" /></td>
                                        <td valign="top" class="value">${userSocioInstance.fonoTrabajo?.encodeAsHTML()}</td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.email.label" default="Email" /></td>
                                        <td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "email")}</td>

%{--<td valign="top" class="value"><a href="${"mailto:"+fieldValue(bean: userSocioInstance, field: "email")}">${fieldValue(bean: userSocioInstance, field: "email")}</a></td>--}%

                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.domicilio.label" default="Domicilio" /></td>
                                        <td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userSocioInstance?.domicilio?.id}">${userSocioInstance?.domicilio}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.condicionMedica.label" default="Condicion Medica" /></td>
                                        <td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userSocioInstance?.condicionMedica?.id}">${userSocioInstance?.condicionMedica}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.contactoEmergencia.label" default="Contacto Emergencia" /></td>
                                        <td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userSocioInstance?.contactoEmergencia?.id}">${userSocioInstance?.contactoEmergencia}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.ocupacion.label" default="Ocupacion" /></td>
                                        <td valign="top" class="value"><g:link controller="ocupacion" action="show" id="${userSocioInstance?.ocupacion?.id}">${userSocioInstance?.ocupacion}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.estadoMembresia.label" default="Estado Membresia" /></td>
                                        <td valign="top" class="value"> ${userSocioInstance?.estadoMembresia}
                                        </td>
                                    </tr>

                                    %{--<tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.tagAsignado.label" default="Tag Asignado" /></td>
                                        <td valign="top" class="value"><g:link controller="tag" action="show" id="${userSocioInstance?.tagAsociado?.id}">${userSocioInstance?.tagAsociado}</g:link></td>
                                    </tr>--}%

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.instructor.label" default="Instructor" /></td>
                                        <td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${userSocioInstance?.instructor?.id}">${userSocioInstance?.instructor}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.empresa.label" default="Empresa" /></td>
                                        <td valign="top" class="value"><g:link controller="empresa" action="show" id="${userSocioInstance?.empresa?.id}">${userSocioInstance?.empresa}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.cursos.label" default="Cursos Inscritos" /></td>
                                        <td valign="top" style="text-align: left;" class="value">
                                            <ul>
                                                <g:each in="${userSocioInstance?.horarios}" var="h">
                                                    <li><g:link controller="horario" action="show" id="${h.id}">${h.curso?.nombre+" - "+h?.nombre}</g:link></li>
                                                </g:each>
                                            </ul>
                                        </td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name" style="font-weight: bold"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /> y Matrículas</td>
                                        <td valign="top" style="text-align: left;" class="value">
                                                %{--<table>--}%
                                                <table class="table table-bordered table-condensed table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th style="text-align: center;">Fecha</th>
                                                            <th style="text-align: center;">Plan</th>
                                                            <th style="text-align: center;">Desde</th>
                                                            <th style="text-align: center;">Hasta</th>
                                                            <th style="text-align: center;" colspan="2">Monto</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <g:each in="${historialMembresiasInstance?.reverse()}" var="h">
                                                            <tr style="background-color: ${h.fechaFin.after(new Date())?"lightgreen":""};">
                                                            %{--<tr style="color: ${h.fechaFin.after(new Date())?"green":""}; background-color: ${h.fechaFin.after(new Date())?"yellow":""};">--}%
                                                                <td><g:link controller="historialMembresias" action="show" id="${h.id}">${h.matricula?.fechaMatricula?.dateString}</g:link></td>
                                                                %{--<td>--}%
                                                                    %{--<time class="timeago" datetime="${h.matricula?.fechaMatricula}">--}%
                                                                        %{--${h.matricula.fechaMatricula?.format("EE dd-MM-yyyy")}--}%
                                                                    %{--</time>--}%
                                                                %{--</td>--}%
                                                                <td>${h.plan.nombre}</td>
                                                                %{--<td><tooltip:tip value="${h.fechaInicio?.format("dd-MMMM-yyyy")}">${h.fechaInicio.dateString}</tooltip:tip></td>--}%
                                                                <td>${h.fechaInicio.dateString}</td>
                                                                <td>${h.fechaFin.dateString}</td>
                                                                <td>$</td>
                                                                <td valign="top" class="value" style="text-align: right; border-left: none !important;">
                                                                    ${String.format("%,d",h.pago.monto?:0)}
                                                                </td>
                                                            </tr>
                                                        </g:each>
                                                    </tbody>
                                                </table>
                                                %{--<g:each in="${historialMembresiasInstance?}" var="h">
                                                    <li><g:link controller="historialMembresias" action="show" id="${h.id}">${h}</g:link></li>
                                                </g:each>--}%
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </richui:tabContent>

                            <richui:tabContent>
                                <g:if test="${userSocioInstance.visitas?.size() > 0}">
                                    <table class="table" id="tablC">
                                        <tbody>
                                        <g:set var="mesActual" value="-1"/>
                                        <g:each status="i" in="${userSocioInstance.visitas?.sort{-it.id}}" var="v">
                                            <g:if test="${mesActual != v.fechaDeVisita.month}">
                                                <tr class="prop">
                                                    <td valign="top" class="value" style="border-top: 0px !important;"><h4>${v.fechaDeVisita.format("MMMM").toUpperCase()}</h4></td>
                                                </tr>
                                            </g:if>
                                            <tr class="prop">
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("EEEE")}</g:link></td>
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("dd-MM-yy")}</g:link></td>
                                                <td valign="top" class="value"><g:link controller="visita" action="show" id="${v.id}">${v.horaDeEntrada.format("HH:mm")}</g:link></td>
                                            </tr>
                                            <g:set var="mesActual" value="${v.fechaDeVisita.month}"/>
                                        </g:each>
                                        </tbody>
                                    </table>
                                </g:if>
                                <g:else>
                                    <br/>
                                        <h3>Usuario no tiene registros de asistencias aún.</h3>
                                    <br/>
                                </g:else>
                            </richui:tabContent>

                            <richui:tabContent>
                                <g:render template="formContactoEmergencia"/>
                            </richui:tabContent>

                            <richui:tabContent>
                                <g:render template="formCondicionMedica"/>
                            </richui:tabContent>

                            <richui:tabContent>
                                <div id="cursos">
                                    <g:render template="cursos" model="[userSocioInstance: userSocioInstance]"/>
                                </div>
                            </richui:tabContent>

                            <richui:tabContent>
                                <% List<Pago> listPagos = userSocioInstance.historialMembresias.pago.flatten().plus(userSocioInstance.historialMembresias.matricula.pagoMatricula.flatten()).unique() - null
                                    Integer total = 0
                                %>
                                <g:if test="${listPagos?.size() > 0}">
                                    <table class="table" id="tablPagos">
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;"></th>
                                                <th style="text-align: center;">Autorizado por</th>
                                                <th style="text-align: center;">Concepto</th>
                                                <th style="text-align: center;">Id</th>
                                                <th style="text-align: center;">Medio Pago</th>
                                                <th style="text-align: center;">Confirmado</th>
                                                <th style="text-align: center;">N° Boleta</th>
                                                <th style="text-align: center;" colspan="2">Monto</th>
                                            <tr>
                                        </thead>
                                        <tbody>
                                            <g:set var="mesActual" value="-1"/>
                                            <g:each status="i" in="${listPagos?.sort{-it.id}}" var="v">
                                                <g:if test="${(v?.fecha && v?.numeroDeBoleta) || (v?.monto)}">
                                                    <g:if test="${mesActual != (v?.fecha?:v?.dateCreated).month}">
                                                        <tr class="prop">
                                                            <td valign="top" class="value" style="border-top: 0 !important;"><h4>${(v?.fecha?:v?.dateCreated).format("MMMM")?.toUpperCase()}</h4></td>
                                                        </tr>
                                                    </g:if>
                                                    <tr class="prop">
                                                        <td valign="top" class="value"><g:link controller="pago" action="show" id="${v.id}">${(v?.fecha?:v?.dateCreated).format("EEEE dd-MM-yy")?.capitalize()}</g:link></td>
                                                        <td valign="top" class="value" style="text-align: center;">
                                                            <tooltip:tip value="${HistorialMembresias.findByPago(v)?.autorizadoPor?(HistorialMembresias.findByPago(v).autorizadoPor):"-"}">
                                                                    ${HistorialMembresias.findByPago(v)?.autorizadoPor?(HistorialMembresias.findByPago(v).autorizadoPor.nombre.toLowerCase()?.capitalize()):"-"}
                                                            </tooltip:tip>
                                                        </td>
                                                        <g:if test="${Matricula.findByPagoMatricula(v)}">
                                                            <td valign="top" class="value" style="text-align: center;">
                                                                <tooltip:tip value="${"De membresía "+Matricula.findByPagoMatricula(v).membresiaId}">
                                                                    Matrícula
                                                                </tooltip:tip>
                                                            </td>
                                                            <td valign="top" class="value" style="text-align: center;">${Matricula.findByPagoMatricula(v).id}</td>
                                                        </g:if>
                                                        <g:elseif test="${HistorialMembresias.findByPago(v)}">
                                                            <td valign="top" class="value" style="text-align: center;">
                                                                <tooltip:tip value="${HistorialMembresias.findByPago(v).matricula?.pagoMatricula?.monto?("Matrícula "+HistorialMembresias.findByPago(v).matricula?.id):" (Sin matrícula)"}">
                                                                    Plan
                                                                </tooltip:tip>
                                                            </td>
                                                            <td valign="top" class="value" style="text-align: center;">${HistorialMembresias.findByPago(v).id}</td>
                                                        </g:elseif>
                                                        <g:else>
                                                            <td valign="top" class="value" style="text-align: center;">Otro</td>
                                                            <td valign="top" class="value" style="text-align: center;">-</td>
                                                        </g:else>

                                                        %{--<td valign="top" class="value" style="text-align: center;">${Matricula.findByPagoMatricula(v)?"Matrícula":(HistorialMembresias.findByPago(v)?"Plan":"Otro")}</td>--}%
                                                        <td valign="top" class="value" style="text-align: center;">${v?.medioDePago?:"-"}</td>
                                                        <td valign="top" class="value" style="text-align: center;">${v?.pagoConfirmado?"Si":"No"}</td>
                                                        <td valign="top" class="value" style="text-align: center;">${v?.numeroDeBoleta?:"-"}</td>

                                                        <td>$</td>
                                                        <td valign="top" class="value" style="text-align: right; border-left: none !important;">
                                                                ${String.format("%,d",v?.monto?:0)}
                                                        </td>
                                                    </tr>
                                                    <g:set var="mesActual" value="${v.fecha?.month}"/>
                                                    <% total += v?.monto?:0 %>
                                                </g:if>
                                            </g:each>
                                        </tbody>
                                    </table>
                                    <br/>
                                    <span style="float: right; font-size: 20px; font-weight: bold">
                                        Total ingreso: ${String.format("\$%,d", total)}
                                    </span>
                                </g:if>
                                <g:else>
                                    <br/>
                                    <h3>Usuario no registra pagos aún.</h3>
                                    <br/>
                                </g:else>
                                <br/><br/>
                            </richui:tabContent>

                        </richui:tabContents>
                    </richui:tabView>
                </td>
                <td style="width: 2% !important;"></td>
                <td valign="top" class="value" style="width: 28% !important; break-word: word-wrap; overflow: hidden; max-width: 28%; min-width: 28%;">
                    <div style=" display: block; max-width: 300px;">
                    <table class="table" id="tablB">
                        <tbody>
                            <div style="text-transform: uppercase; font-size: 22px; text-align: center; font-weight: 800; color: ${userSocioInstance?.estadoMembresia?.color}; text-shadow: 2px 2px 2px lightgrey;">
                                ${userSocioInstance?.estadoMembresia}<br/>
                                    <g:if test="${lastHistorialMembresiasInstance != null}">
                                        <tooltip:tip value="${lastHistorialMembresiasInstance?.fechaFin?.format("dd-MMMM-yyyy")}">
                                            <g:if test="${userSocioInstance?.estadoMembresia?.id == 1}"> %{--Activo--}%
                                                <g:if     test="${diasDiferenciaFechaFinUltimaMembresia < -1}">Debió vencer hace ${diasDiferenciaFechaFinUltimaMembresia.abs()} días!</g:if>
                                                <g:elseif test="${isYesterday}"                               >Debió vencer ayer!</g:elseif>
                                                <g:if     test="${isToday}"                                   >Vence hoy</g:if>
                                                <g:elseif test="${isTomorrow}"                                >Vence mañana</g:elseif>
                                                <g:elseif test="${diasDiferenciaFechaFinUltimaMembresia > 0}" >Vence en ${diasDiferenciaFechaFinUltimaMembresia} días más</g:elseif>
                                            </g:if>
                                            <g:elseif test="${userSocioInstance?.estadoMembresia?.id == 2}"> %{--Vencido--}%
                                                Hace ${diasDiferenciaFechaFinUltimaMembresia} días
                                            </g:elseif>
                                            <g:elseif test="${userSocioInstance?.estadoMembresia?.id == 3}"> %{--Congelado--}%
                                            %{--hace n días--}%<g:if     test="${diasDiferenciaFechaFinUltimaMembresia < -1}">Debió vencer hace ${diasDiferenciaFechaFinUltimaMembresia.abs()} días</g:if>
                                            %{--ayer--}%       <g:elseif test="${isYesterday}"                               >Debió vencer ayer</g:elseif>
                                            %{--hoy--}%        <g:elseif test="${isToday}"                                   >Debería vencer hoy</g:elseif>
                                            %{--mañana--}%     <g:elseif test="${isTomorrow}"                                >Debería vencer mañana</g:elseif>
                                            %{--en n días--}%  <g:elseif test="${diasDiferenciaFechaFinUltimaMembresia > 1}" >Debería vencer en ${diasDiferenciaFechaFinUltimaMembresia} días</g:elseif>
                                            </g:elseif>
                                        </tooltip:tip>
                                    </g:if>
                                    <g:else>
                                        Usuario sin plan asignado
                                    </g:else>
                            </div>

                            <div id="nozoom" style="text-align: center;">
                                <g:if test="${userSocioInstance.foto}">
                                    %{--<richui:lightBox href="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}">--}%
                                        %{--<span class="rounded-img" style="background: url(${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}) no-repeat center center;">--}%
                                            %{--<img class="avatar" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>--}%
                                            <img class="fancybox" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>

                                            %{--<a class="fancybox" href="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}" title="Lorem ipsum dolor sit amet"><img src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}" alt="" /></a>--}%
                                                    %{--<a href="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}" data-lightbox="image-1" data-title="My caption">Image #1</a>--}%

                                            %{--<a class="example-image-link" href="img/demopage/image-1.jpg" data-lightbox="example-1"><img class="example-image" src="img/demopage/image-1.jpg" alt="image-1"></a>--}%

                                            %{--xx<a data-lightbox="image-1" data-title="My caption">
                                                <img class="avatar" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>
                                            </a>xx--}%
                                            %{--<img class="rounded-img" style="opacity: 0;" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>--}%
                                        %{--</span>--}%

                                    %{--</richui:lightBox>--}%
                                </g:if>
                                <g:else>
                                    <g:if test="${userSocioInstance.sexo?.id == 1}">
                                        <img style="border: 1px solid #dadada;" src="${resource(dir: 'images/',file: 'profile_man.jpg')}" />
                                    </g:if>
                                    <g:elseif test="${userSocioInstance.sexo?.id == 2}">
                                        <img style="border: 1px solid #dadada;"  src="${resource(dir: 'images/',file: 'profile_woman.jpg')}" />
                                    </g:elseif>
                                </g:else>
                            </div>

                            <tr class="prop">
                                <td valign="top" class="name">Últimas 3 visitas</td>
                                <td valign="top" class="value">
                                    <g:each status="i" in="${userSocioInstance.visitas?.sort{-it.id}}" var="v">
                                        <g:if test="${i < 3}">
                                            <li>
                                                <time class="timeago" datetime="${v.fechaDeVisita}">
                                                    ${new Date(v.fechaDeVisita.year, v.fechaDeVisita.month, v.fechaDeVisita.date, v.horaDeEntrada.hours, v.horaDeEntrada.minutes).format("EEEE dd-MM-yyyy HH:mm")}
                                                </time>
                                            </li>
                                            %{--<li><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("dd-MM-yy")} ${v.horaDeEntrada.format("HH:mm")}</g:link></li>--}%
                                        </g:if>
                                    </g:each>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">Enrolado</td>
                                <td valign="top" class="value">
                                        <g:if test="${huellaInstance}">
                                            <tooltip:tip value="Enrolado el ${userSocioInstance.huella()?.dateCreated?.format("dd-MM-yy")}">
                                                <g:link controller="huella" action="show" id="${huellaInstance.id}">Si</g:link>
                                            </tooltip:tip>
                                        </g:if>
                                        <g:else>
                                            <div style="color: red">
                                                No
                                            </div>
                                        </g:else>
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.lastUpdated.label" default="Last Updated" /></td>
                                <td valign="top" class="value"><g:formatDate date="${userSocioInstance?.lastUpdated}" /></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.dateCreated.label" default="Date Created" /></td>
                                <td valign="top" class="value"><g:formatDate date="${userSocioInstance?.dateCreated}" /></td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.enabled.label" default="Enabled" /></td>
                                <td valign="top" class="value">${userSocioInstance?.enabled?"Si":"No"}</td>
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.enabled}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.accountExpired.label" default="Account Expired" /></td>
                                <td valign="top" class="value">${userSocioInstance?.accountExpired?"Si":"No"}</td>
                                %{--<td valign="top" class="value">${userSocioInstance?.accountExpired?"Si":"No <a href=\"${createLink(controller: 'userSocio', action: 'expirarCuenta', id: userSocioInstance.id)}\">(Expirar)</a>"}</td>--}%
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountExpired}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.accountLocked.label" default="Account Locked" /></td>
                                <td valign="top" class="value">${userSocioInstance?.accountLocked?"Si":"No"}</td>
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountLocked}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.passwordExpired.label" default="Password Expired" /></td>
                                <g:if test="${userSocioInstance?.passwordExpired}">
                                    <td valign="top" class="value">Si</td>
                                </g:if>
                                <g:else>
                                    <td valign="top" class="value">
                                        No <g:render template="/_common/modals/expirarPasswordTextLink"/>
                                        %{--${userSocioInstance?.passwordExpired?"Si":"No <a href=\"${createLink(controller: 'userSocio', action: 'expirarPassword', id: userSocioInstance.id)}\">(Expirar)</a>"}--}%
                                    </td>
                                </g:else>
                                %{--<td valign="top" class="value">${userSocioInstance?.passwordExpired?"Si":"No <a href=\"${createLink(controller: 'userSocio', action: 'expirarPassword', id: userSocioInstance.id)}\">(Expirar)</a>"}</td>--}%
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.passwordExpired}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:link action="cambiarPassword" id="${userSocioInstance.id}">Cambiar Contraseña</g:link></td>
                                <td valign="top" class="value"> </td>
                            </tr>

                        </tbody>
                    </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    <br/>
    %{--<g:link controller="matricula" action="create" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |--}%
    %{--<g:link action="cambiarEstado" id="${userSocioInstance.id}">                <img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_cambiarEstadoAm.png')}"/></g:link> |--}%
    %{--<g:link delimiter=" " target="_blank" format="pdf" _format="pdf" controller="userSocio" action="generateReport" name="Contrato_${userSocioInstance?.rut+"-"+userSocioInstance?.dv}" id="${userSocioInstance?.id}" historialMembresiasInstanceId="${lastHistorialMembresiasInstance?.id?:""}" jasper="datos_contrato" class="btnEmpresa">Contrato (Anverso)</g:link>--}%
    %{--<g:link action="downloadFile" id="contrato_reverso">                        <img border="0" src="${g.resource(dir: 'images/buttons', file: 'contrato_reversoAm.png')}"/></g:link>--}%
    <g:if test="${userSocioInstance.historialMembresias.size() > 0}">
        <g:link controller="matricula" action="create" id="${userSocioInstance.id}" class="btnEmpresa">Renovar Plan</g:link>
    </g:if>
    <g:else>
        <g:link controller="matricula" action="create" id="${userSocioInstance.id}" class="btnEmpresa">Crear Plan</g:link>
    </g:else>
    <g:link controller="userSocio" action="cambiarEstado" id="${userSocioInstance.id}" class="btnEmpresa">Cambiar Estado</g:link>
    <custom:jasperButtons controller="userSocio" action="generateReport" delimiter=" " target="_blank" imgSrc="contrato_anversoAm.png" format="pdf" jasper="datos_contrato"/>
    <g:link controller="userSocio" action="downloadFile" id="contrato_reverso" class="btnEmpresa">Contrato Reverso</g:link>
</custom:jasperForm>
</section>

%{--<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>
                            ${userSocioInstance?.nombre}</h4>
                        <small><cite title="San Francisco, USA">${userSocioInstance.domicilio.ciudadUsuario?.nombre} <i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i>${userSocioInstance?.email}
                            <br />
                            <i class="glyphicon glyphicon-globe"></i><a href="http://www.jquery2dotnet.com">${userSocioInstance?.fonoCelular}</a>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>${userSocioInstance?.fechaNacimiento}</p>
                        <!-- Split button -->
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary">
                                Social</button>
                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                                <span class="caret"></span><span class="sr-only">Social</span>
                            </button>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="#">Twitter</a></li>
                                <li><a href="https://plus.google.com/+Jquery2dotnet/posts">Google +</a></li>
                                <li><a href="https://www.facebook.com/jquery2dotnet">Facebook</a></li>
                                <li class="divider"></li>
                                <li><a href="#">Github</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>--}%


</body>

</html>
