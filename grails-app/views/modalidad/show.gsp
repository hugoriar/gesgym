
<%@ page import="org.gym.Modalidad" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'modalidad.label', default: 'Modalidad')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-modalidad" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modalidad.modalidad.label" default="Modalidad" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modalidadInstance, field: "modalidad")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="modalidad.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: modalidadInstance, field: "descripcion")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
