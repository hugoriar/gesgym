
<%@ page import="org.control.tag.Tag" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'tag.label', default: 'Tag')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-tag" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<th><g:message code="tag.modelo.label" default="Modelo" /></th>
			
				<g:sortableColumn property="epc" title="${message(code: 'tag.epc.label', default: 'Epc')}" />
			
				<g:sortableColumn property="codigoTag" title="${message(code: 'tag.codigoTag.label', default: 'Codigo Tag')}" />
			
				<g:sortableColumn property="memoriaUsuario" title="${message(code: 'tag.memoriaUsuario.label', default: 'Memoria Usuario')}" />
			
				<th><g:message code="tag.estado.label" default="Estado" /></th>
			
				<g:sortableColumn property="descripcion" title="${message(code: 'tag.descripcion.label', default: 'Descripcion')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${tagInstanceList}" status="i" var="tagInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${tagInstance.id}">${fieldValue(bean: tagInstance, field: "modelo")}</g:link></td>
			
				<td>${fieldValue(bean: tagInstance, field: "epc")}</td>
			
				<td>${fieldValue(bean: tagInstance, field: "codigoTag")}</td>
			
				<td>${fieldValue(bean: tagInstance, field: "memoriaUsuario")}</td>
			
				<td>${fieldValue(bean: tagInstance, field: "estado")}</td>
			
				<td>${fieldValue(bean: tagInstance, field: "descripcion")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${tagInstanceTotal}" />
	</div>
</section>

</body>

</html>
