<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.gym.ubicacion.Ciudad" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'ciudad.label', default: 'Ciudad')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-ciudad" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ciudad.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: ciudadInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ciudad.comuna.label" default="Comuna" /></td>
				
				<td valign="top" class="value"><g:link controller="comuna" action="show" id="${ciudadInstance?.comuna?.id}">${ciudadInstance?.comuna}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="ciudad.sectores.label" default="Sectores" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${ciudadInstance.sectores}" var="s">
						<li><g:link controller="sector" action="show" id="${s.id}">${s}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
