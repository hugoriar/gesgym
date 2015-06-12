
<%@ page import="org.control.DireccionEmpresa" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'direccionEmpresa?.label', default: 'DireccionEmpresa')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-direccionEmpresa" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.calleEmpresa.label" default="Calle Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionEmpresaInstance, field: "calleEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.numeroEmpresa.label" default="Numero Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionEmpresaInstance, field: "numeroEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.oficinaEmpresa.label" default="Oficina Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionEmpresaInstance, field: "oficinaEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.sectorEmpresa.label" default="Sector Empresa" /></td>
				
				<td valign="top" class="value"><g:link controller="sector" action="show" id="${direccionEmpresaInstance?.sectorEmpresa?.id}">${direccionEmpresaInstance?.sectorEmpresa}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.ciudadEmpresa.label" default="Ciudad Empresa" /></td>
				
				<td valign="top" class="value"><g:link controller="ciudad" action="show" id="${direccionEmpresaInstance?.ciudadEmpresa?.id}">${direccionEmpresaInstance?.ciudadEmpresa}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.codigoPostalEmpresa.label" default="Codigo Postal Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: direccionEmpresaInstance, field: "codigoPostalEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="direccionEmpresa.empresa.label" default="Empresa" /></td>
				
				<td valign="top" class="value"><g:link controller="empresa" action="show" id="${direccionEmpresaInstance?.empresa?.id}">${direccionEmpresaInstance?.empresa}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
