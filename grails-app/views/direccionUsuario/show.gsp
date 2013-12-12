
<%@ page import="org.gym.DireccionUsuario" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'direccionUsuario.label', default: 'DireccionUsuario')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-direccionUsuario" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.calleUsuario.label" default="Calle Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionUsuarioInstance, field: "calleUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.numeroUsuario.label" default="Numero Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionUsuarioInstance, field: "numeroUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.departamentoUsuario.label" default="Departamento Usuario" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionUsuarioInstance, field: "departamentoUsuario")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.sectorUsuario.label" default="Sector Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="sector" action="show" id="${direccionUsuarioInstance?.sectorUsuario?.id}">${direccionUsuarioInstance?.sectorUsuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.ciudadUsuario.label" default="Ciudad Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="ciudad" action="show" id="${direccionUsuarioInstance?.ciudadUsuario?.id}">${direccionUsuarioInstance?.ciudadUsuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionUsuario.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="user" action="show" id="${direccionUsuarioInstance?.usuario?.id}">${direccionUsuarioInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
