
<%@ page import="org.control.Empresa" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-empresa" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="empresa.nombreEmpresa.label" default="Nombre Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: empresaInstance, field: "nombreEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="empresa.direccionEmpresa.label" default="Direccion Empresa" /></td>
				
				<td valign="top" class="value"><g:link controller="direccionEmpresa" action="show" id="${empresaInstance?.direccionEmpresa?.id}">${empresaInstance?.direccionEmpresa?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="empresa.fonoEmpresa.label" default="Fono Empresa" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: empresaInstance, field: "fonoEmpresa")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="empresa.usuarios.label" default="Usuarios" /></td>
				
				<td valign="top" style="text-align: left;" class="value">
					<ul>
					<g:each in="${empresaInstance.usuarios}" var="u">
						<li><g:link controller="user" action="show" id="${u.id}">${u?.encodeAsHTML()}</g:link></li>
					</g:each>
					</ul>
				</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
