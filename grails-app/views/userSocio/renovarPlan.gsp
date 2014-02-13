
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
	<table class="table">
		<tbody>
			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.nombre.label" default="Nombre" /></td>
				<td valign="top" class="value">${fieldValue(bean: userSocioInstance, field: "nombre")} ${fieldValue(bean: userSocioInstance, field: "apellidoPaterno")} ${fieldValue(bean: userSocioInstance, field: "apellidoMaterno")} (${fieldValue(bean: userSocioInstance, field: "rut")}-${fieldValue(bean: userSocioInstance, field: "dv")})</td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name"><g:message code="userSocio.historialMembresias.label" default="Historial Membresias" /></td>
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${userSocioInstance.historialMembresias}" var="h">
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
                %{--<g:if test="${historialMembresiasInstance?.diasCongelacion}">
                    ${fieldValue(bean: historialMembresiasInstance, field: "diasCongelacion")}
                </g:if>--}%
            </td>
        </tr>

        <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.fechaInicio.label" default="Fecha de Vigencia Plan Actual" /></td>
            <td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.fechaInicio}" /> al <g:formatDate date="${historialMembresiasInstance?.fechaFin}" /></td>
        </tr>

       %{-- <tr class="prop">
            <td valign="top" class="name"><g:message code="historialMembresias.fechaFin.label" default="Fecha Fin" /></td>
            <td valign="top" class="value"><g:formatDate date="${historialMembresiasInstance?.fechaFin}" /></td>
        </tr>--}%

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
	</table>

    <g:form action="renuevaPlan" class="form-horizontal">
        <g:hiddenField name="id" value="${userSocioInstance?.id}" />
        <g:hiddenField name="version" value="${userSocioInstance?.version}" />
        <g:hiddenField name="matriculaInstanceId" value="${matriculaInstanceId}" />
        <fieldset class="form">
            <legend>Detalles de la renovación del Plan</legend>
            <g:render template="/historialMembresias/form"/>
        </fieldset>

        <fieldset class="form">
            <legend>Detalles del pago del Plan</legend>
            <g:render template="/pago/form"/>
        </fieldset>

        <div class="form-actions">
            <g:submitButton name="agregarPlan" class="btn btn-primary" value="${message(code: 'default.button.agregarPlan.label', default: 'Agregar Plan')}" />
            <button class="btn" type="reset"><g:message code="default.button.reset.label" default="Reset" /></button>
        </div>
    </g:form>
</section>
</body>

</html>
