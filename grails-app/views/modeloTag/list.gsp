
<%@ page import="org.control.tag.ModeloTag" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'modeloTag.label', default: 'ModeloTag')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-modeloTag" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="codigoModeloTag" title="${message(code: 'modeloTag.codigoModeloTag.label', default: 'Codigo Modelo Tag')}" />
			
				<g:sortableColumn property="nombre" title="${message(code: 'modeloTag.nombre.label', default: 'Nombre')}" />
			
				<th><g:message code="modeloTag.marca.label" default="Marca" /></th>
			
				<g:sortableColumn property="bitsMemoriaEpc" title="${message(code: 'modeloTag.bitsMemoriaEpc.label', default: 'Bits Memoria Epc')}" />
			
				<g:sortableColumn property="bitsMemoriaUsuario" title="${message(code: 'modeloTag.bitsMemoriaUsuario.label', default: 'Bits Memoria Usuario')}" />
			
				<g:sortableColumn property="foto" title="${message(code: 'modeloTag.foto.label', default: 'Foto')}" />
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${modeloTagInstanceList}" status="i" var="modeloTagInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${modeloTagInstance.id}">${fieldValue(bean: modeloTagInstance, field: "codigoModeloTag")}</g:link></td>
			
				<td>${fieldValue(bean: modeloTagInstance, field: "nombre")}</td>
			
				<td>${fieldValue(bean: modeloTagInstance, field: "marca")}</td>
			
				<td>${fieldValue(bean: modeloTagInstance, field: "bitsMemoriaEpc")}</td>
			
				<td>${fieldValue(bean: modeloTagInstance, field: "bitsMemoriaUsuario")}</td>
			
				<td>${fieldValue(bean: modeloTagInstance, field: "foto")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${modeloTagInstanceTotal}" />
	</div>
</section>

</body>

</html>
