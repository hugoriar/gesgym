<%@ page import="org.joda.time.DateTime; groovy.time.TimeCategory" %>

%{--<%@ page import="org.joda.time.DateTime; groovy.time.TimeCategory; org.gym.UserSocio" %>--}%
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">
    <tooltip:resources/>
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
        $(document).ready(function() {
            $("#sizoom").hide();
//            $("#img1").css("right", "'"+$("#tabl").width()+"'px'");
        });

        function muestraImagen(){$("#sizoom").fadeIn();}

        function escondeImagen(){$("#sizoom").fadeOut();}
    </script>
</head>

<body>

<section id="show-userSocio" class="first">
<custom:jasperForm controller="userSocio" action="generateReport" name="Contrato_${userSocioInstance?.rut+"-"+userSocioInstance?.dv}" id="${userSocioInstance?.id}" historialMembresiasInstanceId="${lastHistorialMembresiasInstance?.id?:""}" jasper="datos_contrato" >
	<table class="table" id="tabl">
		<tbody>
            <div style="text-transform: uppercase; font-size: 22px; text-align: right; font-weight: 800; color: ${userSocioInstance?.estadoMembresia?.color}">
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
                <br/>
                <div id="nozoom">
                    <g:if test="${userSocioInstance.foto}">
                        <img class="avatar" id="img1" style="position:absolute; left: 75%;" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}" onmouseover="muestraImagen()" onmouseout="escondeImagen()"/>
                    </g:if>
                    <g:else>
                        <g:if test="${userSocioInstance.sexo?.id == 1}">
                            <img style="position:absolute; left:72%;" src="${resource(dir: 'images/',file: 'profile_man.jpg')}" />
                        </g:if>
                        <g:elseif test="${userSocioInstance.sexo?.id == 2}">
                            <img style="position:absolute; left:72%;"  src="${resource(dir: 'images/',file: 'profile_woman.jpg')}" />
                        </g:elseif>
                    </g:else>

                </div>
                <div id="sizoom">
                    <g:if test="${userSocioInstance.foto}">
                        <img class="avatar_big" style="position:absolute;left:50%;" src="${createLink(controller:'userSocio', action:'avatar_image', id:userSocioInstance.id)}" onmouseout="escondeImagen()"/>
                    </g:if>
                </div>
            </div>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.nombre.label" default="Nombre" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "nombre")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.apellidoPaterno.label" default="Apellido Paterno" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.apellidoMaterno.label" default="Apellido Materno" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.rut.label" default="Rut" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.foto.label" default="Foto" /></td>
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
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "fono")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.fonoCelular.label" default="Fono Celular" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "fonoCelular")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.fonoTrabajo.label" default="Fono Trabajo" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "fonoTrabajo")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.email.label" default="Email" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "email")}</td>
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
				<td valign="top" class="name"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /> y sus Matrículas</td>
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${historialMembresiasInstance?}" var="h">
						<li><g:link controller="historialMembresias" action="show" id="${h.id}">${h}</g:link></li>
					</g:each>
					</ul>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.estadoMembresia.label" default="Estado Membresia" /></td>
				<td valign="top" class="value">
                    %{--<g:link controller="estadoMembresia" action="show" id="${userSocioInstance?.estadoMembresia?.id}">--}%
                        ${userSocioInstance?.estadoMembresia}
                    %{--</g:link>--}%
                </td>
			</tr>
		
%{--			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.matricula.label" default="Matricula" /></td>
				<td valign="top" class="value"><g:link controller="matricula" action="show" id="${userSocioInstance?.matricula?.id}">${userSocioInstance?.matricula}</g:link></td>
			</tr>--}%
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.instructor.label" default="Instructor" /></td>
				<td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${userSocioInstance?.instructor?.id}">${userSocioInstance?.instructor}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.empresa.label" default="Empresa" /></td>
				<td valign="top" class="value"><g:link controller="empresa" action="show" id="${userSocioInstance?.empresa?.id}">${userSocioInstance?.empresa}</g:link></td>
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
            <td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.enabled}" /></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="userSocio.accountExpired.label" default="Account Expired" /></td>
            <td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountExpired}" /></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="userSocio.accountLocked.label" default="Account Locked" /></td>
            <td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.accountLocked}" /></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="userSocio.passwordExpired.label" default="Password Expired" /></td>
            <td valign="top" class="value"><g:formatBoolean boolean="${userSocioInstance?.passwordExpired}" /></td>
        </tr>

        </tbody>
	</table>
    %{--<g:link action="renovarPlan" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |--}%
    <g:link controller="matricula" action="create" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |
    <g:link action="cambiarEstado" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_cambiarEstadoAm.png')}"/></g:link> |
    <custom:jasperButtons delimiter=" " target="_blank" imgSrc="contrato_anversoAm.png" controller="userSocio" action="generateReport" format="pdf" jasper="datos_contrato" text="Contrato (Anverso)" class="btn3d"/>
    <g:link action="downloadFile" id="contrato_reverso"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'contrato_reversoAm.png')}"/></g:link>
</custom:jasperForm>
</section>

</body>

</html>
