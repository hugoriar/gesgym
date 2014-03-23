<%@ page import="org.joda.time.DateTime; groovy.time.TimeCategory" %>

%{--<%@ page import="org.joda.time.DateTime; groovy.time.TimeCategory; org.gym.UserSocio" %>--}%
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">
    <tooltip:resources/>
    %{--<resource:include components="lightBox" />--}%
    <resource:lightBox labelImage="Bild" labelOf="von" />
    <resource:tabView/>

    %{--<ig:resources />--}%
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

    <script type="text/javascript">
        /*$(document).ready(function() {
            $("#sizoom").hide();
        });

        function muestraImagen(){$("#sizoom").fadeIn();}

        function escondeImagen(){$("#sizoom").fadeOut();}*/
    </script>
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
                    <richui:tabView id="tabView">
                        <richui:tabLabels>
                            <richui:tabLabel selected="true" title="Datos Personales" />
                            <richui:tabLabel title="Asistencias" />
                            <richui:tabLabel title="Contacto de Emergencia" />
                            <richui:tabLabel title="Ficha Médica" />
                        </richui:tabLabels>

                        <richui:tabContents>
                            <richui:tabContent>
                                <table class="table" style="-webkit-border-radius: 20px;-moz-border-radius: 20px;border-radius: 20px;border: 2px solid #ddd;" id="tablA">
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
                                        %{--<td valign="top" class="value"><a href="${"mailto:"+fieldValue(bean: userSocioInstance, field: "email")}">${fieldValue(bean: userSocioInstance, field: "email")}</a></td>--}%
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
                                        <td valign="top" class="name"><g:message code="userSocio.instructor.label" default="Instructor" /></td>
                                        <td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${userSocioInstance?.instructor?.id}">${userSocioInstance?.instructor}</g:link></td>
                                    </tr>

                                    <tr class="prop">
                                        <td valign="top" class="name"><g:message code="userSocio.empresa.label" default="Empresa" /></td>
                                        <td valign="top" class="value"><g:link controller="empresa" action="show" id="${userSocioInstance?.empresa?.id}">${userSocioInstance?.empresa}</g:link></td>
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
                            </richui:tabContent>

                            <richui:tabContent>
                                <g:if test="${userSocioInstance.visitas?.size() > 0}">
                                    <table class="table" id="tablC">
                                        %{--<thead>
                                            <tr>
                                                <td><h3>Día</h3></td>
                                                <td><h3>Día de Semana</h3></td>
                                                <td><h3>Hora</h3></td>
                                            </tr>
                                        </thead>--}%
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
                                        <tooltip:tip value="${lastHistorialMembresiasInstance?.fechaFin?.format("dd/MMMM/yyyy")}">
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
                                    <richui:lightBox href="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}">
                                        <img class="avatar" id="img1" style="" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}"/>
                                    </richui:lightBox>
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
                                            <li><g:link controller="visita" action="show" id="${v.id}">${v.fechaDeVisita.format("dd-MM-yy")} ${v.horaDeEntrada.format("HH:mm")}</g:link></li>
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
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountExpired}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.accountLocked.label" default="Account Locked" /></td>
                                <td valign="top" class="value">${userSocioInstance?.accountLocked?"Si":"No"}</td>
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountLocked}" /></td>--}%
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name"><g:message code="userSocio.passwordExpired.label" default="Password Expired" /></td>
                                <td valign="top" class="value">${userSocioInstance?.passwordExpired?"Si":"No"}</td>
                                %{--<td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.passwordExpired}" /></td>--}%
                            </tr>
                        </tbody>
                    </table>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
    %{--<g:link action="renovarPlan" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |--}%
    <br/>
    <g:link controller="matricula" action="create" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |
    <g:link action="cambiarEstado" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_cambiarEstadoAm.png')}"/></g:link> |
    <custom:jasperButtons delimiter=" " target="_blank" imgSrc="contrato_anversoAm.png" controller="userSocio" action="generateReport" format="pdf" jasper="datos_contrato" text="Contrato (Anverso)" class="btn3d"/>
    <g:link action="downloadFile" id="contrato_reverso"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'contrato_reversoAm.png')}"/></g:link>
</custom:jasperForm>
</section>

</body>

</html>
