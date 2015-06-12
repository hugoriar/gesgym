
<%@ page import="org.control.ubicacion.Region" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'region.label', default: 'Region')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-region" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="region.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: regionInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="region.numero.label" default="Numero" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: regionInstance, field: "numero")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="region.provincias.label" default="Provincias" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${regionInstance.provincias}" var="p">
						<li><g:link controller="provincia" action="show" id="${p.id}">${p}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
