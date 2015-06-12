
<%@ page import="org.control.LogAtributo" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'logAtributo.label', default: 'LogAtributo')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-logAtributo" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logAtributo.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logAtributoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logAtributo.nombreReal.label" default="Nombre Real" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: logAtributoInstance, field: "nombreReal")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logAtributo.esIndice.label" default="Es Indice" /></td>
				
				<td valign="top" class="value"><g:formatBoolean boolean="${logAtributoInstance?.esIndice}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="logAtributo.entidad.label" default="Entidad" /></td>
				
				<td valign="top" class="value"><g:link controller="logEntidad" action="show" id="${logAtributoInstance?.entidad?.id}">${logAtributoInstance?.entidad?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
