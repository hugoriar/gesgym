
<%@ page import="org.control.fichaMedica.CondicionMedica" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'condicionMedica.label', default: 'CondicionMedica')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-condicionMedica" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="condicionMedica.condicion.label" default="Condicion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: condicionMedicaInstance, field: "condicion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="condicionMedica.profesional.label" default="Profesional" /></td>
				
				<td valign="top" class="value"><g:link controller="profesional" action="show" id="${condicionMedicaInstance?.profesional?.id}">${condicionMedicaInstance?.profesional}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="condicionMedica.medicamento.label" default="Medicamento" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: condicionMedicaInstance, field: "medicamento")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
