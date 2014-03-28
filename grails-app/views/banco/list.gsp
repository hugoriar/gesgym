
<%@ page import="org.gym.Banco" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'banco.label', default: 'Banco')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-banco" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombreBanco" title="${message(code: 'banco.nombreBanco.label', default: 'Nombre Banco')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${bancoInstanceList}" status="i" var="bancoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${bancoInstance.id}">${fieldValue(bean: bancoInstance, field: "nombreBanco")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${bancoInstanceTotal}" />
	</div>
</section>

</body>

</html>
