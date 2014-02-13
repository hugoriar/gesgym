
<%@ page import="org.gym.fichaMedica.Profesional" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'profesional.label', default: 'Profesional')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-profesional" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="profesional.nombreProfesional.label" default="Nombre Profesional" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: profesionalInstance, field: "nombreProfesional")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="profesional.fonoProfesional.label" default="Fono Profesional" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: profesionalInstance, field: "fonoProfesional")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="profesional.especializacionProfesional.label" default="Especializacion Profesional" /></td>
				
				<td valign="top" class="value"><g:link controller="especializacion" action="show" id="${profesionalInstance?.especializacionProfesional?.id}">${profesionalInstance?.especializacionProfesional}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="profesional.fichasMedicasProfesional.label" default="Fichas Medicas Profesional" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${profesionalInstance.fichasMedicasProfesional}" var="f">
						<li><g:link controller="fichaMedica" action="show" id="${f.id}">${f}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
