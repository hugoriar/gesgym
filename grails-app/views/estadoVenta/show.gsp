
<%@ page import="org.gym.ventas.EstadoVenta" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'estadoVenta.label', default: 'EstadoVenta')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-estadoVenta" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoVenta.codigo.label" default="Codigo" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoVentaInstance, field: "codigo")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoVenta.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoVentaInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="estadoVenta.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: estadoVentaInstance, field: "descripcion")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
