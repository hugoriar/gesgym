
<%@ page import="org.control.Visita" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'visita.label', default: 'Visita')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-visita" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="visita.usuario.label" default="Usuario" /></td>
				
				<td valign="top" class="value"><g:link controller="userSocio" action="show" id="${visitaInstance?.usuario?.id}">${visitaInstance?.usuario?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="visita.fechaDeVisita.label" default="Fecha De Visita" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${visitaInstance?.fechaDeVisita}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="visita.horaDeEntrada.label" default="Hora De Entrada" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${visitaInstance?.horaDeEntrada}" format="HH:mm"/></td>
				
			</tr>
		
			%{--<tr class="prop">
				<td valign="top" class="name"><g:message code="visita.horaDeSalida.label" default="Hora De Salida" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${visitaInstance?.horaDeSalida}" /></td>
				
			</tr>--}%
		
		</tbody>
	</table>
</section>

</body>

</html>
