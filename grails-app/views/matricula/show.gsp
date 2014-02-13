
<%@ page import="org.gym.Matricula" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'matricula.label', default: 'Matricula')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-matricula" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.fechaMatricula.label" default="Fecha Matricula" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${matriculaInstance?.fechaMatricula}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.matriculadoPor.label" default="Matriculado Por" /></td>
				
				<td valign="top" class="value"><g:link controller="userPersonal" action="show" id="${matriculaInstance?.matriculadoPor?.id}">${matriculaInstance?.matriculadoPor}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.referidoPor.label" default="Referido Por" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${matriculaInstance?.referidoPor?.id}">${matriculaInstance?.referidoPor}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${matriculaInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.pagoMatricula.label" default="Pago Matricula" /></td>
				
				<td valign="top" class="value"><g:link controller="pago" action="show" id="${matriculaInstance?.pagoMatricula?.id}">${matriculaInstance?.pagoMatricula}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.observacionesMatricula.label" default="Observaciones Matricula" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: matriculaInstance, field: "observacionesMatricula")}</td>
				
			</tr>
		
			%{--<tr class="prop">
				<td valign="top" class="name"><g:message code="matricula.socio.label" default="Socio" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${userSocioInstance?.id}">${matriculaInstance}</g:link></td>
				
			</tr>--}%
		
		</tbody>
	</table>
</section>

</body>

</html>
