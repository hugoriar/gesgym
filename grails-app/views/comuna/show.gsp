
<%@ page import="org.control.ubicacion.Comuna" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'comuna.label', default: 'Comuna')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-comuna" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comuna.ciudades.label" default="Ciudades" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${comunaInstance.ciudades}" var="c">
						<li><g:link controller="ciudad" action="show" id="${c.id}">${c}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comuna.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: comunaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="comuna.provincia.label" default="Provincia" /></td>
				
				<td valign="top" class="value"><g:link controller="provincia" action="show" id="${comunaInstance?.provincia?.id}">${comunaInstance?.provincia}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
