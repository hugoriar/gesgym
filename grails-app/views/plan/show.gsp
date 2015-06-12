
<%@ page import="org.control.Plan" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'plan.label', default: 'Plan')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-plan" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: planInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.diasMembresia.label" default="Dias Membresia" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: planInstance, field: "diasMembresia")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.diasCongelacion.label" default="Dias Congelacion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: planInstance, field: "diasCongelacion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.fechaInicioVigencia.label" default="Fecha Inicio Vigencia" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planInstance?.fechaInicioVigencia}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.fechaTerminoVigencia.label" default="Fecha Termino Vigencia" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planInstance?.fechaTerminoVigencia}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.valor.label" default="Valor" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: planInstance, field: "valor")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: planInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${planInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="plan.vigente.label" default="Vigente" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${planInstance?.vigente}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
