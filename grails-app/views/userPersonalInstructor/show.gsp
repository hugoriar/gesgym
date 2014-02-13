
<%@ page import="org.gym.UserPersonalInstructor" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'userPersonalInstructor.label', default: 'UserPersonalInstructor')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-userPersonalInstructor" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.username.label" default="Username" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "username")}</td>
				
			</tr>
		
			%{--<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.password.label" default="Password" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "password")}</td>
				
			</tr>--}%
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.apellidoPaterno.label" default="Apellido Paterno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "apellidoPaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.apellidoMaterno.label" default="Apellido Materno" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "apellidoMaterno")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.rut.label" default="Rut" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "rut")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.dv.label" default="Dv" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "dv")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.foto.label" default="Foto" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.fechaNacimiento.label" default="Fecha Nacimiento" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstructorInstance?.fechaNacimiento}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.sexo.label" default="Sexo" /></td>
				
				<td valign="top" class="value"><g:link controller="sexo" action="show" id="${userPersonalInstructorInstance?.sexo?.id}">${userPersonalInstructorInstance?.sexo}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.fono.label" default="Fono" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "fono")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.fonoCelular.label" default="Fono Celular" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "fonoCelular")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.fonoTrabajo.label" default="Fono Trabajo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "fonoTrabajo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.email.label" default="Email" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: userPersonalInstructorInstance, field: "email")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.domicilio.label" default="Domicilio" /></td>
				
				<td valign="top" class="value"><g:link controller="direccionUsuario" action="show" id="${userPersonalInstructorInstance?.domicilio?.id}">${userPersonalInstructorInstance?.domicilio}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.condicionMedica.label" default="Condicion Medica" /></td>
				
				<td valign="top" class="value"><g:link controller="condicionMedica" action="show" id="${userPersonalInstructorInstance?.condicionMedica?.id}">${userPersonalInstructorInstance?.condicionMedica}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.contactoEmergencia.label" default="Contacto Emergencia" /></td>
				
				<td valign="top" class="value"><g:link controller="contactoEmergencia" action="show" id="${userPersonalInstructorInstance?.contactoEmergencia?.id}">${userPersonalInstructorInstance?.contactoEmergencia}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstructorInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${userPersonalInstructorInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.enabled.label" default="Enabled" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstructorInstance?.enabled}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.accountExpired.label" default="Account Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstructorInstance?.accountExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.accountLocked.label" default="Account Locked" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstructorInstance?.accountLocked}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.passwordExpired.label" default="Password Expired" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstructorInstance?.passwordExpired}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.alumnos.label" default="Alumnos" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userPersonalInstructorInstance.alumnos}" var="a">
						<li><g:link controller="userSocio" action="show" id="${a.id}">${a}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.cargo.label" default="Cargo" /></td>
				
				<td valign="top" class="value"><g:link controller="cargoInterno" action="show" id="${userPersonalInstructorInstance?.cargo?.id}">${userPersonalInstructorInstance?.cargo}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userPersonalInstructor.esPersonalTrainer.label" default="Es Personal Trainer" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${userPersonalInstructorInstance?.esPersonalTrainer}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
