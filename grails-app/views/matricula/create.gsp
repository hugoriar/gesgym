<%@ page import="java.text.SimpleDateFormat; org.control.Matricula" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'matricula.label', default: 'Matricula')}" />
    <g:set var="layout_nosecondarymenu"	value="${true}" scope="request"/>
	<title><g:message code="default.create.label" args="[entityName]" /></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'util.css')}" type="text/css">
    <r:require modules="datepicker"/>
    %{--<webcam:head/>--}%
    %{--<resource:lightBox labelImage="Bild" labelOf="von" />--}%

    <script>

        $(document).ready(function(){
            $('#fechaMatricula').datepicker()
        });

    </script>

</head>

<body>

<section id="create-matricula" class="first">

	<g:hasErrors bean="${matriculaInstance}">
	<div class="alert alert-error">
		<g:renderErrors bean="${matriculaInstance}" as="list" />
	</div>
	</g:hasErrors>

    %{--<table class="table">
        <tbody>
        <tr class="prop">
            <td valign="top" class="name"><g:message code="userSocio.nombre.label" default="Nombre" /></td>
            <td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "nombre")} ${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")} ${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")} (${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")})</td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /></td>
            <td valign="top" style="text-align: left;" class="value">
                <ul>
                    <g:each in="${userSocioInstance?.historialMembresias}" var="h">
                        <li><g:link controller="historialMembresias" action="show" id="${h.id}">${h}</g:link></li>
                    </g:each>
                </ul>
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.plan.label" default="Plan Actual" /></td>
            <td valign="top" class="value"><g:link controller="plan" action="show" id="${historialMembresiasInstance?.plan?.id}">${historialMembresiasInstance?.plan}</g:link></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.diasCongelacion.label" default="Días Congelación" /></td>
            <td valign="top" class="value">
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.fechaInicio.label" default="Fecha de Vigencia Plan Actual" /></td>
            <td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.fechaInicio}" /> al <g:formatDate date="${historialMembresiasInstance?.fechaFin}" /></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.autorizadoPor.label" default="Autorizado Por" /></td>
            <td valign="top" class="value"><g:link controller="userPersonal" action="show" id="${historialMembresiasInstance?.autorizadoPor?.id}">${historialMembresiasInstance?.autorizadoPor}</g:link></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.personalTrainerAsignado.label" default="Personal Trainer Asignado" /></td>
            <td valign="top" class="value"><g:link controller="userPersonalInstructor" action="show" id="${historialMembresiasInstance?.personalTrainerAsignado?.id}">${historialMembresiasInstance?.personalTrainerAsignado}</g:link></td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.pago.label" default="Pago" /></td>
            <td valign="top" class="value"><g:link controller="pago" action="show" id="${historialMembresiasInstance?.pago?.id}">${historialMembresiasInstance?.pago}</g:link></td>
        </tr>
        </tbody>
    </table>--}%
	
	<g:form action="save" class="form-horizontal" enctype="multipart/form-data">
	%{--<g:form action="save" class="form-horizontal" onsubmit="return alerta();" >--}%
        <g:hiddenField name="socio.id" value="${userSocioInstance?.id}" />
        <g:hiddenField name="next" value="${next}" />
        <g:hiddenField name="id" value="${params.id}" />
		<fieldset class="form">
            <legend>Datos de Matrícula</legend>
			<g:render template="form"/>
		</fieldset>
		<div class="form-actions">
            <g:submitButton name="createAndContinue" class="btn btn-primary" value="${message(code: 'default.button.createAndContinue.label', default: 'Crear y Continuar')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
		</div>
	</g:form>
	
</section>
		
</body>



</html>


