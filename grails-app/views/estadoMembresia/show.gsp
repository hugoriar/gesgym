
<%@ page import="org.gym.EstadoMembresia" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoMembresia.label', default: 'EstadoMembresia')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-estadoMembresia" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoMembresia.estado.label" default="Estado" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoMembresiaInstance, field: "estado")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoMembresia.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoMembresiaInstance, field: "descripcion")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
