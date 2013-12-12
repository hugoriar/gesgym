
<%@ page import="org.gym.Parentesco" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'parentesco.label', default: 'Parentesco')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-parentesco" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="parentesco.nombre.label" default="Nombre" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: parentescoInstance, field: "nombre")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="parentesco.descripcion.label" default="Descripcion" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: parentescoInstance, field: "descripcion")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
