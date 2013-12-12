
<%@ page import="org.gym.HistorialMembresias" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'historialMembresias.label', default: 'HistorialMembresias')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-historialMembresias" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.plan.label" default="Plan" /></td>
				
				<td valign="top" class="value"><g:link controller="plan" action="show" id="${historialMembresiasInstance?.plan?.id}">${historialMembresiasInstance?.plan?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.diasCongelacion.label" default="Dias Congelacion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: historialMembresiasInstance, field: "diasCongelacion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.promocionDeMatricula.label" default="Promocion De Matricula" /></td>
				
				<td valign="top" class="value"><g:link controller="promocionMatricula" action="show" id="${historialMembresiasInstance?.promocionDeMatricula?.id}">${historialMembresiasInstance?.promocionDeMatricula?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.fechaInicio.label" default="Fecha Inicio" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.fechaInicio}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.fechaFin.label" default="Fecha Fin" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.fechaFin}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.autorizadoPor.label" default="Autorizado Por" /></td>
				
				<td valign="top" class="value"><g:link controller="userPersonal" action="show" id="${historialMembresiasInstance?.autorizadoPor?.id}">${historialMembresiasInstance?.autorizadoPor?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.inicioBonificacion.label" default="Inicio Bonificacion" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.inicioBonificacion}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.finBonificacion.label" default="Fin Bonificacion" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.finBonificacion}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.personalTrainerAsignado.label" default="Personal Trainer Asignado" /></td>
				
				<td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${historialMembresiasInstance?.personalTrainerAsignado?.id}">${historialMembresiasInstance?.personalTrainerAsignado?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.pago.label" default="Pago" /></td>
				
				<td valign="top" class="value"><g:link controller="pago" action="show" id="${historialMembresiasInstance?.pago?.id}">${historialMembresiasInstance?.pago?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${historialMembresiasInstance?.usuario?.id}">${historialMembresiasInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
