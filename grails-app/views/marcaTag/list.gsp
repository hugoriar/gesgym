
<%@ page import="org.control.tag.MarcaTag" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'marcaTag.label', default: 'MarcaTag')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-marcaTag" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'marcaTag.nombre.label', default: 'Nombre')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${marcaTagInstanceList}" status="i" var="marcaTagInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${marcaTagInstance.id}">${fieldValue(bean: marcaTagInstance, field: "nombre")}</g:link></td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${marcaTagInstanceTotal}" />
	</div>
</section>

</body>

</html>
