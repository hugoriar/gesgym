
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
    <custom:jasperForm controller="userSocio" action="generateReport" name="Contrato_${historialMembresiasInstance?.usuario?.rut+"-"+historialMembresiasInstance?.usuario?.dv}" id="${historialMembresiasInstance?.usuario?.id}" historialMembresiasInstanceId="${historialMembresiasInstance.id?:""}" jasper="datos_contrato" >
	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.plan.label" default="Plan" /></td>
				<td valign="top" class="value"><g:link controller="plan" action="show" id="${historialMembresiasInstance?.plan?.id}">${historialMembresiasInstance?.plan}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.diasCongelacion.label" default="Dias Congelacion" /></td>
				<td valign="top" class="value">${fieldValue(bean: historialMembresiasInstance, field: "diasCongelacion")}</td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.promocionDeMatricula.label" default="Promocion De Matricula" /></td>
				<td valign="top" class="value"><g:link controller="promocionMatricula" action="show" id="${historialMembresiasInstance?.promocionDeMatricula?.id}">${historialMembresiasInstance?.promocionDeMatricula}</g:link></td>
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
				<td valign="top" class="value"><g:link controller="userPersonal" action="show" id="${historialMembresiasInstance?.autorizadoPor?.id}">${historialMembresiasInstance?.autorizadoPor}</g:link></td>
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
				<td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${historialMembresiasInstance?.personalTrainerAsignado?.id}">${historialMembresiasInstance?.personalTrainerAsignado}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.pago.label" default="Pago" /></td>
				<td valign="top" class="value"><g:link controller="pago" action="show" id="${historialMembresiasInstance?.pago?.id}">${historialMembresiasInstance?.pago}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.matriculaMembresia.label" default="Matricula Membresia" /></td>
				<td valign="top" class="value"><g:link controller="matricula" action="show" id="${historialMembresiasInstance?.matricula?.id}">${historialMembresiasInstance?.matricula}</g:link></td>
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="historialMembresias.usuario.label" default="Usuario" /></td>
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${historialMembresiasInstance?.usuario?.id}">${historialMembresiasInstance?.usuario}</g:link></td>
			</tr>
		
		</tbody>
	</table>
    <custom:jasperButtons delimiter=" " target="_blank" imgSrc="contrato_anversoAm.png" controller="userSocio" action="generateReport" format="pdf" jasper="datos_contrato" text="Contrato (Anverso)" class="btn3d"/>
    <g:link action="downloadFile" id="contrato_reverso"><img border="0" src="${g.resource(dir: 'images/buttons', file: 'contrato_reversoAm.png')}"/></g:link>
    </custom:jasperForm>
</section>

</body>

</html>
