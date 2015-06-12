
<%@ page import="org.control.Adjunto" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'adjunto.label', default: 'Adjunto')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-adjunto" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="nombre" title="${message(code: 'adjunto.nombre.label', default: 'Nombre')}" />
			
				<g:sortableColumn property="contentType" title="${message(code: 'adjunto.contentType.label', default: 'Content Type')}" />
			
				<g:sortableColumn property="peso" title="${message(code: 'adjunto.peso.label', default: 'Peso')}" />
			
				%{--<g:sortableColumn property="archivo" title="${message(code: 'adjunto.archivo.label', default: 'Archivo')}" />--}%
			
				<th><g:message code="adjunto.email.label" default="Email" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${adjuntoInstanceList}" status="i" var="adjuntoInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${adjuntoInstance.id}">${fieldValue(bean: adjuntoInstance, field: "nombre")}</g:link></td>
			
				<td>${fieldValue(bean: adjuntoInstance, field: "contentType")}</td>
			
				<td>${fieldValue(bean: adjuntoInstance, field: "peso")}</td>
			
				%{--<td>${fieldValue(bean: adjuntoInstance, field: "archivo")}</td>--}%
			
				<td>${fieldValue(bean: adjuntoInstance, field: "email")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${adjuntoInstanceTotal}" />
	</div>
</section>

</body>

</html>
