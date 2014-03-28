
<%@ page import="org.gym.Huella" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'huella.label', default: 'Huella')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-huella" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="huella.huerut.label" default="Huerut" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: huellaInstance, field: "huerut")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="huella.huehuella.label" default="Huehuella" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="huella.lastUpdated.label" default="Last Updated" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${huellaInstance?.lastUpdated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="huella.dateCreated.label" default="Date Created" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${huellaInstance?.dateCreated}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="huella.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${huellaInstance?.usuario?.id}">${huellaInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
