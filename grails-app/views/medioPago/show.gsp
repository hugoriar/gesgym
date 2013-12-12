
<%@ page import="org.gym.MedioPago" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'medioPago.label', default: 'MedioPago')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-medioPago" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="medioPago.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: medioPagoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="medioPago.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: medioPagoInstance, field: "descripcion")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
