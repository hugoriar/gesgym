
<%@ page import="org.gym.Banco" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'banco.label', default: 'Banco')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-banco" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="banco.nombreBanco.label" default="Nombre Banco" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: bancoInstance, field: "nombreBanco")}</td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>
