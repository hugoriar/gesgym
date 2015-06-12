
<%@ page import="org.control.PromocionMatricula" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'promocionMatricula.label', default: 'PromocionMatricula')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-promocionMatricula" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: promocionMatriculaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.fechaInicioVigencia.label" default="Fecha Inicio Vigencia" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${promocionMatriculaInstance?.fechaInicioVigencia}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.fechaTerminoVigencia.label" default="Fecha Termino Vigencia" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${promocionMatriculaInstance?.fechaTerminoVigencia}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: promocionMatriculaInstance, field: "descripcion")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${promocionMatriculaInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${promocionMatriculaInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="promocionMatricula.vigente.label" default="Vigente" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${promocionMatriculaInstance?.vigente}" /></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
