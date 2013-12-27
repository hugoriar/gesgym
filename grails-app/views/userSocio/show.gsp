
<%@ page import="org.gym.UserSocio" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userSocio.label', default: 'UserSocio')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userSocio" class="first">
<g:jasperForm controller="userSocio" action="generateReport" name="Contrato_${userSocioInstance?.rut+"-"+userSocioInstance?.dv}" id="${userSocioInstance?.id}" jasper="datos_contrato" >
	<table class="table">
		<tbody>

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
				<td valign="top" class="value"><g:link controller="sexo" action="show" id="${userSocioInstance?.sexo?.id}">${userSocioInstance?.sexo?.encodeAsHTML()}</g:link></td>
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
				<td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userSocioInstance?.domicilio?.id}">${userSocioInstance?.domicilio?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.condicionMedica.label" default="Condicion Medica" /></td>
				<td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userSocioInstance?.condicionMedica?.id}">${userSocioInstance?.condicionMedica?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.contactoEmergencia.label" default="Contacto Emergencia" /></td>
				<td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userSocioInstance?.contactoEmergencia?.id}">${userSocioInstance?.contactoEmergencia?.encodeAsHTML()}</g:link></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.ocupacion.label" default="Ocupacion" /></td>
				<td valign="top" class="value"><g:link controller="ocupacion" action="show" id="${userSocioInstance?.ocupacion?.id}">${userSocioInstance?.ocupacion?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /></td>
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userSocioInstance?.historialMembresias}" var="h">
						<li><g:link controller="historialMembresias" action="show" id="${h.id}">${h?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.estadoMembresia.label" default="Estado Membresia" /></td>
				<td valign="top" class="value"><g:link controller="estadoMembresia" action="show" id="${userSocioInstance?.estadoMembresia?.id}">${userSocioInstance?.estadoMembresia?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.matricula.label" default="Matricula" /></td>
				<td valign="top" class="value"><g:link controller="matricula" action="show" id="${userSocioInstance?.matricula?.id}">${userSocioInstance?.matricula?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.instructor.label" default="Instructor" /></td>
				<td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${userSocioInstance?.instructor?.id}">${userSocioInstance?.instructor?.encodeAsHTML()}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.empresa.label" default="Empresa" /></td>
				<td valign="top" class="value"><g:link controller="empresa" action="show" id="${userSocioInstance?.empresa?.id}">${userSocioInstance?.empresa?.encodeAsHTML()}</g:link></td>
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
    <g:link action="renovarPlan" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_renovarPlanAm.png')}"/></g:link> |
    <g:link action="cambiarEstado" id="${userSocioInstance.id}"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'btn_cambiarEstadoAm.png')}"/></g:link> |
    <custom:jasperButtons delimiter=" " target="_blank" imgSrc="contrato_anversoAm.png" controller="userSocio" action="generateReport" format="pdf" jasper="datos_contrato" text="Contrato (Anverso)" class="btn3d"/>
    <g:link action="downloadFile" id="contrato_reverso"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'contrato_reversoAm.png')}"/></g:link>
</g:jasperForm>
</section>

</body>

</html>
