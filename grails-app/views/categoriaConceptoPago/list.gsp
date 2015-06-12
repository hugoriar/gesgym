
<%@ page import="org.control.CategoriaConceptoPago" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'categoriaConceptoPago.label', default: 'CategoriaConceptoPago')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-categoriaConceptoPago" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${categoriaConceptoPagoInstanceList}" status="i" var="categoriaConceptoPagoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${categoriaConceptoPagoInstanceTotal}" />
	</div>
</section>

</body>

</html>
