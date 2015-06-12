
<%@ page import="org.control.ubicacion.Provincia" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'provincia.label', default: 'Provincia')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-provincia" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="provincia.comunas.label" default="Comunas" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${provinciaInstance.comunas}" var="c">
						<li><g:link controller="comuna" action="show" id="${c.id}">${c}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="provincia.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: provinciaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="provincia.region.label" default="Region" /></td>
				
				<td valign="top" class="value"><g:link controller="region" action="show" id="${provinciaInstance?.region?.id}">${provinciaInstance?.region}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
